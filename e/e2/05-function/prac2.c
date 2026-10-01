#include <stdio.h>
#include <math.h>
const double pi = acos(-1.0);
double distance(double x1 , double y1, double x2, double y2)
{
    double dx = pow(x1 - x2 , 2);
    double dy = pow(y1 - y2 , 2);
    double dis = sqrt(dx + dy);
    return dis;
}

double area(double radius)
{
    return pi * (radius * radius);
}

double area_point(double x1 , double y1 , double x2 , double y2)
{
    double radius = distance(x1 , y1 , x2 , y2);
    return area(radius);
}

int main(void)
{
    double res = distance(1.0 , 2.0 , 4.0 , 6.0);
    printf("distance1 = %f \n" , res);

    double dis = distance(1,2,4,6);
    printf("distance2 = %f \n", dis);
    double getArea1 = area(5);
    printf("area(5) = %f \n", getArea1);
    double getArea2 = area_point(1,2,4,6);
    printf("area_point = %f\n", getArea2);
    return 0;
}

