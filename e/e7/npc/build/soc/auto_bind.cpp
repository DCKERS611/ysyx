#include <nvboard.h>
#include "VSimTop.h"

void nvboard_bind_all_pins(VSimTop* top) {
	nvboard_bind_pin( &top->externalPins_uart0_tx, 1, UART_TX);
	nvboard_bind_pin( &top->externalPins_uart0_rx, 1, UART_RX);
}
