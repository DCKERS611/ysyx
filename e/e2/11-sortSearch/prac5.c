#include <stdio.h>

int binarySearchFirst(const int arr[], int len, int target)
{
    int start = 0;
    int end = len - 1;
    int res = -1;
    
    while (start <= end) {
        int mid = start + (end - start) / 2;

        if (arr[mid] < target) start = mid + 1;
        else if (arr[mid] > target) end = mid - 1;
        else {
            res = mid;
            end = mid - 1;
        }
    }

    return res;
}

int main(void)
{
    int a[] = {1, 2, 2, 2, 5, 6, 8, 9};
    int len = (int)(sizeof(a) / sizeof(a[0]));

    printf("target 2 -> %d\n", binarySearchFirst(a, len, 2));
    printf("target 1 -> %d\n", binarySearchFirst(a, len, 1));
    printf("target 9 -> %d\n", binarySearchFirst(a, len, 9));
    printf("target 4 -> %d\n", binarySearchFirst(a, len, 4));
    return 0;
}
