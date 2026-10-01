#include <nvboard.h>
#include <Vtop.h>

static TOP_NAME dut;

void nvboard_bind_all_pins(TOP_NAME* top);

static void single_cycle() {
    dut.clk = 0; dut.eval();
    dut.clk = 1; dut.eval();
}

static void reset(int n)
{
    dut.rst = 1;
    while(n-- > 0) single_cycle();
    dut.rst = 0;
}

int main() {
    nvboard_bind_all_pins(&dut);   // 绑定引脚（用生成的函数）
    nvboard_init();                // 开窗口

    reset(10);
    while (1) {
        nvboard_update();          // 读开关、刷 LED
        single_cycle();            // 电路走一步
    }
    return 0;
}
