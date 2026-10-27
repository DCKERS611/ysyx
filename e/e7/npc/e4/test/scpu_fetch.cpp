#include <cstdio>
#include "Vscpu.h"
#include "verilated.h"
#include <cassert>

static void tick(Vscpu& dut)
{
    dut.clk = 0; dut.eval();
    dut.clk = 1; dut.eval();
}

static void reset(Vscpu& dut)
{
    dut.rst = 1;
    tick(dut);
    dut.rst = 0;
    dut.eval();
}

int main(int argc, char** argv)
{
    VerilatedContext ctx; ctx.commandArgs(argc, argv);
    Vscpu dut{&ctx};

    int fails = 0, total = 0;

    const unsigned char program[] = {
        0x86, 0x92, 0x01, 0x90, 0xA0, 0xB1, 0x17, 0x29, 0xF9, 0x68, 0xC3
    };

    reset(dut);

    for (unsigned i = 0; i < sizeof(program); i++)
    {
        unsigned pc = dut.pc, inst = dut.inst;

        printf("pc=%02x inst=%02x\n",
               pc, inst);
        assert(pc == i);
        assert(inst == program[i]);
        tick(dut);
    }

    dut.final();
    puts("PASS: fetch");
    return 0;
}
