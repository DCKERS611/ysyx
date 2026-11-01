// 独立参考入口：保留逐条日志，只增加机器可读结果。
#include <cstdio>
#include <cstring>
#include "emu.h"

int main(int argc, char** argv)
{
    if (argc != 2) {
        std::fprintf(stderr, "Usage: %s <program.bin>\n", argv[0]);
        return 1;
    }

    static minirv::Emulator emu;

    std::string error;
    if (!emu.load_program(argv[1], error)) {
        std::fprintf(stderr, "%s: %s\n", argv[1], error.c_str());
        return 1;
    }

    const char* filename = std::strrchr(argv[1], '/');
    const char* name = filename ? filename + 1 : argv[1];
    unsigned retired = 0;
    const auto print_result = [&](const char* stop, bool passed) {
        const auto& state = emu.get_state();
        std::printf("RESULT case=%s backend=emu verdict=%s stop=%s retired=%u "
                    "a0=0x%08x halt_pc=0x%08x\n",
                    name, passed ? "pass" : "fail", stop, retired, state.R[10], state.halt_pc);
    };
    for (unsigned step = 1; step <= 1000; ++step) {
        const auto info = emu.step();
        const auto& state = emu.get_state();
        if (info.status == minirv::StepStatus::fault
            || info.status == minirv::StepStatus::illegal) {
            std::fprintf(stderr, "step=%u pc=0x%08x inst=0x%08x: %s\n",
                         step, info.pc, info.inst,
                         info.error.empty() ? "illegal instruction" : info.error.c_str());
            print_result(info.status == minirv::StepStatus::illegal
                         ? "rejected" : "reference_fault", false);
            return 1;
        }
        ++retired;

        std::printf("step=%u pc=0x%08x inst=0x%08x -> pc=0x%08x a0=0x%08x ra=0x%08x\n",
                    step, info.pc, info.inst, state.pc, state.R[10], state.R[1]);
        if (state.halted) {
            std::printf("ebreak @ pc=0x%08x; EMU PC stays at ebreak\n", state.halt_pc);
            print_result("ebreak", true);
            return 0;
        }
    }

    std::fprintf(stderr, "EMU timed out after 1000 instructions\n");
    print_result("attempt_limit", false);
    return 1;
}
