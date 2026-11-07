#include <stdio.h>
#include <stdlib.h>
void __wrap_putch(char);
static unsigned char value,last;
static int reads,writes;
unsigned char rtc_uart_read(void) {++reads;last=value;if(!(value&32))value=32;return last;}
void rtc_uart_write(char c) {if(!(last&32)||c!='Q')exit(3);++writes;}
int main(void) {for(unsigned i=0;i<256;++i){value=i;reads=writes=0;__wrap_putch('Q');if(writes!=1||reads!=((i&32)?1:2))return 1;}puts("UART_DISPATCH PASS 256 states");}
