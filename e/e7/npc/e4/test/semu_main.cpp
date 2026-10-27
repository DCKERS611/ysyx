#include "semu.h"
#include <cstdio>

int main (void)
{
    SEMU ref;

    int fails =0, total = 0;

    int exp_pc = 10;
    int exp_led = 55;
    int exp_r0 = 10, exp_r1 = 10;
    int exp_r2 = 55, exp_r3 = 1;

    ref.reset();
    for (int i = 0; i < 50; i ++) ref.step();

    const CPUState& state = ref.get_state();

	int pc  = (int)state.pc;
    int led = (int)state.led;
    int r0  = (int)state.r[0];
    int r1  = (int)state.r[1];
    int r2  = (int)state.r[2];
    int r3  = (int)state.r[3];

    total += 6;
	if (pc  != exp_pc)  { printf("pc=%d (expect %d)\n",  pc,  exp_pc);  fails++; }
    if (led != exp_led) { printf("led=%d (expect %d)\n", led, exp_led); fails++; }
    if (r0  != exp_r0)  { printf("r0=%d (expect %d)\n",  r0,  exp_r0);  fails++; }
    if (r1  != exp_r1)  { printf("r1=%d (expect %d)\n",  r1,  exp_r1);  fails++; }
    if (r2  != exp_r2)  { printf("r2=%d (expect %d)\n",  r2,  exp_r2);  fails++; }
    if (r3  != exp_r3)  { printf("r3=%d (expect %d)\n",  r3,  exp_r3);  fails++; }

	if (fails) {printf("FAILED: %d/%d \n", fails, total); return 1;}
	printf("PASS: %d \n", total);
	return 0;
}
