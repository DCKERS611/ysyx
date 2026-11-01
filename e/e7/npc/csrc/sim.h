#ifndef NPC_SIM_H
#define NPC_SIM_H

#include <cstdint>

class Vysyx_00000000;

bool sim_init(Vysyx_00000000& dut, const char* wave_path);
void sim_reset(Vysyx_00000000& dut);
void sim_set_verbose(bool enabled);
bool sim_step(Vysyx_00000000& dut);
bool sim_halted();
uint32_t sim_halt_pc();
void sim_close(Vysyx_00000000& dut);
// 0 表示随机回复，1～20 表示固定延迟。
unsigned sim_memory_delay();
uint64_t sim_cycles();
uint64_t sim_instructions();

#endif
