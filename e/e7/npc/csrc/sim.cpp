#include "cpu_view.h"
#include "sim.h"
#include "dpi.h"
#include "pmem.h"

#include <cstdio>
#include <cstdlib>
#include "Vysyx_00000000.h"
#include "verilated.h"

static bool verbose = true;
static uint64_t g_cycles = 0;
static uint64_t g_attempts = 0;
static uint32_t last_pc = 0, last_inst = 0;
static bool finish_reported = false;
static bool ifu_pending = false;       // 是否有尚未回复的请求
static uint32_t ifu_saved_addr = 0;    // 已接收请求的地址
static unsigned ifu_wait_left = 0;     // 距离回复还需等待的周期数
// 保存尚未完成的数据访存请求
static bool lsu_pending = false;
static bool lsu_saved_wen = false;
static uint32_t lsu_saved_addr = 0;
static uint32_t lsu_saved_wdata = 0;
static uint8_t lsu_saved_wmask = 0;
static unsigned lsu_wait_left = 0;

// 置 true 开启随机回复；关闭时固定 1 拍回复
static unsigned fixed_mem_delay = 0;

unsigned sim_memory_delay() { return fixed_mem_delay; }

// 非零初值；固定初值使测试可以复现
static uint16_t mem_lfsr = 0xACE1u;

// 每接收一次请求，推进一次 LFSR，生成 1～20 拍延迟
static unsigned next_mem_delay()
{
    if (fixed_mem_delay != 0) return fixed_mem_delay;

    const bool low_bit = (mem_lfsr & 1u) != 0;
    mem_lfsr >>= 1;

    if (low_bit)
        mem_lfsr ^= 0xB400u;

    return 1u + (mem_lfsr % 20u);
}

uint64_t sim_cycles()
{
    return g_cycles;
}

void sim_set_verbose(bool enabled)
{
    verbose = enabled;
    dpi_set_verbose(enabled);
}

static uint64_t g_instructions = 0;

uint64_t sim_instructions()
{
    return g_instructions;
}

// 波形相关对象只在带 FST 的构建中存在。
#if VM_TRACE_FST
#include "verilated_fst_c.h"
#include <memory>
static std::unique_ptr<VerilatedFstC> wave_trace;
static bool wave_open = false;
#endif

// 执行电路求值，按需记录波形，同时推进仿真时间。
static void eval_step(Vysyx_00000000& dut)
{
    dut.eval();


#if VM_TRACE_FST
    if (wave_open) {
        wave_trace->dump(dut.contextp()->time());
    }
#endif

    dut.contextp()->timeInc(1);
}

// 初始化结束状态，并按需打开 FST；ebreak 回调只在 dpi.cpp 定义。
static bool init_sim(Vysyx_00000000& dut, const char* wave_path)
{
    finish_reported = false;
    fixed_mem_delay = 0;
    if (const char* setting = std::getenv("NPC_MEM_DELAY")) {
        char* end = nullptr;
        const unsigned long value = std::strtoul(setting, &end, 10);
        if (end == setting || *end != '\0' || value > 20) {
            std::fprintf(stderr, "NPC_MEM_DELAY 必须为 0（随机）或 1～20（固定拍数）\n");
            return false;
        }
        fixed_mem_delay = static_cast<unsigned>(value);
    }
    dpi_reset();
    dut.contextp()->gotFinish(false);

    dut.clock = 0;
    dut.reset = 1;
    dut.io_ifu_rdata = 0;
    dut.io_lsu_rdata = 0;
    dut.io_ifu_respValid = 0;
    dut.io_lsu_respValid = 0;

#if VM_TRACE_FST
    if (wave_path != nullptr && wave_path[0] != '\0') {
        wave_trace = std::make_unique<VerilatedFstC>();
        dut.trace(wave_trace.get(), 99);
        wave_trace->open(wave_path);

        if (!wave_trace->isOpen()) {
            std::fprintf(stderr, "cannot open waveform: %s\n", wave_path);
            return false;
        }

        wave_open = true;
        std::printf("Waveform: %s\n", wave_path);
    }
#else
    (void)wave_path;
#endif

    return true;
}

// 通过一个上升沿复位 PC。
static void reset_sim(Vysyx_00000000& dut)
{
    g_cycles = 0;
    g_attempts = 0;
    last_pc = last_inst = 0;
    g_instructions = 0;
    dut.reset = 1;
    ifu_pending = false;
    ifu_saved_addr = 0;
    ifu_wait_left = 0;
    lsu_pending = false;
    lsu_saved_wen = false;
    lsu_saved_addr = 0;
    lsu_saved_wdata = 0;
    lsu_saved_wmask = 0;
    lsu_wait_left = 0;
    mem_lfsr = 0xACE1u;

    dut.clock = 0;
    eval_step(dut);

    dut.clock = 1;
    eval_step(dut);

    dut.reset = 0;
    dut.io_ifu_rdata = 0;
    dut.io_lsu_rdata = 0;
    dut.io_ifu_respValid = 0;
    dut.io_lsu_respValid = 0;
    eval_step(dut);
}

step_event sim_session::step()
{
    auto& dut = *dut_;
    if (dut.contextp()->gotFinish()) {
        if (!finish_reported) {
            std::fprintf(stderr, "step called after finish\n");
            finish_reported = true;
        }
        return step_event::waiting;
    }

    dut.clock = 0;
    eval_step(dut);

    const bool executing = npc::commit(dut);
    const uint32_t old_pc = npc::pc(dut);
    const uint32_t inst = npc::inst(dut);
    last_pc = old_pc;
    last_inst = inst;
    if (executing || npc::illegal(dut)) ++g_attempts;

    if ((old_pc & 3u) != 0) {
        return step_event::fault;
    }

    if (npc::illegal(dut)) {
        return step_event::rejected;
    }

    // 存储器采样本拍取指地址
    bool fetch_resp = false;
    uint32_t fetched_inst = dut.io_ifu_rdata;

    // 接受一次请求, 保存地址并启动计数
    if (!ifu_pending && dut.io_ifu_reqValid) {
        ifu_pending = true;
        ifu_saved_addr = dut.io_ifu_addr;
        ifu_wait_left = next_mem_delay();
    }

    // 接受请求的一拍也记入delay
    if (ifu_pending) {
        -- ifu_wait_left;

        if (ifu_wait_left == 0) {
            fetched_inst = 
                static_cast<uint32_t>(pmem_read(static_cast<int>(ifu_saved_addr)));
            fetch_resp = true;
            ifu_pending = false;
        }
    }
    
    // 接收请求时保存全部信息，等待期间不重复接收
    if (!lsu_pending && dut.io_lsu_reqValid) {
        lsu_pending = true;
        lsu_saved_wen = dut.io_lsu_wen;
        lsu_saved_addr = dut.io_lsu_addr;
        lsu_saved_wdata = dut.io_lsu_wdata;
        lsu_saved_wmask = dut.io_lsu_wmask;
        lsu_wait_left = next_mem_delay();
    }

    // 默认不回复、不写内存，读数据保持原值
    bool data_resp = false;
    bool write_enable = false;
    uint32_t fetched_data = dut.io_lsu_rdata;

    // 接收请求的这一拍也计入延迟
    if (lsu_pending) {
        --lsu_wait_left;

        if (lsu_wait_left == 0) {
            if (lsu_saved_wen) {
                write_enable = true;
            } else {
                fetched_data = static_cast<uint32_t>(
                    pmem_read(static_cast<int>(lsu_saved_addr)));
            }

            data_resp = true;
            lsu_pending = false;
        }
    }

    dut.clock = 1;
    dut.eval();
    ++g_cycles;

    if (executing) ++g_instructions;

    // 延迟结束后完成一次写操作，再向 CPU 回复
    if (write_enable) {
        pmem_write(static_cast<int>(lsu_saved_addr),
                   static_cast<int>(lsu_saved_wdata),
                   static_cast<char>(lsu_saved_wmask));
    }

    // 存储器更新返回数据
    dut.io_ifu_rdata = fetched_inst;
    dut.io_ifu_respValid = fetch_resp;
    dut.io_lsu_rdata = fetched_data;
    dut.io_lsu_respValid = data_resp;
    eval_step(dut);

    if (verbose && executing) {
        std::printf("pc=0x%08x inst=0x%08x --> next_pc=0x%08x\n",
                    old_pc, inst, static_cast<uint32_t>(npc::pc(dut)));
    }

    if (sim_halted()) return step_event::halted;
    return executing ? step_event::committed : step_event::waiting;
}

bool sim_halted()
{
    return dpi_halted();
}

uint32_t sim_halt_pc()
{
    return dpi_halt_pc();
}

static void close_sim(Vysyx_00000000& dut)
{
    dut.final();

#if VM_TRACE_FST
    if (wave_open) {
        wave_trace->close();
        wave_open = false;
    }
    // 必须在 dut 和它的上下文析构前销毁波形对象。
    wave_trace.reset();
#endif
}


// session 只绑定一台 DUT，销毁时沿用原 sim_close 的清理顺序。
sim_session::~sim_session()
{
    if (dut_ != nullptr) close_sim(*dut_);
}

bool sim_session::init(Vysyx_00000000& dut, const char* wave_path)
{
    dut_ = &dut;
    return init_sim(dut, wave_path);
}

void sim_session::reset() { reset_sim(*dut_); }
bool sim_session::halted() const { return sim_halted(); }
uint32_t sim_session::halt_pc() const { return sim_halt_pc(); }
uint64_t sim_session::cycles() const { return g_cycles; }
uint64_t sim_session::retired() const { return g_instructions; }
uint64_t sim_session::attempts() const { return g_attempts; }
unsigned sim_session::mem_delay() const { return fixed_mem_delay; }

run_result sim_session::result(stop_reason reason) const
{
    uint32_t pc = last_pc, inst = last_inst;
    if (reason == stop_reason::ebreak) pc = sim_halt_pc();
    if (reason == stop_reason::cycle_limit || reason == stop_reason::attempt_limit) {
        pc = npc::pc(*dut_);
        inst = npc::inst(*dut_);
    }
    return {reason, pc, inst, g_cycles, g_instructions, g_attempts, fixed_mem_delay};
}


// RESULT 只描述这次运行；各入口传入自己的最终判定。
static const char* stop_name(stop_reason reason)
{
    switch (reason) {
    case stop_reason::running: return "running";
    case stop_reason::ebreak: return "ebreak";
    case stop_reason::rejected: return "rejected";
    case stop_reason::fetch_unaligned: return "fetch_unaligned";
    case stop_reason::cycle_limit: return "cycle_limit";
    case stop_reason::attempt_limit: return "attempt_limit";
    case stop_reason::external_finish: return "external_finish";
    case stop_reason::comparison_mismatch: return "comparison_mismatch";
    case stop_reason::reference_fault: return "reference_fault";
    }
    return "running";
}

void sim_print_result(const char* case_name, const char* backend,
                      const run_result& run, bool passed,
                      unsigned checks, unsigned failures, const char* extra)
{
    char delay[16] = "random";
    if (run.mem_delay != 0)
        std::snprintf(delay, sizeof(delay), "fixed:%u", run.mem_delay);
    std::printf("RESULT case=%s backend=%s verdict=%s stop=%s pc=0x%08x inst=0x%08x "
                "cycles=%llu retired=%llu attempts=%llu checks=%u failures=%u delay=%s%s%s\n",
                case_name, backend, passed ? "pass" : "fail", stop_name(run.reason),
                run.stop_pc, run.stop_inst,
                static_cast<unsigned long long>(run.cycles),
                static_cast<unsigned long long>(run.retired),
                static_cast<unsigned long long>(run.attempts), checks, failures, delay,
                extra != nullptr && extra[0] != '\0' ? " " : "",
                extra != nullptr ? extra : "");
}
