#include <stdint.h>
#ifdef RTC_UART_NATIVE
unsigned char rtc_uart_read(void);
void rtc_uart_write(char ch);
#else
static unsigned char rtc_uart_read(void) { return *(volatile unsigned char*)0x10000005; }
static void rtc_uart_write(char ch) { *(volatile unsigned char*)0x10000000=ch; }
#endif
// 用跳转表直接选择继续轮询或发送；256种LSR值均保持原bit5判断语义。
void __wrap_putch(char ch) {
 static const void * const dispatch[256] = {
&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,
&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,
&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,
&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,
&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,
&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,
&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,
&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,
&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,
&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,
&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,
&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,
&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,
&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,&&poll,
&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,
&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,&&send,
 };
poll: {
 uintptr_t index=rtc_uart_read();
#ifdef __riscv
 // minirv原生支持add；避免GCC把索引乘4编成需要软件展开的移位。
 asm volatile("add %0,%0,%0; add %0,%0,%0" : "+r"(index));
 goto **(const void * const *)((const unsigned char *)dispatch+index);
#else
 goto *dispatch[index];
#endif
 }
send: rtc_uart_write(ch);
}
