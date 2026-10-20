#include "sim.h"
#include "dpi.h"

#include <cstdio>
#include "Vtop.h"
#include "verilated.h"

static bool verbose = true;

void sim_set_verbose(bool enabled)
{
    verbose = enabled;
    dpi_set_verbose(enabled);
}

// 波形相关对象只在带 FST 的构建中存在。
#if VM_TRACE_FST
#include "verilated_fst_c.h"
#include <memory>
static std::unique_ptr<VerilatedFstC> wave_trace;
static bool wave_open = false;
#endif

// 执行电路求值，按需记录波形，同时推进仿真时间。
static void eval_step(Vtop& dut)
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
bool sim_init(Vtop& dut, const char* wave_path)
{
    dpi_reset();
    dut.contextp()->gotFinish(false);

    dut.clk = 0;
    dut.rst = 1;

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
void sim_reset(Vtop& dut)
{
    dut.rst = 1;

    dut.clk = 0;
    eval_step(dut);

    dut.clk = 1;
    eval_step(dut);

    dut.rst = 0;
    eval_step(dut);
}

bool sim_step(Vtop& dut)
{
    if (dut.contextp()->gotFinish()) return true;

    dut.clk = 0;
    eval_step(dut);

    const uint32_t old_pc = dut.pc;

    if ((old_pc & 3u) != 0) {
        std::fprintf(stderr, "unaligned fetch: pc=0x%08x\n", old_pc);
        return false;
    }

    // 低电平求值后，IFU 已通过 DPI-C 取出指令，组合译码也已稳定。
    const uint32_t inst = dut.inst;

    if (dut.illegal) {
        std::fprintf(stderr, "illegal inst: pc=0x%08x inst=0x%08x\n",
                     old_pc, inst);
        return false;
    }

    dut.clk = 1;
    eval_step(dut);

    if (verbose)
        std::printf("pc=0x%08x inst=0x%08x --> next_pc=0x%08x\n",
                    old_pc, inst, static_cast<uint32_t>(dut.pc));
    return true;
}

bool sim_halted()
{
    return dpi_halted();
}

uint32_t sim_halt_pc()
{
    return dpi_halt_pc();
}

void sim_close(Vtop& dut)
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
