// 手写案例入口：保留提交前轨迹，末态交给 EXPECT 检查。
#include "cpu_view.h"
#include "expectations.h"

int main(int argc, char** argv)
{
    if (argc != 4 && argc != 5) {
        std::fprintf(stderr, "Usage: %s <program.bin> <expectations> <case-name> [wave.fst]\n", argv[0]);
        return 1;
    }
    expected_program expected;
    if (!read_expectations(argv[2], expected)) return 1;
    std::printf("[ RUN ] %s\n", argv[3]);
    if (!pmem_load_file(argv[1])) return 1;

    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    ctx.traceEverOn(argc == 5);
    Vysyx_00000000 dut{&ctx};
    sim_session sim;
    if (!sim.init(dut, argc == 5 ? argv[4] : nullptr)) return 1;
    sim.reset();

    constexpr run_limits limits{64000, 0};
    stop_reason reason = stop_reason::running;
    std::vector<uint32_t> trace;
    while (!ctx.gotFinish() && sim.cycles() < limits.max_cycles) {
        if (npc::commit(dut) || npc::illegal(dut)) trace.push_back(npc::pc(dut));
        const auto event = sim.step();
        if (event == step_event::rejected || event == step_event::fault) {
            reason = event == step_event::rejected ? stop_reason::rejected : stop_reason::fetch_unaligned;
            break;
        }
    }
    if (reason == stop_reason::running)
        reason = sim.halted() ? stop_reason::ebreak
                 : ctx.gotFinish() ? stop_reason::external_finish : stop_reason::cycle_limit;
    const auto run = sim.result(reason);
    checker checks;
    const bool passed = check_expectations(dut, expected, run, trace, argv[3], checks) == 0
                        && (reason == stop_reason::ebreak
                            || (reason == stop_reason::rejected && expected.illegal))
                        && sim_bus_ok();
    sim_print_result(argv[3], "npc", run, passed, checks.total(), checks.failures(), nullptr);
    return passed ? 0 : 1;
}
