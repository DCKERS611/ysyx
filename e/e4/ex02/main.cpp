#include "Vtmp.h"
#include "verilated.h"
#include <cstdio>

int main(int argc, char **argv)
{
    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);

    Vtmp dut{&ctx};

    int fail = 0, total = 0;
    for (int sel = 0 ; sel < 2 ; sel ++)
    {
        for (int a = 0 ; a < 2 ; a ++)
        {
            for (int b = 0 ; b < 2 ; b ++)
            {
                dut.sel = sel;
                dut.a   = a;
                dut.b   = b;
                dut.eval();

                int exp = sel ? b : a;
                int got = (int)dut.y;
                total ++;
                printf("sel=%d  a=%d  b=%d  ->  y=%d  (expect %d)%s\n",
                        sel , a , b , got, exp , got==exp ? "" : "  <--MISMATCH");
                if (got != exp) fail ++;
            }
        }
    }
   if (fail)
	{
		printf("FAILED: %d/%d mismatch\n" , fail , total);
		return 1;
	}
	printf("PASS: %d cases\n" , total);
	return 0;
}
