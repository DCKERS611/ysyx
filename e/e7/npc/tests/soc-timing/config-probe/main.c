#include <am.h>
#include <klib.h>
#include <klib-macros.h>
static uint64_t cycle(void) {
  uint32_t h1,lo,h2;
  do { asm volatile("csrr %0,mcycleh":"=r"(h1)); asm volatile("csrr %0,mcycle":"=r"(lo)); asm volatile("csrr %0,mcycleh":"=r"(h2)); } while(h1!=h2);
  return ((uint64_t)h2<<32)|lo;
}
int main(void) {
  ioe_init();
  uint64_t before=cycle();
  uint64_t actual=io_read(AM_TIMER_UPTIME).us;
  uint64_t after=cycle();
#if NPC_TIMER_CALIBRATION_Q16
  uint64_t lower=(before*NPC_TIMER_CALIBRATION_Q16)>>16;
  uint64_t upper=(after*NPC_TIMER_CALIBRATION_Q16)>>16;
#else
  uint64_t lower=before/NPC_CPU_FREQ_MHZ;
  uint64_t upper=after/NPC_CPU_FREQ_MHZ;
#endif
  assert(actual>=lower && actual<=upper);
  printf("TIMER_CONFIG_PROBE PASS freq=%u q16=%u value=%u\n",NPC_CPU_FREQ_MHZ,NPC_TIMER_CALIBRATION_Q16,(unsigned)actual);
  return 0;
}
