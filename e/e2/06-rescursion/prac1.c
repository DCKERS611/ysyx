#include <stdio.h>

int factorial(int n)
{
    printf("entre factorial(%d) \n" , n);
    if (n == 0) {
        printf("return factorial(0) = 1 \n");
        return 1;
    }
    int pre = factorial(n - 1);
    int res = n * pre;

    printf ("return factorial;(%d) = %d \n", n ,res);
    return res;
}

int main(void)
{
    int res = factorial(3);
    printf("final res = %d \n" ,res);
    return 0;
}
