#include <cstdint>
#include <cstdio>

#include "Vtop.h"
#include "Vtop___024root.h"
#include "verilated.h"

#include "pmem.h"
#include "sim.h"
#include "test_suite.h"

int main(int argc, char** argv)
{
    if (argc < 2 || argc > 3) {
        std::fprintf(stderr, "Usage: %s <program.bin> [wave.fst]\n", argv[0]);
        return 1;
    }

    const char* program_path = argv[1];
    const char* wave_path = argc == 3 ? argv[2] : nullptr;
    if (!pmem_load_file(program_path)) return 1;

    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    ctx.traceEverOn(true);
    Vtop dut{&ctx};
    TestSuite tests;

    if (!sim_init(dut, wave_path)) {
        sim_close(dut);
        return 1;
    }

    sim_reset(dut);

    // 程序通过 ebreak 结束；超时上限防止错误程序无限运行。
    constexpr unsigned max_cycles = 1000;
    unsigned cycles = 0;
    while (!ctx.gotFinish() && cycles < max_cycles) {
        if (!sim_step(dut)) {
            sim_close(dut);
            return 1;
        }
        ++cycles;
    }

    if (!ctx.gotFinish()) {
        std::fprintf(stderr, "simulation timed out after %u cycles\n", cycles);
    }

    // 外部程序的寄存器结果不同，不再固定要求 a0=30、ra=12。
    tests.check("hit ebreak", sim_halted(), 1);
    std::printf("Result: halt_pc=0x%08x a0=0x%08x ra=0x%08x cycles=%u\n",
                sim_halt_pc(),
                static_cast<uint32_t>(dut.rootp->top__DOT__u_rf__DOT__rf[10]),
                static_cast<uint32_t>(dut.rootp->top__DOT__u_rf__DOT__rf[1]),
                cycles);

    sim_close(dut);
    return tests.report();
}
