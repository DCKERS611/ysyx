#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include "dbg.h"
#include <string.h>

#define MAX_DATA 100

void clean_stdin (void)
{
    int ch;
    while ((ch = getchar()) != '\n' && ch != EOF);
}

int read_string(char **out_string, int max_buffer)
{
    printf("\ntest: out_string's address = %p \n" , (void *)&out_string);
    printf("调试: out_string 指向的地址 = %p\n", (void*)out_string);
    printf("调试: *out_string 当前的值 = %p\n", (void*)*out_string);

    *out_string = calloc(1, max_buffer + 1);
    check_mem(*out_string);

    char *result = fgets(*out_string, max_buffer, stdin);
    check(result != NULL, "Input error.");

    char *end = strpbrk(*out_string, "\r\n");
    if (end) *end = '\0';
    else clean_stdin();

    return 0;

error:
    if(*out_string) free(*out_string);
    *out_string = NULL;
    return -1;
}

int read_int(int *out_int)
{
    char *input = NULL;
    int rc = read_string(&input, MAX_DATA);
    check(rc == 0, "Failed to read number.");

    *out_int = atoi(input);

    free(input);
    return 0;

error:
    if(input) free(input);
    return -1;
}

int read_scan(const char *fmt, ...)
{
    int i = 0;
    int rc = 0;
    int *out_int = NULL;
    char *out_char = NULL;
    char **out_string = NULL;
    int max_buffer = 0;

    va_list argp;
    va_start(argp, fmt);

    for(i = 0; fmt[i] != '\0'; i++) {
        if(fmt[i] == '%') {
            i++;
            switch(fmt[i]) {
                case '\0':
                    sentinel("Invalid format, you ended with %%.");
                    break;

                case 'd':
                    out_int = va_arg(argp, int *);
                    rc = read_int(out_int);
                    check(rc == 0, "Failed to read int.");
                    break;

                case 'c':
                    out_char = va_arg(argp, char *);
                    *out_char = fgetc(stdin);

                    if (*out_char != '\n') {
                        clean_stdin();
                    }
                    break;

                case 's':
                    max_buffer = va_arg(argp, int);
                    out_string = va_arg(argp, char **);
                    rc = read_string(out_string, max_buffer);
                    check(rc == 0, "Failed to read string.");
                    break;

                default:
                    sentinel("Invalid format.");
            }
        } else {
            fgetc(stdin);
        }

        check(!feof(stdin) && !ferror(stdin), "Input error.");
    }


    return 0;

error:
    va_end(argp);
    return -1;
}


int my_printf(const char *fmt, ...) {
    check(fmt != NULL, "Format string cannot be NULL.");

    va_list argp;
    va_start(argp, fmt);

    while (*fmt != '\0') {
        if (*fmt == '%') {
            fmt++;
            switch (*fmt) {
                case 'd': {
                    int i = va_arg(argp, int);
                    check(fprintf(stdout, "%d", i) >= 0, "Failed to write to stdout.");
                    break;
                }
                case 's': {
                    char *s = va_arg(argp, char *);
                    check(s != NULL, "String argument is NULL.");
                    check(fputs(s, stdout) != EOF, "Failed to write string to stdout.");
                    break;
                }
                case 'c': {
                    int c = va_arg(argp, int);
                    check(fputc(c, stdout) != EOF, "Failed to write char to stdout.");
                    break;
                }
                case '%': {
                    check(fputc('%', stdout) != EOF, "Failed to write percent to stdout.");
                    break;
                }
                default:
                    sentinel("Invalid format specifier: %%%c", *fmt);
            }
        } else {
            check(fputc(*fmt, stdout) != EOF, "Failed to write to stdout.");
        }
        fmt++;
    }

    va_end(argp);
    return 0;

error:
    if (argp != NULL) {
        va_end(argp);
    }
    return -1;
}


int main(int argc, char *argv[])
{
    char *first_name = NULL;
    char initial = ' ';
    char *last_name = NULL;
    int age = 0;

    my_printf("\nWhat's your first name? ");
    int rc = read_scan("%s", MAX_DATA * 2,&first_name);
    check(rc == 0, "Failed first name.");

    my_printf("\nWhat's your initial? ");
    rc = read_scan("%c", &initial);
    check(rc == 0, "Failed initial.");

    my_printf("\nWhat's your last name? ");
    rc = read_scan("%s", MAX_DATA, &last_name);
    check(rc == 0, "Failed last name.");

    my_printf("\nHow old are you? ");
    rc = read_scan("%d", &age);

    my_printf("---- RESULTS ----\n");
    my_printf("First Name: %s\n", first_name);
    my_printf("Initial: '%c'\n", initial);
    my_printf("Last Name: %s\n", last_name);
    my_printf("Age: %d\n", age);

    free(first_name);
    free(last_name);
    
    return 0;
error:
    return -1;
}
