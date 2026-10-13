#include "Vscpu.h"
#include "Vscpu___024root.h"
#include "verilated.h"
#include "semu.h"
#include <cstdio>

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
    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    Vscpu dut{&ctx};
    SEMU ref;

    int fails = 0, total = 0;

    reset(dut);
    ref.reset();

    for (int i = 0; i < 50; i ++)
    {
        // 保存即将执行的指令, 发生差异时定位
        int prev_pc = dut.pc;
        int prev_inst = dut.inst;

        tick(dut);
        ref.step();

        const CPUState& state = ref.get_state();

        int exp_pc = state.pc;
        int exp_led = state.led;

        // 读完rtl 执行之后的状态
        int pc = dut.pc;
        int led = dut.led;

        total += 6;
        if (pc != exp_pc) {
            printf("pc=%d (expect pc=%d)\n",
                    pc, exp_pc);
            fails ++;
        }
        if (led != exp_led) {
            printf("led=%d (expect led=%d)\n",
                    led, exp_led);
            fails ++;
        }
        for (int j = 0; j < 4; j ++)
        {
            int actual = dut.rootp->scpu__DOT__u_gpr__DOT__regs[j];
            int exp = state.r[j];

            if (actual != exp) {
                printf("cycle%d: r%d=%d (expect r%d=%d)\n",
                        i + 1, j, actual, j, exp);
                fails ++;
            }
        }

        if (fails)
        {
            printf("step=%d: pc=%02x inst=%02x\n",
                    i+1, prev_pc, prev_inst);
            printf("FAILED: %d/%d \n", fails , total);
            dut.final();
            return 1;
        }

    }

    dut.final();
    printf("PASS: %d\n", total);
    return 0;

}
