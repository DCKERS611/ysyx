#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SAMPLE_COUNT 100
#define VALUE_COUNT 10

int main ()
{
    int count [VALUE_COUNT] = {0};
    srand((unsigned int )time(NULL));

    for (int i = 0; i < SAMPLE_COUNT ; i ++)
    {
        int num = rand() % VALUE_COUNT;
        count[num] ++;
    }

    for (int i = 0; i < VALUE_COUNT ; i ++)
    {
        printf("%d:" , i);
        for (int j = 0 ; j < count[i] ; j ++)
        {
            printf("*");
        }
        printf("\n");
    }
    return 0;
}
