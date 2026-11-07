#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

int rtc_cached_vprintf(const char *format, va_list arguments);
static int cached_test;
int rtc_light_vprintf(const char *format, va_list arguments);
int rtc_test_printf(const char *format, ...);
static char captured[512];
static size_t used;
static unsigned cases;
void rtc_printf_putch(char ch) {
    if (used == sizeof captured) { fputs("capture overflow\n", stderr); exit(1); }
    captured[used++] = ch;
}

// libc的vsnprintf是独立oracle；逐字节比较也覆盖%c输出NUL的情况。
static void check(const char *format, ...) {
    char expected[512];
    va_list arguments, reference;
    va_start(arguments, format); va_copy(reference, arguments);
    int wanted = vsnprintf(expected, sizeof expected, format, reference);
    va_end(reference);
    used = 0;
    int actual = cached_test ? rtc_cached_vprintf(format, arguments) : rtc_light_vprintf(format, arguments);
    va_end(arguments);
    if (wanted < 0 || wanted >= (int)sizeof expected || actual != wanted ||
        used != (size_t)wanted || memcmp(captured, expected, used) != 0) {
        fprintf(stderr, "printf mismatch case=%u format=%s expected-length=%d actual=%d bytes=%zu\n",
                cases, format, wanted, actual, used);
        exit(1);
    }
    ++cases;
}

int main(void) {
    const int signed_values[] = {INT_MIN, -2147483647, -1000000000, -10001, -1000,
        -100, -99, -10, -9, -1, 0, 1, 7, 9, 10, 11, 99, 100, 1900, 1000000000, INT_MAX};
    const unsigned unsigned_values[] = {0, 1, 9, 10, 99, 100, 18325, 40121,
        65535, 65536, 0x80000000u, UINT_MAX};
    const char *signed_formats[] = {"%d", "%i", "%02d", "%012d", "%12d", "%-12d", "%0-12d"};
    const char *unsigned_formats[] = {"%u", "%02u", "%012u", "%12u", "%-12u", "%x", "%08x", "%X", "%012X"};
    for (size_t i = 0; i < sizeof signed_values / sizeof *signed_values; ++i)
        for (size_t j = 0; j < sizeof signed_formats / sizeof *signed_formats; ++j)
            check(signed_formats[j], signed_values[i]);
    for (size_t i = 0; i < sizeof unsigned_values / sizeof *unsigned_values; ++i)
        for (size_t j = 0; j < sizeof unsigned_formats / sizeof *unsigned_formats; ++j)
            check(unsigned_formats[j], unsigned_values[i]);
    check(""); check("literal %% text"); check("[%s][%8s][%-8s]", "", "abc", "xyz");
    check("%c%c%3c%-3c", 0, 'A', 'B', 'C');
    check("%*d %0*u %-*x", -12, INT_MIN, 12, UINT_MAX, 12, 0x123u);
    check("%d-%d-%d %02d:%02d:%02d GMT (%d second).\n", 1900, 0, 0, 0, 0, 0, 1);
    check("%d-%d-%d %02d:%02d:%02d GMT (%d seconds).\n", 2028, 2, 29, 23, 59, 58, 11);
    check("TIMER_CONFIG_OK CPU_MHZ=%u Q16=%u\n", 300u, 7754u);
    // 超过本地缓冲长度，验证多次flush不会截断、重复或改变返回长度。
    char long_text[301];
    for (unsigned i = 0; i < 300; ++i) long_text[i] = 'a' + (i % 26);
    long_text[300] = 0;
    check("[%s]", long_text); check("%300d", INT_MIN);
    uint32_t random = 0x12345678u;
    for (unsigned i = 0; i < 4000; ++i) {
        random ^= random << 13; random ^= random >> 17; random ^= random << 5;
        check("%d|%012d|%u|%08x|%-12X", (int32_t)random, (int32_t)random, random, random, random);
    }
    for (unsigned i=0;i<4000;++i) {
        random ^= random << 13;random ^= random >> 17;random ^= random << 5;
        check("%d|%02d|%u",(int32_t)random,(int32_t)random,random);
    }
    cached_test=1;
    for(unsigned i=0;i<4000;++i) {
        random ^= random << 13;random ^= random >> 17;random ^= random << 5;
        for(unsigned repeat=0;repeat<2;++repeat)
            check("%d|%02d|%u",(int32_t)random,(int32_t)random,random);
    }
    for(size_t i=0;i<sizeof signed_values/sizeof *signed_values;++i)
        for(unsigned repeat=0;repeat<2;++repeat)
            check("%d|%02d|%u",signed_values[i],signed_values[i],(unsigned)signed_values[i]);
    cached_test=0;
    char mutable_format[]="%d";
    check(mutable_format,15);mutable_format[1]='x';check(mutable_format,15);
    used = 0;
    int length = rtc_test_printf("%d %u %02d %08x %s %c %%", INT_MIN, UINT_MAX, 7, 0xdeadbeefu, "ok", 'Z');
    char expected[512];
    int wanted = snprintf(expected, sizeof expected, "%d %u %02d %08x %s %c %%", INT_MIN, UINT_MAX, 7, 0xdeadbeefu, "ok", 'Z');
    if (length != wanted || used != (size_t)wanted || memcmp(captured, expected, used)) return 1;
    ++cases;
    printf("PRINTF_ORACLE PASS %u cases\n", cases);
    return 0;
}
