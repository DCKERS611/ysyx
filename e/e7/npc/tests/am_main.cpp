// AM 程序入口：检查 ebreak 和 a0；手写 EXPECT 由 cpu_test 负责。
#include "cpu_view.h"
#include <cstdint>
#include <cstdio>
#include <cstring>
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
    Vysyx_00000000 dut{&ctx};
    sim_session sim;
    test_suite tests;
    if (!sim.init(dut, wave_path)) return 1;
    sim_set_verbose(false);
    sim.reset();
    const char* filename = std::strrchr(program_path, '/');
    const char* name = filename ? filename + 1 : program_path;
    const auto finish = [&](stop_reason reason, bool passed) {
        sim_print_result(name, "am", sim.result(reason), passed,
                         tests.total(), tests.failures(), nullptr);
        return passed ? 0 : 1;
    };

    constexpr run_limits limits{500000000000ull, 0};
    while (!ctx.gotFinish() && sim.cycles() < limits.max_cycles) {
        const auto event = sim.step();
        if (event == step_event::rejected || event == step_event::fault) {
            const auto run = sim.result(event == step_event::rejected
                                       ? stop_reason::rejected : stop_reason::fetch_unaligned);
            if (event == step_event::rejected)
                std::fprintf(stderr, "illegal inst: pc=0x%08x inst=0x%08x\n",
                             run.stop_pc, run.stop_inst);
            else
                std::fprintf(stderr, "unaligned fetch: pc=0x%08x\n", run.stop_pc);
            return finish(run.reason, false);
        }
    }
    const auto cycles = sim.cycles();
    if (!ctx.gotFinish())
        std::fprintf(stderr, "simulation timed out after %llu cycles\n",
                     static_cast<unsigned long long>(cycles));

    tests.check("hit ebreak", sim.halted(), 1);
    std::printf("Result: halt_pc=0x%08x a0=0x%08x ra=0x%08x cycles=%llu\n",
                sim.halt_pc(), static_cast<uint32_t>(npc::gpr(dut, 10)),
                static_cast<uint32_t>(npc::gpr(dut, 1)),
                static_cast<unsigned long long>(cycles));
    const double ipc = cycles ? static_cast<double>(sim.retired()) / cycles : 0.0;
    std::printf("instructions=%llu cycles=%llu IPC=%.6f\n",
                static_cast<unsigned long long>(sim.retired()),
                static_cast<unsigned long long>(cycles), ipc);
    const uint32_t a0 = npc::gpr(dut, 10);
    tests.check("exit code", a0, 0);
    if (sim.halted()) std::printf(a0 ? "HIT BAD TRAP\n" : "HIT GOOD TRAP\n");
    const auto reason = sim.halted() ? stop_reason::ebreak
                        : ctx.gotFinish() ? stop_reason::external_finish : stop_reason::cycle_limit;
    const bool passed = tests.report() == 0 && reason == stop_reason::ebreak && sim_bus_ok();
    return finish(reason, passed);
}
