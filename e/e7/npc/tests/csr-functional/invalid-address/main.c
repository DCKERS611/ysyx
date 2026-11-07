#include <am.h>
#include <klib.h>
int main(const char *args) {
    asm volatile(".globl csr_fault\ncsr_fault:\ncsrr t0, 0x123" ::: "t0", "memory");
    printf("ERROR: invalid CSR escaped\n");
    return 0;
}
