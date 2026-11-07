#ifndef NPC_DPI_H
#define NPC_DPI_H

#include <cstdint>

void dpi_reset();
void dpi_set_verbose(bool enabled);

bool dpi_halted();

uint32_t dpi_halt_pc();

#endif
