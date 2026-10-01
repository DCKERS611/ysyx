#include <stdio.h>

int main ()
{
    int arr[3][2] = {{1,2} , {3 , 4} ,{5 , 6}};
    for (int row = 0 ; row < 3 ; row ++ )
    {
        for (int col = 0 ; col < 2 ; col ++)
        {
            printf("%d " , arr[row][col]);
        }
        printf("\n");
    }
    
    int total = 0;
    for (int i = 0 ; i < 3 ; i ++)
    {
        int row_sum = 0;
        for (int j = 0 ; j < 2 ; j ++)
        {
            row_sum += arr[i][j];
            total += arr[i][j];
        }
        printf("row %d sum = %d\n" , i , row_sum);
    }
    printf("total = %d\n" , total);
    return 0;
}
