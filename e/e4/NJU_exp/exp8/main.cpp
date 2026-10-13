#include <cstdio>
#include <cstdlib>
#include "Vtop.h"
#include "verilated.h"


// rom
#define CAPACITY 327680
static unsigned mem[CAPACITY];

static void load_mem(const char* path)
{
    FILE* fp = fopen(path, "r");
    if (!fp) {printf("FAIL TO OPEN %s\n", path); exit(1);}
    for (int i = 0; i < CAPACITY ; i ++)
    {
        unsigned v;
        if (fscanf(fp, "%x", &v) != 1)
        {
            printf("TOO SHORT FILE, THE NUMBER OF %d.\n", i);
            exit(1);
        }
        mem[i] = v;
    }
    fclose(fp);
}


static void tick(Vtop& dut)
{
    dut.clk = 0; dut.eval();
    dut.clk = 1; dut.eval();
}

static void reset(Vtop& dut)              // clrn 低有效，拉低 4 拍再放开
{
    dut.rst = 1;
    tick(dut);
    tick(dut);
    dut.rst = 0;
}


int main(int argc , char** argv)
{
    VerilatedContext ctx;
    ctx.commandArgs(argc,argv);
    Vtop dut{&ctx};

    int fails = 0 , total = 0;

    reset(dut);

    int exp_x = 1, exp_y = 1;
    int prev_x = 1, prev_y = 1;

    load_mem("imgs/mem.hex");
    printf("mem[0]=%x  mem[327679]=%x\n", mem[0], mem[327679]);
    for (int cycle = 0; cycle < 800*525; cycle ++)
    {
        int x_cnt = dut.x_cnt;
        int y_cnt = dut.y_cnt;
        int hsync = dut.vga_hsync;
        int vsync = dut.vga_vsync;
        int blank_n = dut.vga_blank_n;
        int h_addr = dut.h_addr;
        int v_addr = dut.v_addr;
        int color = dut.color;

        // 延迟类
        int exp_hsync = (prev_x > 96), exp_vsync = (prev_y > 2);
        int exp_blank_n = (prev_x >= 145 && prev_x <= 784 &&
                            prev_y >= 36 && prev_y <= 515);
        int exp_p_hv = (prev_x >= 145 && prev_x <= 784);
        int exp_p_vv = (prev_y >= 36 && prev_y <= 515);
        int exp_p_ha = exp_p_hv ? prev_x - 145 : 0;
        int exp_p_va = exp_p_vv ? prev_y - 36 : 0;
        int exp_addr = (exp_p_ha << 9) | (exp_p_va & 0x1ff);
        int exp_color = mem[exp_addr];


        // 非延迟类
        int exp_h_valid = (exp_x >= 145 && exp_x <= 784);
        int exp_v_valid = (exp_y >= 36 && exp_y <= 515);
        int exp_h_addr = exp_h_valid ? exp_x - 145 : 0;
        int exp_v_addr = exp_v_valid ? exp_y - 36  : 0;

        total ++;
        int bad = (x_cnt != exp_x) || (y_cnt != exp_y) ||
                    (hsync != exp_hsync) || (vsync != exp_vsync) ||
                    (blank_n != exp_blank_n) ||
                    (h_addr != exp_h_addr) || (v_addr != exp_v_addr) ||
                    (color != exp_color);
        if (bad)
        {
            if (fails < 10)
            printf("cycle'%d': x_cnt=%d y_cnt=%d hsync=%d vsync=%d blank_n=%d h_addr=%d v_addr=%d color=%d (expect: x_cnt=%d y_cnt=%d hsync=%d vsync=%d blank_n=%d h_addr=%d v_addr=%d color=%d)  <---MISMATCH\n",
            cycle, x_cnt, y_cnt, hsync, vsync, blank_n, h_addr, v_addr, color,
            exp_x, exp_y, exp_hsync, exp_vsync, exp_blank_n, exp_h_addr, exp_v_addr, exp_color);

            fails ++;
        }
        tick(dut);
        prev_x = exp_x;
        prev_y = exp_y;

        if (exp_x == 800)
        {
            exp_x = 1;
            if (exp_y == 525) exp_y = 1;
            else exp_y += 1;
        } else {
            exp_x += 1;
        }
    }


	if (fails) {printf("FAILED: %d/%d checks\n", fails,total); return 1;}

  	printf("PASS: %d check\n",total);
	return 0;
}
