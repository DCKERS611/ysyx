#include <stdio.h>

int main(int argc, char *argv[])
{
    int distance = 100;
    float power = 2.345f;
    double super_power = 56789.4532;
    char initial = 'A';
    char first_name[] = "Zed";
    char last_name[] = "Shaw";

    printf("You are %d miles away.\n", distance);
    printf("You have %f levels of power.\n", power);
    printf("You have %f awesome super powers.\n", super_power);
    printf("I have an initial %c.\n", initial);
    printf("I have a first name %s.\n", first_name);
    printf("I have a last name %s.\n", last_name);
    printf("My whole name is %s %c. %s.\n", first_name, initial, last_name);
    
    // --- 任务 3：尝试不同进制 ---
    printf("\n--- Different Number Bases for 'distance' ---\n");
    printf("Decimal: %d\n", distance);
    printf("Octal: %o\n", distance);
    printf("Hexadecimal: %x\n", distance);
    printf("Hex with prefix: %#x\n", distance);

    // --- 任务 2：高级格式化 ---
    printf("\n--- Advanced Formatting ---\n");
    printf("Power (Scientific): %e\n", power);
    printf("Power (Width 8, Precision 2): %8.2f\n", power);

    // --- 任务 4：打印空字符串 ---
    printf("\n--- Empty Strings ---\n");
    printf("Empty string: [%s]\n", "");
    
    // --- 任务 1：让它崩溃（取消下面这行的注释，重新编译运行，看看会发生什么）---
    // printf("Crashing now: %s\n", distance); 

    return 0;
}
