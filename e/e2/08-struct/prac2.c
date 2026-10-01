#include <stdio.h>

struct point {
    double x;
    double y;
};

void printPoint (struct point p)
{
    printf("(%.1f,%.1f)\n" , p.x ,p.y);
}
void movePoint (struct point *p , double dx ,double dy)
{
    p->x += dx;
    p->y += dy;
}
int  main (void) 
{
    struct point p1 = {3.0 , 4.0};
    struct point p2 = {2.0 , 4.0};
    movePoint(&p2 , 2.0, -1.0);

    printPoint(p1);
    printPoint(p2);

    return 0;
}
