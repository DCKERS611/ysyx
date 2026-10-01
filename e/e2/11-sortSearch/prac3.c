#include <stdio.h>

int findSecMin (const int arr[] , int len)
{
    int min = (arr[0] < arr[1]) ? arr[0] : arr[1];
    int secMin = (arr[0] < arr[1]) ? arr[1] : arr[0];
    for (int i = 2 ; i < len ; i++)
    {
        if ( arr[i] < min ) {
            secMin = min;
            min = arr[i];
        } else if (arr[i] < secMin) {
            secMin = arr[i];
        }
    }
    return secMin;
}

int main ()
{
    int a[] = {7, 3, -2, 10, 4, -8, 6};
    int len = sizeof (a) / sizeof (a[0]);
    int res = findSecMin(a , len);
    printf("second min : %d\n" , res);
    return 0;

}
