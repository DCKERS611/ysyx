#include <am.h>

#ifndef NPC_CPU_FREQ_MHZ
#define NPC_CPU_FREQ_MHZ 25
#endif
#ifndef NPC_TIMER_CALIBRATION_Q16
#define NPC_TIMER_CALIBRATION_Q16 0
#endif

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

#if NPC_TIMER_CALIBRATION_Q16
static uint64_t scale_cycles_q16(uint64_t cycles)
{
    uint64_t product = 0;
    // 系数在编译期已知，展开后只留下所需的移位与加法，避免软件64位乘法。
    // 先按uint64_t自然回绕，再右移16位，与原表达式的模2^64语义完全一致。
#pragma GCC unroll 64
    for (unsigned bit = 0; bit < 64; ++bit) {
        if (((uint64_t)NPC_TIMER_CALIBRATION_Q16 >> bit) & 1u)
            product += cycles << bit;
    }
    return product >> 16;
}
#endif

void __am_timer_init() {
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {

#if NPC_TIMER_CALIBRATION_Q16
    // 单独构建的RTC墙钟演示：由主机时间戳实测系数，不用于硬件跑分。
    uptime->us = scale_cycles_q16(read_mcycle());
#else
    // 默认按目标频率换算；性能测试始终使用此口径。
    uptime->us = read_mcycle() / NPC_CPU_FREQ_MHZ;
#endif
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}
