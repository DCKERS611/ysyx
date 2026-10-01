#include <stdio.h>

/* TODO 1: 定义对象式宏 VALUE，使它代表整数 8 */

/* TODO 2: 定义函数式宏 DOUBLE(x)，注意参数和整体的括号 */

int main(void)
{
    printf("%d\n", VALUE);
    printf("%d\n", DOUBLE(1 + 2));
    printf("%d\n", 100 / DOUBLE(5));
    return 0;
}
