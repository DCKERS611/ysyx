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

void my_strcpy(char destination[] , const char source[])
{
   size_t i =0;
   while (source[i] != '\0')
   {
        destination[i] = source[i];
        i ++;
   }
   destination[i] = '\0';
}

int main (void)
{
    char dest[20];

    my_strcpy(dest , "Hello");
    my_strcpy(dest , "");
    printf("%s\n" , dest);
    return 0;
}
