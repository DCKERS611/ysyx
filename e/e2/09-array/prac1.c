#include <stdio.h>

int main(void) 
{
    int s[] = {4,3,2,1};
    int d[4] = {0};

    size_t length = sizeof s / sizeof s[0];
    for (size_t i = 0; i < length ; i ++)
    {
        d[i] = s[i];
        printf("%d " , d[i]);
    }
    return 0;
}
