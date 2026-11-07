#include <am.h>
#include <klib.h>
#include <klib-macros.h>
#define RTC_STRING_VALUE_(value) #value
#define RTC_STRING_VALUE(value) RTC_STRING_VALUE_(value)
static uint64_t raw_cycle(void) {
  uint32_t h1,lo,h2;
  do { asm volatile("csrr %0,mcycleh":"=r"(h1)); asm volatile("csrr %0,mcycle":"=r"(lo)); asm volatile("csrr %0,mcycleh":"=r"(h2)); } while(h1!=h2);
  return ((uint64_t)h2<<32)|lo;
}
static void check_timer_config(void) {
  uint64_t before=raw_cycle();
  uint64_t actual=io_read(AM_TIMER_UPTIME).us;
  uint64_t after=raw_cycle();
#if NPC_TIMER_CALIBRATION_Q16
  uint64_t lower=(before*NPC_TIMER_CALIBRATION_Q16)>>16;
  uint64_t upper=(after*NPC_TIMER_CALIBRATION_Q16)>>16;
#else
  uint64_t lower=before/NPC_CPU_FREQ_MHZ;
  uint64_t upper=after/NPC_CPU_FREQ_MHZ;
#endif
  assert(actual>=lower && actual<=upper);
  printf("TIMER_CONFIG_OK CPU_MHZ=%u Q16=%u\n",NPC_CPU_FREQ_MHZ,NPC_TIMER_CALIBRATION_Q16);
}
int main(void) {
  ioe_init();
  check_timer_config();
  uint64_t start = io_read(AM_TIMER_UPTIME).us;
  for (unsigned sec = 1; sec <= 11; ++sec) {
    uint64_t elapsed;
    do { elapsed = io_read(AM_TIMER_UPTIME).us - start; } while (elapsed < (uint64_t)sec * 1000000);
    // 计时区间内仅发送文本，不做昂贵的十进制格式化，以免输出占满周期。
    putstr("RTC_TICK sec=");
    if (sec >= 10) putch('1');
    putch('0' + (sec >= 10 ? sec - 10 : sec));
    putstr(" CPU_MHZ=" RTC_STRING_VALUE(NPC_CPU_FREQ_MHZ)
           " Q16=" RTC_STRING_VALUE(NPC_TIMER_CALIBRATION_Q16) "\n");
  }
  return 0;
}
