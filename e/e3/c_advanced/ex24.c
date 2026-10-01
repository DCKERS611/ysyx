#include <stdio.h>
#include <stdlib.h>
#include "dbg.h"

#define MAX_DATA 100

typedef enum EyeColor {
    BLUE_EYES, GREEN_EYES, BROWN_EYES,
    BLACK_EYES, OTHER_EYES
} EyeColor;

const char *EYE_COLOR_NAMES[] = {
    "Blue", "Green", "Brown", "Black", "Other"
};

typedef struct Person {
    int age;
    char first_name[MAX_DATA];
    char last_name[MAX_DATA];
    EyeColor eyes;
    float income;
} Person;

void read_file_with_scanf(const char *filename, char *buffer, int max_size) {
    FILE *file = freopen(filename, "r", stdin);
    if (!file) {
        log_err("Failed to open file %s", filename);
        buffer[0] = '\0';
        return;
    }

    int i = 0;
    char ch;
    
    while (i < max_size - 1 && scanf("%c", &ch) == 1) {
        buffer[i] = ch;
        i++;
    }
    
    buffer[i] = '\0'; 
}

int main(int argc, char *argv[])
{
    Person you = {.age = 0};
    int i = 0;

    FILE *input = freopen("ex24_txt.txt", "r", stdin);
    check(input != NULL, "Failed to open ex24_txt.txt.");

    int rc = scanf("%49s", you.first_name);
    check(rc == 1, "Failed to read first name.");

    rc = scanf("%49s", you.last_name);
    check(rc == 1, "Failed to read last name.");

    rc = scanf("%d", &you.age);
    check(rc == 1, "Failed to read age.");

    rc = scanf("%d", &i);
    check(rc == 1, "Failed to read eyes.");
    you.eyes = i - 1;
    check(you.eyes >= 0 && you.eyes <= OTHER_EYES, "Invalid eye color option.");

    rc = scanf("%f", &you.income);
    check(rc == 1, "Failed to read income.");

    printf("----- RESULTS FROM FILE -----\n");
    printf("First Name: %s\n", you.first_name);
    printf("Last Name: %s\n", you.last_name);
    printf("Age: %d\n", you.age);
    printf("Eyes: %s\n", EYE_COLOR_NAMES[you.eyes]);
    printf("Income: %f\n", you.income);

    char file_content[MAX_DATA];
    printf("\nReading raw file content using scanf:\n");
    read_file_with_scanf("ex24_txt.txt", file_content, sizeof(file_content));
    printf("%s\n", file_content);

    return 0;
error:
    return -1;
}
