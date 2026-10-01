#include <stdio.h>

size_t my_strlen(const char str[])
{
    size_t i = 0;
    while(str[i] != '\0')
    {
        i ++;
    }
    return i;
}

int main ()
{
    printf("%zu\n", my_strlen("")); // 0
    printf("%zu\n", my_strlen("Linux"));       // 5
    printf("%zu\n", my_strlen("Hello world")); // 11
    return 0;
}
