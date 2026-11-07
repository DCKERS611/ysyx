#include <am.h>
#include <klib.h>

int main(const char *args) {
    uint32_t before, after, high0, low0, high1, low1, high2, low2;
    // 两次64位高低高读取之间不插入printf，避免测到串口打印开销。
    asm volatile(
        "csrr %0, mcycleh\n"
        "li t0, -1\n"
        "csrrs x0, mcycle, t0\n"
        "1: csrr %2, mcycleh\n"
        "csrr %3, mcycle\n"
        "csrr %4, mcycleh\n"
        "bne %2, %4, 1b\n"
        "2: csrr %5, mcycleh\n"
        "csrr %6, mcycle\n"
        "csrr %7, mcycleh\n"
        "bne %5, %7, 2b\n"
        "csrr %1, mcycleh\n"
        : "=&r"(before), "=&r"(after), "=&r"(high0), "=&r"(low0),
          "=&r"(high1), "=&r"(high2), "=&r"(low1), "=&r"(low2)
        :
        : "t0", "memory");
    uint64_t first = ((uint64_t)high1 << 32) | low0;
    uint64_t second = ((uint64_t)low2 << 32) | low1;
    uint64_t delta = second - first;
    printf("CARRY before_high=%u after_high=%u\n",before,after);
    printf("FIRST high=0x%08x low=0x%08x\n",(uint32_t)(first>>32),(uint32_t)first);
    printf("SECOND high=0x%08x low=0x%08x\n",(uint32_t)(second>>32),(uint32_t)second);
    printf("DELTA high=0x%08x low=%u cycles\n",(uint32_t)(delta>>32),(uint32_t)delta);
    assert(before == 0 && after == 1);
    assert((first >> 32) == 1 && (second >> 32) == 1);
    assert(delta > 0 && delta < ((uint64_t)1 << 32));
    return 0;
}
