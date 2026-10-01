#include <math.h>
#include <stdio.h>

double mysqrt(double y)
{
    if (y <= 0.0) return 0.0;

    double left = 0.0;
    double right = y >= 1.0 ? y : 1.0;
    double mid;

    while (1)
    {
        mid = left + (right - left) / 2.0;
        if (fabs(mid * mid - y) < 0.001) return mid;
        if (mid * mid < y) left = mid;
        else right = mid;
    }
}

int main(void)
{
    printf("sqrt(2.0)    = %.6f\n", mysqrt(2.0));
    printf("sqrt(25.0)   = %.6f\n", mysqrt(25.0));
    printf("sqrt(0.25)   = %.6f\n", mysqrt(0.25));
    printf("sqrt(100.0)  = %.6f\n", mysqrt(100.0));
    return 0;
}
