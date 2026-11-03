#include <amtest.h>

void rtc_test() {
    AM_TIMER_RTC_T rtc;
    uint64_t start = io_read(AM_TIMER_UPTIME).us;
    int sec = 1;

    while (1) {
        // 扣除测试启动前的时间，避免补报 loader 期间的秒数。
        while (io_read(AM_TIMER_UPTIME).us - start
               < (uint64_t)sec * 1000000) {
        }

        rtc = io_read(AM_TIMER_RTC);
        printf("%d-%d-%d %02d:%02d:%02d GMT (",
               rtc.year, rtc.month, rtc.day,
               rtc.hour, rtc.minute, rtc.second);

        if (sec == 1) {
            printf("%d second).\n", sec);
        } else {
            printf("%d seconds).\n", sec);
        }

        sec++;
    }
}
