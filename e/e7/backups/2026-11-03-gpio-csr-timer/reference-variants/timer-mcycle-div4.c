#include <am.h>

static uint64_t read_mcycle(void)
{
    uint32_t high_before, low, high_after;

    do {
        asm volatile("csrr %0, mcycleh" : "=r"(high_before));
        asm volatile("csrr %0, mcycle" : "=r"(low));
        asm volatile("csrr %0, mcycleh" : "=r"(high_after));
    } while (high_before != high_after);

    return ((uint64_t)high_after << 32) | low;
}

void __am_timer_init() {
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
    
    uint64_t cycles = read_mcycle();
    // 参考变体：当前仿真曾使用的整数系数，需重新校准。
    uptime->us = cycles / 4;
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}
