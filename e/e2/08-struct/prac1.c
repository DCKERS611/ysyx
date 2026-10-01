#include <stdio.h>

struct point {
    double x;
    double y;
};

int main ()
{
    struct point p1;
    p1.x = 3.0;
    p1.y = 4.0;
    printf("p1 = (%f , %f)\n" , p1.x , p1.y);

    struct point p2 = {5.0 , 6.0};
    struct point p3 = {
        .x = 7.0,
        .y = 8.0
    };
    printf("p2 = (%f , %f)\n" , p2.x , p2.y);
    printf("p3 = (%f , %f)\n" , p3.x, p3.y);

    return 0;
}
