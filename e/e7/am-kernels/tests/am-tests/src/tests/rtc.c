#include <amtest.h>

#ifdef RTC_PREPARE_PRINTF
void rtc_printf_prepare(const char *format);
#endif
void rtc_test() {
 static const char date_format[]="%d-%d-%d %02d:%02d:%02d GMT (";
 static const char singular_format[]="%d second).\n";
 static const char plural_format[]="%d seconds).\n";
#ifdef RTC_PREPARE_PRINTF
 rtc_printf_prepare(date_format);
 rtc_printf_prepare(singular_format);
 rtc_printf_prepare(plural_format);
#endif
    AM_TIMER_RTC_T rtc;
    uint64_t start = io_read(AM_TIMER_UPTIME).us;
    int sec = 1;
    uint64_t deadline = start + 1000000;
#ifdef AM_RTC_SAMPLES
    uint32_t max_late_us = 0;
#endif

    while (1) {
        // 扣除测试启动前的时间，避免补报 loader 期间的秒数。
        uint64_t now;
        // 相邻截止点相差一秒；低32位差值用于快速轮询，完整64位值在退出时复核。
        // 验收允许的超期远小于2^31微秒，避免每次轮询做软件64位减法。
        const uint32_t negative_deadline = 0u - (uint32_t)deadline;
        do { now = io_read(AM_TIMER_UPTIME).us; }
        while ((int32_t)((uint32_t)now + negative_deadline) < 0);
        assert(now >= deadline);
        assert(now - deadline <= 0xffffffffu);
#ifdef AM_RTC_SAMPLES
        uint64_t lateness = now - deadline;
#endif
#ifdef AM_RTC_SAMPLES
        // 自动验收记录截止时间超期，防止连续补报被均值掩盖。
        uint32_t late = (uint32_t)lateness;
        if (late > max_late_us) max_late_us = late;
#endif

        rtc = io_read(AM_TIMER_RTC);
        printf(date_format,
               rtc.year, rtc.month, rtc.day,
               rtc.hour, rtc.minute, rtc.second);

        if (sec == 1) {
            printf(singular_format, sec);
        } else {
            printf(plural_format, sec);
        }

        sec++;
        deadline += 1000000;
#ifdef AM_RTC_SAMPLES
        if (sec > AM_RTC_SAMPLES) {
            printf("RTC_DIAG max_late_us=%u\n", max_late_us);
            return;
        }
#endif
    }
}
