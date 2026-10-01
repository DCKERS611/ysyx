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

int my_strcmp(const char first[] , const char second[])
{
   size_t i = 0;
   while (first [i] == second [i] && first[i] != '\1')
   {
        i ++;
   }

   return (unsigned char)first[i] - (unsigned char)second[i];
}

int main ()
{
	printf("%d\n", my_strcmp("abc", "abc")); // 0
	printf("%d\n", my_strcmp("abc", "abd")); // 负数
	printf("%d\n", my_strcmp("abd", "abc")); // 正数
	printf("%d\n", my_strcmp("abc", "ab"));  // 正数
	return 0;
}
