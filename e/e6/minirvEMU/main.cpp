#include <cstdio>
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

    for (unsigned step = 1; step <= 1000; ++step) {
        const auto info = emu.step();
        const auto& state = emu.get_state();
        if (info.status == minirv::StepStatus::fault
            || info.status == minirv::StepStatus::illegal) {
            std::fprintf(stderr, "step=%u pc=0x%08x inst=0x%08x: %s\n",
                         step, info.pc, info.inst,
                         info.error.empty() ? "illegal instruction" : info.error.c_str());
            return 1;
        }

        std::printf("step=%u pc=0x%08x inst=0x%08x -> pc=0x%08x a0=0x%08x ra=0x%08x\n",
                    step, info.pc, info.inst, state.pc, state.R[10], state.R[1]);
        if (state.halted) {
            std::printf("ebreak @ pc=0x%08x; EMU PC stays at ebreak\n", state.halt_pc);
            return 0;
        }
    }

    std::fprintf(stderr, "EMU timed out after 1000 instructions\n");
    return 1;
}
