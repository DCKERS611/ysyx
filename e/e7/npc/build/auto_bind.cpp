#include <nvboard.h>
#include "Vysyx_00000000.h"

void nvboard_bind_all_pins(Vysyx_00000000* top) {
	nvboard_bind_pin( &top->rst, 1, BTNC);
	nvboard_bind_pin( &top->led, 8, LD7, LD6, LD5, LD4, LD3, LD2, LD1, LD0);
}
