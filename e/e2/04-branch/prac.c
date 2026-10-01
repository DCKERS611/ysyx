#include <stdio.h>

void describe_num(int x)
{
    if (x > 0) printf("positive \n");
    else if (x < 0 ) printf("negative \n");
    else printf("zero! \n");

	if (x >= 3 && x <= 8) printf("x attributes to [3:8]\n");
	else printf("x aint attribute to [3:8] \n");
}

void print_day_type(int day)
{
	switch(day)
	{
		case 1:
		case 2:	
		case 3:
		case 4:
		case 5:
			printf("weekday\n");
			break;
		case 6:
		case 7:
			printf("weekend\n");
			break;
		default:
			printf("invalid\n");
			break;
	}
}

int main (void)
{
	int x;
	x = -1;
	describe_num(x);
	x = 3;
	describe_num(x);
	x = 9;
	describe_num(x);

	print_day_type(3);
	print_day_type(9);
	print_day_type(7);
	
	return 0;

}
