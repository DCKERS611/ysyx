#include <stdio.h>

double mypowRecursive(double x, unsigned int n)
{
    if (n == 0) return 1.0;
    double half = mypowRecursive(x, n/2);

    if ( n % 2 == 0) return half * half;
    else return half * half * x;
}

double mypowIterative(double x, unsigned int n)
{
    double res = 1;
    while (n > 0)
    {
        if ( n & 1) res *= x;
        x *= x;
        n >>= 1;
    }
    return res;
}

int main(void)
{
    printf("recursive: 2^10 = %.0f\n", mypowRecursive(2.0, 10));
    printf("recursive: 3^5  = %.0f\n", mypowRecursive(3.0, 5));
    printf("recursive: 5^0  = %.0f\n", mypowRecursive(5.0, 0));

    printf("iterative: 2^10 = %.0f\n", mypowIterative(2.0, 10));
    printf("iterative: 3^5  = %.0f\n", mypowIterative(3.0, 5));
    printf("iterative: 5^0  = %.0f\n", mypowIterative(5.0, 0));
    return 0;
}
