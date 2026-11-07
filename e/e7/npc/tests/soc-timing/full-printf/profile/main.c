#include <am.h>
#include <klib.h>
extern int rtc_printf_profile_enabled;
extern unsigned rtc_printf_profile_count;
extern uint32_t rtc_printf_profile_costs[32];
uint64_t rtc_profile_cycles(void) {
 uint32_t h,l,h2;
 do {asm volatile("csrr %0,mcycleh":"=r"(h));asm volatile("csrr %0,mcycle":"=r"(l));asm volatile("csrr %0,mcycleh":"=r"(h2));}while(h!=h2);
 return ((uint64_t)h<<32)|l;
}
int main(void) {
 ioe_init();rtc_printf_profile_enabled=1;
 for(int sec=1;sec<=11;sec++) {
  printf("%d-%d-%d %02d:%02d:%02d GMT (",1900,0,0,0,0,0);
  if(sec==1)printf("%d second).\n",sec);else printf("%d seconds).\n",sec);
 }
 rtc_printf_profile_enabled=0;
 uint32_t max=0;
 for(unsigned i=0;i<22;i+=2) {uint32_t cost=rtc_printf_profile_costs[i]+rtc_printf_profile_costs[i+1];if(cost>max)max=cost;}
 printf("PRINTF_PROFILE max_cycles=%u first=%u second=%u last=%u\n",max,rtc_printf_profile_costs[0]+rtc_printf_profile_costs[1],rtc_printf_profile_costs[2]+rtc_printf_profile_costs[3],rtc_printf_profile_costs[20]+rtc_printf_profile_costs[21]);return 0;
}
