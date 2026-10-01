#include <stdio.h>
#include <math.h>

enum shapeType {
    POINT,
    SEGMENT
};

struct point {
    double x;
    double y;
};

struct segment {
    struct point start;
    struct point end;
};

double segmentLength (struct segment s)
{
    double dx = s.start.x - s.end.x;
    double dy = s.start.y - s.end.y;

    return sqrt(dx * dx + dy * dy );
}

struct segment s = {
    .start  = {1.0 , 2.0},
    .end    = {4.0 , 6.0}
};

int main (void)
{
    printf("segmentLength is %f\n" , segmentLength(s));
    return 0;
}
