#include <stdio.h>

int countbit (unsigned int x)
{
    int count = 0;
    while (x != 0)
    {
        if (x & 1U) count ++;
        x = x >> 1;
    }
    return count;
}

int main ()
{
    printf("%d\n", countbit(0U));
    printf("%d\n", countbit(0xfU));
    printf("%d\n", countbit(0x12345678U));
    printf("%d\n", countbit(~0U));
    return 0;

}
