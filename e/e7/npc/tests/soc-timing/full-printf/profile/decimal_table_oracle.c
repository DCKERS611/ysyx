#include <stdio.h>
#include <string.h>
#include "../decimal_4digits.h"
int main(void) {
 if(sizeof(decimal_four)!=40001)return 1;
 for(unsigned i=0;i!=10000;++i){char expected[5];snprintf(expected,sizeof expected,"%04u",i);if(memcmp(expected,decimal_four+4*i,4))return 2;}
 puts("DECIMAL_TABLE PASS 10000 values");return 0;
}
