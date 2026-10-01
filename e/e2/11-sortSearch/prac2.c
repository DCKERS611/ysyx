#include <stdio.h>

int findMin (const int arr[] , size_t len)
{
    int min = arr[0];
    for (size_t i = 0 ; i < len ; i ++)
    {
        if (arr[i] < min) min = arr[i];
    }
    return min;
}

int main ()
{
    int a[]  =  {7, 3, -2, 10, 4, -8, 6};
    size_t len = sizeof (a) / sizeof (a[0]);
    int res = findMin(a , len);
    printf("min :%d\n" , res);
    return 0;
}
