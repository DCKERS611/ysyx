#include <am.h>
#include <klib.h>

// 高位前后读取一致，才能确保高、低位属于同一次计数范围。
static uint64_t read_mcycle(void) {
    uint32_t high_before, low, high_after;

    do {
        asm volatile("csrr %0, mcycleh" : "=r"(high_before));
        asm volatile("csrr %0, mcycle"  : "=r"(low));
        asm volatile("csrr %0, mcycleh" : "=r"(high_after));
    } while (high_before != high_after);

    return ((uint64_t)high_after << 32) | low;
}

// 本次测试读取指令计数器的低 32 位。
static uint32_t read_minstret(void) {
    uint32_t value;

    asm volatile("csrr %0, minstret" : "=r"(value));
    return value;
}

int main(const char *args) {
    uint64_t cycles;
    uint32_t instret;

    cycles = read_mcycle();
    instret = read_minstret();

    printf("first:  mcycle_high=%u, mcycle_low=%u, minstret=%u\n",
           (uint32_t)(cycles >> 32),
           (uint32_t)cycles,
           instret);

    cycles = read_mcycle();
    instret = read_minstret();

    printf("second: mcycle_high=%u, mcycle_low=%u, minstret=%u\n",
           (uint32_t)(cycles >> 32),
           (uint32_t)cycles,
           instret);

    return 0;
}
