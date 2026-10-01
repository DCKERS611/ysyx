#include <stdio.h>
#include <string.h>

int main ()
{
    char str[] = "Linux";
    size_t sizeofLength = sizeof (str);
    size_t strlenLength = strlen (str);
    printf("sizeof : %zu\n" , sizeofLength );
    printf("strlen : %zu\n" , strlenLength);
    
    for (size_t i = 0 ; i < sizeofLength ; i ++)
    {
        printf("str[%zu] = %d\n" , i , str[i]);
    }
    printf("==================================\n");
    str[0] = 'l';
    for (size_t i = 0 ; i < sizeofLength ; i ++)
    {
        printf("str[%zu] = %d\n" , i , str[i]);
    }
    return 0;
}
