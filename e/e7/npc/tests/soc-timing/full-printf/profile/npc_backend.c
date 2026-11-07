// 独立NPC状态模型只返回0/1；剖析时避免把软件位运算当作格式化成本。
void __wrap_putch(char ch) {
 volatile unsigned *status=(volatile unsigned*)0x10000004;
 while (*status==0) {}
 *(volatile char*)0x10000000=ch;
}
