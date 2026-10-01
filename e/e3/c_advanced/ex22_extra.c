#include <stdio.h>

typedef struct Person {
    char name[50];
    int age;
};

int main(void)
{
    struct Person *bad_guy = NULL;
    bad_guy->age = 99;

    return 0;
}
