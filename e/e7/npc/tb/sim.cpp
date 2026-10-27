#include "verilated.h"
#include "Vour.h"
#include "Vour__Dpi.h"
#include <cstdio>

int add(int a, int b)
{
    std::printf("[C++ add] a=%d b=%d\n", a, b);
    return a + b;
}

int main(int argc, char** argv)
{
    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);

    Vour top{&ctx};
    top.eval();
    top.final();

    return 0;
}
