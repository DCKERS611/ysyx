#include <stdio.h>

void print_time(int hour , int min)
{
	printf("%d : %d \n" , hour , min);
}

int main(void)
{
	print_time(23,59);
}
