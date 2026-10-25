#ifndef NPC_SIM_H
#define NPC_SIM_H

#include <cstdint>

class Vtop;

bool sim_init(Vtop& dut, const char* wave_path);
void sim_reset(Vtop& dut);
void sim_set_verbose(bool enabled);
bool sim_step(Vtop& dut);
bool sim_halted();
uint32_t sim_halt_pc();
void sim_close(Vtop& dut);
uint64_t sim_cycles();

#endif
