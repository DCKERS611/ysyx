#include <stdio.h>

unsigned int multiply(unsigned int x , unsigned int y)
{
    unsigned int res = 0;
    while (y != 0) {
        if ((y & 1U) != 0U) {
            res += x;
        }
        y >>= 1;
        x <<= 1;
    }
    return res;
}
int main ()
{
    printf("%u\n", multiply(0U, 123U));
    printf("%u\n", multiply(11U, 13U));
    printf("%u\n", multiply(27U, 18U));
    return 0;
}
