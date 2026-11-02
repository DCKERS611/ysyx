#include <am.h>
#include <klib-macros.h>

extern char _heap_start;
int main(const char *args);

extern char _pmem_start;
#define PMEM_SIZE (8 * 1024 * 1024)
#define PMEM_END  ((uintptr_t)&_pmem_start + PMEM_SIZE)

Area heap = RANGE(&_heap_start, PMEM_END);
static const char mainargs[MAINARGS_MAX_LEN] = TOSTRING(MAINARGS_PLACEHOLDER); // 由编译参数定义

// LSR bit5为1表示发送FIFO为空，此时可以写入字符。
void putch(char ch) {
    volatile unsigned char* lsr =
        (volatile unsigned char*)0x10000005;
    volatile unsigned char* thr =
        (volatile unsigned char*)0x10000000;

    while ((*lsr & 0x20) == 0) {
    }
    *thr = ch;
}

static void uart_wait_tx_done(void)
{
    volatile unsigned char* lsr =
        (volatile unsigned char*)0x10000005;

    // 等待TEMT: FIFO空闲且发送器空闲
    while ((*lsr & 0x40) == 0) {
    }
}

void halt(int code) {
    asm volatile("mv a0, %0; ebreak" : : "r"(code));
    while (1);
}

void _trm_init() {

    // DLAB置1后配置除数，最后恢复DLAB=0和8N1。
    volatile unsigned char *lcr =
        (volatile unsigned char *)0x10000003;
    volatile unsigned char *dll =
        (volatile unsigned char *)0x10000000;
    volatile unsigned char *dlm =
        (volatile unsigned char *)0x10000001;

    *lcr = 0x83;  // DLAB=1，8N1
    *dll = 0x0D;  // 沿用课程loader的除数13
    *dlm = 0x00;  // 除数高 8 位
    *lcr = 0x03;  // DLAB=0，8N1

    int ret = main(mainargs);
    uart_wait_tx_done();
    halt(ret);
}
