#include <stdio.h>

int partition(int arr[], int start, int end)
{
    int pivot = arr[start];
    int i = start;

    for (int j = start + 1; j <= end; j++) {
        if (arr[j] <= pivot) {
            i++;
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }

    arr[start] = arr[i];
    arr[i] = pivot;
    return i;
}

int orderStatistic(int arr[], int start, int end, int k)
{
    if (start == end) return arr[start];

    int mid = partition(arr , start , end);
    int rank = mid - start + 1;
    if (k == rank) return arr[mid];
    else if (k < rank) return orderStatistic(arr , start , mid - 1 , k);
    else return orderStatistic(arr , mid + 1 , end , k - rank);
        
}

int main(void)
{
    int a1[] = {7, 3, -2, 10, 4, -8, 6};
    int a2[] = {7, 3, -2, 10, 4, -8, 6};
    int a3[] = {7, 3, -2, 10, 4, -8, 6};
    int len = (int)(sizeof(a1) / sizeof(a1[0]));

    printf("k = 1 -> %d\n", orderStatistic(a1, 0, len - 1, 1));
    printf("k = 4 -> %d\n", orderStatistic(a2, 0, len - 1, 4));
    printf("k = 7 -> %d\n", orderStatistic(a3, 0, len - 1, 7));
    return 0;
}
