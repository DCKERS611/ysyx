#include <stdio.h>
#include "../uart_status.h"
int main(void) {
 for(unsigned i=0;i!=256;++i) {
  if(uart_status_bit(uart_ready,(unsigned char)i)!=((i&32)!=0)) return 1;
  if(uart_status_bit(uart_done,(unsigned char)i)!=((i&64)!=0)) return 2;
 }
 puts("UART_STATUS_ORACLE PASS 512 checks");return 0;
}
