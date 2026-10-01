#include <stdio.h>

int is_leapYear(int year)
{
    if(!(year % 400) || ((year % 4 == 0) && (year % 100 != 0))) return 1;
            else return 0;
}

int main ()
{
    printf("%d \n" , is_leapYear(1900));
    printf("%d \n" , is_leapYear(2000));
    printf("%d \n" , is_leapYear(2023));    
    printf("%d \n" , is_leapYear(2024));
    return 0;
    }
