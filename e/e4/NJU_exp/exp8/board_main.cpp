#include <nvboard.h>
#include <Vtop.h>

static TOP_NAME dut;
void nvboard_bind_all_pins(TOP_NAME* top);

static void tick(Vtop& dut) { dut.clk = 0; dut.eval(); dut.clk = 1; dut.eval(); }

int main() {
    nvboard_bind_all_pins(&dut);
    nvboard_init();

    dut.rst = 1;
    for (int i = 0; i < 10; i++) tick(dut);
    dut.rst = 0;

    while (1) {
        nvboard_update();
        tick(dut);
    }
}
