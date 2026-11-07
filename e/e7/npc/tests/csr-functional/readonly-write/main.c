#include <am.h>
#include <klib.h>
int main(const char *args) {
    asm volatile("li t1, 1\n.globl csr_fault\ncsr_fault:\ncsrrs t0, mvendorid, t1"
                 ::: "t0", "t1", "memory");
    printf("ERROR: readonly CSR escaped\n");
    return 0;
}
