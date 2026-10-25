#include <stdio.h>
#include <string>
#include "emu.h"
#include "reference_bridge.h"

/* 这一小层适配已有 E5 EMU，不重写参考模型，也不改变原 EMU。
 * 初读时可把它当库：主文件只需要知道头文件中的普通函数。 */
static minirv::Emulator emulator;

int ref_load(const char *path)
{
    std::string error;
    if (!emulator.load_program(path, error)) {
        fprintf(stderr, "EMU load: %s\n", error.c_str());
        return 0;
    }
    emulator.reset();
    return 1;
}

int ref_step(struct RefStep *info)
{
    minirv::StepInfo result = emulator.step();
    info->pc = result.pc;
    info->inst = result.inst;
    info->reads_rs1 = result.reads_rs1;
    info->reads_rs2 = result.reads_rs2;
    info->rs1_value = result.rs1_value;
    info->rs2_value = result.rs2_value;
    switch (result.status) {
        case minirv::StepStatus::executed: info->status = REF_EXECUTED; break;
        case minirv::StepStatus::halted: info->status = REF_HALTED; break;
        case minirv::StepStatus::illegal: info->status = REF_ILLEGAL; break;
        default:
            info->status = REF_FAULT;
            fprintf(stderr, "EMU fault: %s\n", result.error.c_str());
            return 0;
    }
    return 1;
}

void ref_get_state(struct RefState *state)
{
    const minirv::CPUState *source = &emulator.get_state();
    state->pc = source->pc;
    for (unsigned i = 0; i < 16; i++) state->reg[i] = source->R[i];
    state->halted = source->halted;
    state->halt_pc = source->halt_pc;
}

uint32_t ref_word(unsigned addr) { return emulator.word(addr); }
unsigned ref_memory_size(void) { return minirv::CPUState::memory_size; }
