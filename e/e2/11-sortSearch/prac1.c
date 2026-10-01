#include <stdio.h>

#define LEN 10

int a[LEN] = {5, 2, 4, 7, 1, 3, 2, 6, 9, 0};

int partition (int arr[] , int start , int end)
{
    int pivot = arr[start];
    int i = start;
    int temp;
    for (int j = start + 1 ; j <= end ; j ++ )
    {
        if (arr[j] <= pivot)
        {
            i ++;
            temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }
    temp = arr[start];
    arr[start] = arr[i];
    arr[i] = temp;

    return i;
}

void quickSort (int arr[] , int start , int end)
{
    if (start < end)
    {
        int mid = partition(arr , start , end);
        quickSort(arr , start , mid - 1);
        quickSort(arr , mid + 1  , end);
    }
}

int main ()
{
    quickSort(a , 0 , LEN  - 1 );
    for (int i = 0 ; i < LEN; i ++)
    {
        printf("%d " , a[i]);
    }

    printf("\n");
    return 0;

}
