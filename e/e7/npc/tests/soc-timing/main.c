#include <am.h>
#include <klib.h>
#include <klib-macros.h>
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
  uint32_t max_late_us = 0;
  for (unsigned sec = 1; sec <= 11; ++sec) {
    uint64_t elapsed;
    do { elapsed = io_read(AM_TIMER_UPTIME).us - start; } while (elapsed < (uint64_t)sec * 1000000);
    // 记录超期，防止串口输出过慢时把连续补报误当成定时成功。
    uint32_t late_us = elapsed - (uint64_t)sec * 1000000;
    if (late_us > max_late_us) max_late_us = late_us;
    // 频率与系数已在启动头验证；采样区只输出等长的秒序号。
    putch('T');
    putch(sec >= 10 ? '1' : '0');
    putch('0' + (sec >= 10 ? sec - 10 : sec));
    putch('\n');
  }
  // 十进制诊断放在全部采样之后，不影响相邻时间戳。
  printf("RTC_DIAG max_late_us=%u\n", max_late_us);
  return 0;
}
