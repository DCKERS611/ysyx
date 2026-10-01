#include <stdio.h>

struct rational {
    int fenzi;
    int fenmu;
};

// 欧几里得算法
int gcd (int a ,int b)
{
    if (a < 0 ) a = -a;
    if (b < 0 ) b = -b;
    if (b == 0) return a;
    return gcd (b , a % b);
}

// 生成一个有理数
struct rational makeRational (int fenzi , int fenmu)
{
    int divisor = gcd(fenzi,fenmu);
    struct rational num = {
        fenzi / divisor,
        fenmu / divisor
    };
    if (num.fenmu < 0) 
    {
        num.fenzi = -num.fenzi;
        num.fenmu = -num.fenmu;
    }
    return num;
}

// 打印有理数
void printRational (struct rational num)
{
    printf("rational : %d/%d\n" , num.fenzi , num.fenmu);
}

// 两个有理数相加
struct rational addRational (struct rational num1 , struct rational num2)
{
    struct rational num ;
    num.fenzi = (num1.fenzi * num2.fenmu + num1.fenmu * num2.fenzi);
    num.fenmu = (num1.fenmu * num2.fenmu);
    return makeRational(num.fenzi , num.fenmu);    
}

int main (void) 
{
    struct rational a = makeRational (2 , 4);
    struct rational b = makeRational (2 , -4);
    struct rational c = makeRational (0 , 8);
    // struct rational res = addRational (a , b);
    struct rational d = makeRational(-1, 4);
    struct rational e = makeRational(1, 2);

    printf("d + e = ");
    printRational(addRational(d, e));
    printRational(a);
    printRational(b);
    printRational(c);
    
    return 0;
}
