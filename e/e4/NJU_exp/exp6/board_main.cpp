#include <nvboard.h>
#include <Vtop.h>

static TOP_NAME dut;

void nvboard_bind_all_pins(TOP_NAME* top);

int main() {
    nvboard_bind_all_pins(&dut);
    nvboard_init();

    // 上电复位
    dut.rst = 1;
    dut.btn = 0;
    for (int i = 0; i < 10; i++) {
        dut.clk = 0; dut.eval();
        dut.clk = 1; dut.eval();
    }
    dut.rst = 0;

    while (1) {
        nvboard_update();          // 读按钮/开关
        dut.clk = 0; dut.eval();
        dut.clk = 1; dut.eval();   // 每个上升沿：若刚按下按钮就步进一步
    }
}
