#include "expectations.h"

int main(int argc, char** argv)
{
    if (argc != 4) {
        std::fprintf(stderr, "Usage: %s <program.bin> <expectations> <case-name>\n", argv[0]);
        return 1;
    }
    ExpectedProgram expected;
    if (!read_expectations(argv[2], expected)) return 1;
    std::printf("[ RUN ] %s\n", argv[3]);
    if (!pmem_load_file(argv[1])) return 1;

    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    Vtop dut{&ctx};
    if (!sim_init(dut, nullptr)) {
        sim_close(dut);
        return 1;
    }
    sim_reset(dut);

    bool step_failed = false;
    unsigned cycles = 0;
    std::vector<uint32_t> trace;
    while (!ctx.gotFinish() && cycles < 1000) {
        trace.push_back(dut.pc);
        if (!sim_step(dut)) {
            step_failed = true;
            break;
        }
        ++cycles;
    }

    const int result = check_expectations(dut, expected, step_failed, cycles, trace, argv[3]);
    sim_close(dut);
    return result;
}
