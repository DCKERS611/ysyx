// 临时验证单拍边界；仅编译到 build/verification，不属于正式入口。
#include "cpu_view.h"
#include "sim.h"
#include "pmem.h"
#include "verilated.h"
#include <cassert>
#include <cstdio>
#include <cstring>
int main(int argc, char** argv) {
    assert(argc == 3);
    const bool rejected = std::strcmp(argv[2], "rejected") == 0;
    assert(pmem_load_file(argv[1]));
    VerilatedContext ctx;
    Vysyx_00000000 dut{&ctx};
    sim_session sim;
    assert(sim.init(dut, nullptr));
    sim_set_verbose(false);
    sim.reset();
    while (sim.cycles() < 64000) {
        const auto before_time = ctx.time(), before_cycles = sim.cycles(), before_retired = sim.retired();
        const auto event = sim.step();
        if (event == step_event::rejected) {
            assert(rejected && dut.clock == 0);
            assert(ctx.time() == before_time + 1 && sim.cycles() == before_cycles);
            assert(sim.retired() == before_retired && sim.attempts() == sim.retired() + 1);
            std::printf("EDGE PASS rejected time=%llu cycles=%llu retired=%llu attempts=%llu\n",
                        (unsigned long long)ctx.time(), (unsigned long long)sim.cycles(),
                        (unsigned long long)sim.retired(), (unsigned long long)sim.attempts());
            return 0;
        }
        assert(ctx.time() == before_time + 2 && sim.cycles() == before_cycles + 1);
        if (event == step_event::halted) {
            assert(!rejected && sim.retired() == before_retired + 1 && ctx.gotFinish());
            const auto time = ctx.time(), cycles = sim.cycles();
            assert(sim.step() == step_event::waiting && sim.step() == step_event::waiting);
            assert(ctx.time() == time && sim.cycles() == cycles);
            std::printf("EDGE PASS ebreak time=%llu cycles=%llu retired=%llu attempts=%llu\n",
                        (unsigned long long)time, (unsigned long long)cycles,
                        (unsigned long long)sim.retired(), (unsigned long long)sim.attempts());
            return 0;
        }
    }
    return 1;
}
