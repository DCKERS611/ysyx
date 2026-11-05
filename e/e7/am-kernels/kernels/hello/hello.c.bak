#include <am.h>
#include <klib-macros.h>
#include <klib.h>

int main(const char *args) {
    volatile uint32_t *seg = (volatile uint32_t *)0x20001008;
    *seg = 0x10023589u;

    volatile uint32_t *led = (volatile uint32_t*)0x20001000;
    volatile uint32_t *sw = (volatile uint32_t *)0x20001004;

    while (1) {
        uint32_t input = *sw & 0xffffu;
        *led = (input == 0x0006u) ? 1u : 0u;
    }

    const char *fmt =
        "Hello, AbstractMachine!\n"
        "mainargs = '%'.\n";

    for (const char *p = fmt; *p; p++) {
        (*p == '%') ? putstr(args) : putch(*p);
    }
    return 0;
}
