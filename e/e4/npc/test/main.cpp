#include "Vscpu.h"
#include "Vscpu___024root.h"
#include "verilated.h"
#include <cstdio>
#include <cstdlib>

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
}

int main (int argc, char** argv)
{
    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    Vscpu dut{&ctx};

    int fails = 0, total = 0;

    int exp_pc = 10;
    int exp_led = 55;
    int exp_r0 = 10, exp_r1 = 10;
    int exp_r2 = 55, exp_r3 = 1;

    reset(dut);
    for (int i = 0; i < 50; i ++) tick(dut);

	int pc  = (int)dut.pc;
    int led = (int)dut.led;
    int r0  = (int)dut.rootp->scpu__DOT__u_gpr__DOT__regs[0];
    int r1  = (int)dut.rootp->scpu__DOT__u_gpr__DOT__regs[1];
    int r2  = (int)dut.rootp->scpu__DOT__u_gpr__DOT__regs[2];
    int r3  = (int)dut.rootp->scpu__DOT__u_gpr__DOT__regs[3];

	total += 6;
    if (pc  != exp_pc)  { printf("pc=%d (expect %d)\n",  pc,  exp_pc);  fails++; }
    if (led != exp_led) { printf("led=%d (expect %d)\n", led, exp_led); fails++; }
    if (r0  != exp_r0)  { printf("r0=%d (expect %d)\n",  r0,  exp_r0);  fails++; }
    if (r1  != exp_r1)  { printf("r1=%d (expect %d)\n",  r1,  exp_r1);  fails++; }
    if (r2  != exp_r2)  { printf("r2=%d (expect %d)\n",  r2,  exp_r2);  fails++; }
    if (r3  != exp_r3)  { printf("r3=%d (expect %d)\n",  r3,  exp_r3);  fails++; }


    if (fails) { printf("FAILED: %d/%d checks\n", fails, total); return 1; }
    printf("PASS: %d checks\n", total);
    return 0;
}
