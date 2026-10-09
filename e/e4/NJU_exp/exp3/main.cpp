#include <cstdio>
#include "Vtop.h"
#include "verilated.h"


int main(int argc , char** argv)
{
    VerilatedContext ctx;
    ctx.commandArgs(argc,argv);
    Vtop dut{&ctx};

    int fails = 0 , total = 0;
    for (int a = 0 ; a < 16 ; a ++ )
        for(int b = 0 ; b < 16 ; b ++)
            for (int f = 0; f < 8 ; f ++)
            {
                dut.a = a;
                dut.b = b;
                dut.sel = f;
                dut.eval();

                int sa = (a >= 8) ? (a-16) : a;
                int sb = (b >= 8) ? (b-16) : b;

                int exp_res = 0, exp_carry = 0, exp_of = 0;
                int checkCFO = 0;

                if (f == 0 || f == 1)
                {
                    int sr = (f == 1) ? (sa - sb) : (sa + sb);
                    exp_res         =   sr & 0xF;
                    exp_of          =   (sr < -8 || sr > 7) ? 1 : 0;
                    unsigned t_b    = (f == 1) ? ((~b) & 0xF) : (unsigned)b;
                    exp_carry       = ((a + t_b + (f == 1)) >> 4) & 1;
                    checkCFO = 1;
                } else if (f == 2) {
                    exp_res = (~a) & 0xF;
                } else if (f == 3) {
                    exp_res = a & b;
                } else if (f == 4) {
                    exp_res = a | b;
                } else if (f == 5) {
                    exp_res = a ^ b;
                } else if (f == 6) {
                    exp_res = (sa < sb) ? 1 : 0;
                } else if (f == 7) {
                    exp_res = (sa == sb) ? 1 : 0;
                }

                int exp_zero = (exp_res == 0) ? 1 : 0;
                
                int gr = (int)dut.res , gc = (int)dut.carry;
                int go = (int)dut.of , gz = (int)dut.zero;
                total ++;

                int bad = (gr != exp_res) || (gz != exp_zero);
                if (checkCFO) {
                    if (gc != exp_carry || go != exp_of) bad = 1;
                }

                if (bad)
                {
                    printf("a=%2d b=%2d sel=%d  ->  res=%d carry=%d of=%d z=%d (expect res=%2d carry=%d of=%d z=%d) MISMATCH\n",
                            a,b,f,gr,gc,go,gz,exp_res,exp_carry,exp_of,exp_zero);
                    fails ++;
                }
            }
    if (fails) {printf("FAILED: %d/%d\n" , fails , total); return 1; }
    printf("PASS: %d cases\n" , total);
    
    return 0;
}
