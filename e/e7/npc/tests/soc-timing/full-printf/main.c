#include <am.h>
#include <klib.h>
#include <klib-macros.h>
void rtc_test(void);
static uint64_t cycles(void) {
  uint32_t a,b,c;
  do { asm volatile("csrr %0,mcycleh":"=r"(a)); asm volatile("csrr %0,mcycle":"=r"(b)); asm volatile("csrr %0,mcycleh":"=r"(c)); } while(a!=c);
  return ((uint64_t)c<<32)|b;
}
uint64_t rtc_profile_cycles(void) { return cycles(); }
#ifdef RTC_ENABLE_PRINTF_PROFILE
extern int rtc_printf_profile_enabled;
extern unsigned rtc_printf_profile_count;
extern uint32_t rtc_printf_profile_costs[32];
#endif
int main(void) {
  ioe_init();
  // 启动时验证目标平台的varargs和边界整数格式；不进入计时间隔。
  printf("RTC_FORMAT_PROBE %d %u %02d %08x %s %c %%\n",
         (-2147483647 - 1), 4294967295u, 7, 0xdeadbeefu, "ok", 'Z');
  uint64_t before=cycles(), actual=io_read(AM_TIMER_UPTIME).us, after=cycles();
#if NPC_TIMER_CALIBRATION_Q16
  assert(actual>=((before*NPC_TIMER_CALIBRATION_Q16)>>16));
  assert(actual<=((after*NPC_TIMER_CALIBRATION_Q16)>>16));
#else
  assert(actual>=before/NPC_CPU_FREQ_MHZ && actual<=after/NPC_CPU_FREQ_MHZ);
#endif
  printf("TIMER_CONFIG_OK CPU_MHZ=%u Q16=%u\n",NPC_CPU_FREQ_MHZ,NPC_TIMER_CALIBRATION_Q16);
  rtc_test();
#ifdef RTC_ENABLE_PRINTF_PROFILE
  rtc_printf_profile_enabled = 0;
  uint32_t maximum = 0;
  unsigned pairs = 0;
  // 每行原RTC调用两次printf；最后的RTC_DIAG不纳入日期行成本。
  for (unsigned i = 0; i + 1 < 2 * AM_RTC_SAMPLES && i + 1 < rtc_printf_profile_count; i += 2) {
    uint32_t cost = rtc_printf_profile_costs[i] + rtc_printf_profile_costs[i + 1];
    if (cost > maximum) maximum = cost;
    ++pairs;
  }
  printf("RTC_PRINTF_PROFILE pairs=%u max_cycles=%u\n", pairs, maximum);
#endif
  return 0;
}
