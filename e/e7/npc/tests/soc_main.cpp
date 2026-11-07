#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <cstdlib>

#include "verilated.h"
#include "verilated_fst_c.h"
#include "VSimTop.h"
#include "VSimTop__Dpi.h"
#include "VSimTop___024root.h"

#ifdef CONFIG_NVBOARD
#include <nvboard.h>
void nvboard_bind_all_pins(VSimTop* top);
#endif

// 16MB Flash
static constexpr uint32_t FLASH_SIZE = 16u * 1024 * 1024;
static uint8_t flash[FLASH_SIZE];

static bool load_flash(const char* path)
{
    FILE *fp = std::fopen(path, "rb");
    if (!fp) {
        std::perror(path);
        return false;
    }

    if (std::fseek(fp, 0, SEEK_END) != 0) {
        std::fclose(fp);
        return false;
    }

    const long size = std::ftell(fp);
    if (size <= 0 || size > static_cast<long>(FLASH_SIZE)) {
        std::fprintf(stderr, "Flash 镜像大小无效：%ld\n", size);
        std::fclose(fp);
        return false;
    }

    std::rewind(fp);
    const size_t loaded =
        std::fread(flash, 1, static_cast<size_t>(size), fp);
    std::fclose(fp);

    if (loaded != static_cast<size_t>(size)) {
        std::fprintf(stderr, "Flash 镜像读取不完整\n");
        return false;
    }

    std::printf("Loaded Flash: %s, %zu bytes\n", path, loaded);
    return true;
}

extern "C" void flash_read(int32_t addr, int32_t *data)
{
    const uint32_t offset = static_cast<uint32_t>(addr);

    assert(offset <= FLASH_SIZE - sizeof(*data));
    std::memcpy(data, flash + offset, sizeof(*data));
}

// 记录程序结束事件及其指令地址
static bool halted = false;
static uint32_t halt_pc = 0;

extern "C" void ebreak(int pc)
{
    halted = true;
    halt_pc = static_cast<uint32_t>(pc);
}

int main(int argc, char** argv)
{

    if (argc < 2) {
        std::fprintf(stderr, "用法：%s 镜像.bin [波形.fst]\n", argv[0]);
        return 1;
    }

    if (!load_flash(argv[1]))
        return 1;

    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    ctx.traceEverOn(true);

    VSimTop dut{&ctx};
    VerilatedFstC wave;
    const bool tracing = argc > 2;

    if (tracing) {
        dut.trace(&wave, 99);
        wave.open(argv[2]);
    }

    // 初始化所有外部输入。
    dut.clock = 0;
    dut.cpuClock = 0;
    dut.reset = 1;
    dut.coreSel = 0;
    dut.externalPins_mygpio_in = 0;
    dut.externalPins_uart0_rx = 1;

    #ifdef CONFIG_NVBOARD
    nvboard_bind_all_pins(&dut);
    nvboard_init();
    #endif

    bool trace_started = false;
    uint64_t trace_start_time = 0;

    auto eval_step = [&]() {
        dut.eval();
        if (tracing) {
            const uint32_t pc = dut.rootp->
                SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__pc;

            // 第一次进入 PSRAM 后，记录约一万拍
            if (!trace_started &&
                pc >= 0x80000000u && pc < 0x80800000u) {
                trace_started = true;
                trace_start_time = ctx.time();
            }

            if (trace_started &&
                ctx.time() - trace_start_time < 20000) {
                wave.dump(ctx.time());
            }
        }
        ctx.timeInc(1);
    };

    uint64_t commits = 0;
    // 负向验收可继续观察拒绝状态；默认仍立即报错退出。
    const bool observe_rejection = std::getenv("NPC_CONTINUE_ON_REJECT") &&
        std::strcmp(std::getenv("NPC_CONTINUE_ON_REJECT"), "1") == 0;
    bool rejected = false;
    uint32_t rejected_pc = 0, rejected_inst = 0;
    // 默认CPU300MHz、外设25MHz；基线验收可显式选择倍率1。
    const char* ratio_env = std::getenv("NPC_CPU_CLOCK_RATIO");
    const unsigned cpu_clock_ratio = ratio_env ? std::strtoul(ratio_env, nullptr, 10) : 12;
    if (cpu_clock_ratio == 0 || cpu_clock_ratio > 1000) {
        std::fprintf(stderr, "无效NPC_CPU_CLOCK_RATIO\n");
        return 1;
    }
    std::fprintf(stderr, "Clock configuration: CPU/SoC=%u:1\n", cpu_clock_ratio);
    unsigned clock_phase_index = 0;
    bool soc_clock_high = false;

    // 每次调用, 推进一个CPU半周期对应的外设时钟相位
    auto advance_soc_clock = [&]() {
        // 与原相位除法完全相同：每ratio个CPU半周期翻转一次，省去热循环整数除法。
        if (clock_phase_index == cpu_clock_ratio) {
            clock_phase_index = 0;
            soc_clock_high = !soc_clock_high;
        }
        dut.clock = soc_clock_high;
        ++clock_phase_index;
    };

    // 推进一个CPU 半周期, 再求值
    auto clock_half_cycle = [&](bool cpu_high) {
        const bool soc_was_high = dut.clock;

        dut.cpuClock = cpu_high;
        advance_soc_clock();
        eval_step();

        // 每个时钟外设时钟周期只更新一次NVBoard
        if (!soc_was_high && dut.clock) {
#ifdef CONFIG_NVBOARD
            nvboard_update();
#endif
        }
    };

    auto single_cycle = [&]() {
        clock_half_cycle(false);

        if (!dut.reset &&
            dut.rootp->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__illegal) {
            rejected = true;
            rejected_pc = dut.rootp->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__pc;
            rejected_inst = dut.rootp->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__inst;
        }

        // 在上升沿前采样提交使能，记录实际执行进度。
        if (!dut.reset && 
            dut.rootp->
            SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__u_ifu__DOT__u_pc__DOT__wen)
            ++commits;

        clock_half_cycle(true);

    };

    // 复位期间仍然持续驱动时钟。
    for (unsigned i = 0; i < 100 * cpu_clock_ratio; ++i)
        single_cycle();

    dut.reset = 0;

    // 连通性测试设置周期上限，避免无限等待。
    uint64_t max_cycles = 100000000000;
    if (const char* limit = std::getenv("NPC_MAX_CYCLES")) {
        char* end = nullptr;
        const auto value = std::strtoull(limit, &end, 10);
        if (!*limit || *end || !value || *limit == '-') {
            std::fprintf(stderr, "NPC_MAX_CYCLES必须为正整数\n");
            return 1;
        }
        max_cycles = value;
    }
    uint64_t cycles = 0;

    while (!halted && (!rejected || observe_rejection) && !ctx.gotFinish() && cycles < max_cycles) {
        single_cycle();
        ++cycles;

        // 周期性输出位置和握手快照，避免仅凭串口静默判断卡死。
        if (cycles % 10000000 == 0) {
            const auto* r = dut.rootp;
            std::fprintf(stderr,
                "progress cycles=%llu commits=%llu pc=0x%08x inst=0x%08x "
                "ifu_state=%u ifu_req=%u ifu_resp=%u "
                "lsu_addr=0x%08x lsu_req=%u lsu_resp=%u\n",
                static_cast<unsigned long long>(cycles),
                static_cast<unsigned long long>(commits),
                r->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__pc,
                r->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__inst,
                static_cast<unsigned>(r->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__u_ifu__DOT__state),
                static_cast<unsigned>(r->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__io_ifu_reqValid),
                static_cast<unsigned>(r->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__io_ifu_respValid),
                r->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__io_lsu_addr,
                static_cast<unsigned>(r->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__io_lsu_reqValid),
                static_cast<unsigned>(r->SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__io_lsu_respValid));
        }
    }

    const auto& gpr = dut.rootp->
        SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__u_rf__DOT__rf;
    const uint32_t a0 = gpr[10];

    dut.final();
    if (tracing)
        wave.close();

	if (halted) {
        std::printf(
            "%s: pc=0x%08x a0=0x%08x cycles=%llu\n",
            a0 == 0 ? "HIT GOOD TRAP" : "HIT BAD TRAP",
            halt_pc, a0,
            static_cast<unsigned long long>(cycles));

        const double ipc = cycles 
            ? static_cast<double>(commits) / cycles
            : 0.0;

        std::printf(
                "Statistics (including loader): "
                "instructions=%llu cycles=%llu IPC=%.6f\n",
                static_cast<unsigned long long>(commits),
                static_cast<unsigned long long>(cycles),
                ipc);

        #ifdef CONFIG_NVBOARD
        if (a0 == 0 && !std::getenv("NPC_NVBOARD_AUTOCLOSE")) {
            std::fflush(stdout);
            std::fprintf(stderr,
                "程序执行成功，窗口保留；关闭NVBoard窗口结束。\n");

            // CPU已停止，只继续处理界面和串口显示。
            while (true) {
            nvboard_update();
            }
        }
        nvboard_quit();
        #endif
        return a0 == 0 ? 0 : 1;
    }

    #ifdef CONFIG_NVBOARD
    nvboard_quit();
    #endif

    if (rejected) {
        if (observe_rejection && cycles == max_cycles)
            std::fprintf(stderr, "达到周期上限：%llu，拒绝指令未退休，commits=%llu\n",
                static_cast<unsigned long long>(cycles),
                static_cast<unsigned long long>(commits));
        std::fprintf(stderr, "ILLEGAL INSTRUCTION: pc=0x%08x inst=0x%08x\n",
                     rejected_pc, rejected_inst);
        return 1;
    }

    if (ctx.gotFinish()) {
        std::fprintf(stderr, "仿真提前结束，未观察到 ebreak\n");
        return 1;
    }

    std::fprintf(
        stderr, "达到周期上限：%llu，未观察到 ebreak\n",
        static_cast<unsigned long long>(cycles));
    return 1;
}
