#include <stdio.h>

int increment (int x)
{
	x = x + 1;
}

int main (void)
{
	int i =1 , j=3;
	printf("%d \n " , increment(i));
	printf("%d \n " , increment(j));

}
/*
	不能,这里传递的是值,要修改i j , 需要传递i j的地址,
	同时修改函数为increment(int *x)
*/

