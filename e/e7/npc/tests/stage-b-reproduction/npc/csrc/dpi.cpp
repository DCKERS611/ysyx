#include "dpi.h"
#include <cstdio>
#include "verilated.h"
#include "Vtop__Dpi.h"

static bool halted = false;
static bool verbose = true;
static uint32_t halt_pc = 0;

void dpi_set_verbose(bool enabled)
{
    verbose = enabled;
}

void dpi_reset()
{
    halted = false;
    halt_pc = 0;
}

bool dpi_halted()
{
    return halted;
}

uint32_t dpi_halt_pc()
{
    return halt_pc;
}

extern "C" void ebreak(int pc)
{
    halted = true;
    halt_pc = static_cast<uint32_t>(pc);

    if (verbose) std::printf("ebreak @ pc=0x%08x\n", halt_pc);
    Verilated::gotFinish(true);
}
