#include <stdio.h>

int sum_to(int n)
{
    if (n <= 0)
        return 0;
    else return n + sum_to(n - 1);
}
int main (void)
{
    int sum = sum_to(5);
    printf("sum is %d \n" , sum);
    return 0;
}
