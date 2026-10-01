#include <unistd.h>

int main(int argc, char *argv[])
{
    int i = 0;
    while(i < 100) {
        usleep(3000);
        i ++;
        if (i > 5) {
            int *p = NULL;
            *p = 1;
        }
    }

    return 0;
}
