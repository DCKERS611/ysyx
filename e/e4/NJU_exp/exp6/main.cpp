#include <cstdio>
#include "Vtop.h"          
#include "verilated.h"

static const bool seg_on[16][7] = {
    /* a  b  c  d  e  f  g */
    { 1, 1, 1, 1, 1, 1, 0 }, // 0
    { 0, 1, 1, 0, 0, 0, 0 }, // 1
    { 1, 1, 0, 1, 1, 0, 1 }, // 2
    { 1, 1, 1, 1, 0, 0, 1 }, // 3
    { 0, 1, 1, 0, 0, 1, 1 }, // 4
    { 1, 0, 1, 1, 0, 1, 1 }, // 5
    { 1, 0, 1, 1, 1, 1, 1 }, // 6
    { 1, 1, 1, 0, 0, 0, 0 }, // 7
    { 1, 1, 1, 1, 1, 1, 1 }, // 8
    { 1, 1, 1, 1, 0, 1, 1 }, // 9
    { 1, 1, 1, 0, 1, 1, 1 }, // A
    { 0, 0, 1, 1, 1, 1, 1 }, // b
    { 1, 0, 0, 1, 1, 1, 0 }, // C
    { 0, 1, 1, 1, 1, 0, 1 }, // d
    { 1, 0, 0, 1, 1, 1, 1 }, // E
    { 1, 0, 0, 0, 1, 1, 1 }, // F
};

static void unsigned segbit[7] = {0x80, 0x40, 0x20, 0x10, 0x08, 0x04,0x02};

int main(int argc, char** argv) {
    VerilatedContext ctx; ctx.commandArgs(argc, argv);
    Vtop dut{&ctx};

    int fails = 0;
    for (int h = 0; h < 16; h++) {
        dut.hex = h;
        dut.eval();

        unsigned hi = 0;
        for (int s = 0; s < 7; s++)
            if (seg_on[h][s]) hi |= bit[s];
        unsigned exp = (~hi) & 0xFF;

        unsigned got = dut.seg & 0xFF;
        if (got != exp) {
            printf("hex=%X -> seg=%02x  期望 %02x  MISMATCH\n", h, got, exp);
            fails++;
        }
    }

    if (fails) { printf("FAILED: %d/16\n", fails); return 1; }
    printf("PASS: 16/16\n");
    return 0;
}
