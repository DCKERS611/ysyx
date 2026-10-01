#include <stdio.h>

enum shapeType {
    RECTANGLE,
    TRIANGLE
};

struct shape {
    enum shapeType type;
    double width;
    double height;
};

double shapeArea (struct shape s)
{
    switch (s.type) {
        case RECTANGLE: 
            return s.width * s.height;
        case TRIANGLE: 
            return s.width * s.height * 0.5;
        default: 
            return -1.0;
    }
}

struct shape rect = {
    .type = RECTANGLE,
    .width = 4.0,
    .height = 3.0
};

struct shape trian = {
    .type = TRIANGLE,
    .width = 4.0,
    .height = 3.0
};

int main (void)
{
    printf("area of rectangle is : %.1f\n" , shapeArea(rect));
    printf("area of triangle is : %.1f\n" , shapeArea(trian));
    return 0;
}

