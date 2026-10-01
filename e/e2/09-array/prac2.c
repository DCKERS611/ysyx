#include <stdio.h>

int findMax(const int arr[] , int size)
{
    if (size <= 0) return -1;
    int max = arr[0];
    for (int i = 0; i < size ; i ++ )
    {
        if (arr[i] > max) max = arr[i];
    }
    return max;
}

int main ()
{
    int n[] = {7,-2,10,3,10};
    int n_length = sizeof (n) / sizeof (n[0]);
    for (int i = 0 ; i < n_length ; i ++)
    {
        printf("%d " , n[i]);
    }
    printf("\n");

    int sum;
    for (int i = 0 ; i < n_length ; i ++)
    {
        sum += n[i];
    }

    printf("sum : %d\n" , sum);
    printf("max : %d\n" , findMax(n , n_length));
}
