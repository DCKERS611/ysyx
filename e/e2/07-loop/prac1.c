#include <stdio.h>

int factorial_loop(int n)
{
    int res = 1;
    while(n >= 1){
        res = res * n;
        n --;
    }
    return res;
}

int main (void)
{
    printf("res is %d\n " , factorial_loop(5) );
    return 0;
}
