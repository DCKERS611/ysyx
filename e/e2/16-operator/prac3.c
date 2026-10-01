#include <stdio.h>
#include <limits.h>

unsigned int rotate_right(unsigned int x , unsigned int n)
{
    const unsigned int width = sizeof x * CHAR_BIT;
    n = n % width;
    if (n == 0U) return x;
    return (x >> n) | (x << (width - n));
}

int main ()
{
    printf("%08x\n", rotate_right(0xdeadbeefU, 8U));
    printf("%08x\n", rotate_right(0xdeadbeefU, 16U));
    printf("%08x\n", rotate_right(0x12345678U, 0U));
    return 0;
}
