#include "Vtop.h"
#include "verilated.h"
#include <cstdio>

static void tick(Vtop& dut) {
    dut.clk = 0; dut.eval();
    dut.clk = 1; dut.eval();      // 上升沿：两个寄存器都更新
}

int main(int argc, char** argv) {
    VerilatedContext context;
    context.commandArgs(argc, argv);
    Vtop dut{&context};

    // 复位若干拍
    dut.rst = 1;
    for (int i = 0; i < 5; i++) tick(dut);
    dut.rst = 0;

    // 逐拍对照
    const long long CYCLES = 10000000;          // 1000 万拍
    for (long long t = 0; t < CYCLES; t++) {
        tick(dut);
        if (dut.led_reg != dut.led_always || dut.cnt_reg != dut.cnt_always) {
            std::printf("MISMATCH at cycle %lld\n", t);
            std::printf("  reg   : led=%04x cnt=%u\n", (unsigned)dut.led_reg,    (unsigned)dut.cnt_reg);
            std::printf("  always: led=%04x cnt=%u\n", (unsigned)dut.led_always, (unsigned)dut.cnt_always);
            return 1;
        }
    }
    std::printf("PASS: %lld cycles identical\n", CYCLES);
    return 0;
}
