#include <cstdio>
#include <cstdlib>
#include "Vball.h"
#include "verilated.h"

static void tick(Vball& dut)
{
    dut.clk = 0; dut.eval();
    dut.clk = 1; dut.eval();
}

static void reset(Vball& dut)
{
    dut.rst = 1;
    for (int i = 0; i < 2; i ++) tick(dut);
    dut.rst = 0;
}

int main (int argc, char** argv)
{
    VerilatedContext ctx; ctx.commandArgs(argc, argv);
    Vball dut{&ctx};

    int fails = 0, total = 0;
    reset(dut);

    int exp_x = 270, exp_y = 190;
    int exp_dx = 0, exp_dy = 0;

    printf("reset: x=%d y=%d dx=%d dy=%d\n",
            (int)dut.ball_x, (int)dut.ball_y, (int)dut.dir_x, (int)dut.dir_y);

    // test
	/* dut.en = 0;
    for (int i = 0; i < 5; i++) {
        tick(dut);
        total++;
        if (dut.ball_x != 270 || dut.ball_y != 190 ||
            dut.dir_x  != 0   || dut.dir_y  != 0) {
            printf("en=0 却动了: x=%d y=%d dx=%d dy=%d (expect x=%d y=%d dx=%d dy=%d)\n",                   (int)dut.ball_x, (int)dut.ball_y, (int)dut.dir_x, (int)dut.dir_y,
                    exp_x, exp_y, exp_dx, exp_dy);
            fails++;
        }
    }
    */

    for (int frame = 0 ; frame < 20000 ; frame ++)
    {
        dut.en = 0;
        for (int i = 0; i< 3; i ++)
        {
            tick(dut);
            total ++;
            if (dut.ball_x != exp_x || dut.ball_y != exp_y ||
                dut.dir_x != exp_dx || dut.dir_y != exp_dy)
            {
                printf("en=0 却动了: x=%d y=%d dx=%d dy=%d (expect x=%d y=%d dx=%d dy=%d)\n",                   (int)dut.ball_x, (int)dut.ball_y, (int)dut.dir_x, (int)dut.dir_y,
                        exp_x, exp_y, exp_dx, exp_dy);
                fails ++;
            }
        }
        dut.en = 1; tick(dut);

        // axis x
        int nx, ndx;
        if (exp_dx == 0)
        {
            if (exp_x + 4 > 540) {nx = 540; ndx = 1;}
            else {nx = exp_x + 4; ndx = 0;}
        }
        else
        {
            if (exp_x < 4) {nx = 0; ndx = 0;}
            else {nx = exp_x - 4; ndx = 1;}
        }

        // axis y
        int ny, ndy;
        if (exp_dy == 0)
        {
            if (exp_y + 3 > 380) {ny = 380; ndy = 1;}
            else {ny = exp_y + 3; ndy = 0;}
        }
        else
        {
            if (exp_y < 3) {ny =0; ndy = 0;}
            else {ny = exp_y - 3; ndy = 1;}
        }
        exp_x = nx; exp_dx = ndx;
        exp_y = ny; exp_dy = ndy;

        total ++;
        if (dut.ball_x != exp_x || dut.ball_y != exp_y ||
            dut.dir_x != exp_dx || dut.dir_y != exp_dy)
        {
            printf("ball_x=%d ball_y=%d dir_x=%d dir_y=%d (expect:ball_x=%d ball_y=%d dir_x=%d dir_y=%d) <-- MISMATCH!!!\n",
            dut.ball_x, dut.ball_y, dut.dir_x, dut.dir_y,
            exp_x, exp_y, exp_dx, exp_dy);
            fails ++;
		}

    }
    if (fails) {printf("FAILED: %d/%d checks\n", fails,total); return 1;}

    printf("PASS: %d check\n",total);
    return 0;
}
