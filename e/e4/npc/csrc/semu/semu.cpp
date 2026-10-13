#include "semu.h"

static const uint8_t program[] = {
    0x86, 0x92, 0x01, 0x90, 0xA0, 0xB1,
    0x17, 0x29, 0xF9, 0x68, 0xC3
};

void SEMU::reset()
{
    state = CPUState();
}

const CPUState& SEMU::get_state() const
{
    return state;
}

void SEMU::step()
{
    // fetch inst: when current's ROM of RTL return addr in anothers, return 0x00
    uint8_t inst = state.pc < sizeof(program) ? program[state.pc] : 0x00;

    // decoder
    unsigned opcode = inst >> 6;
    unsigned rd     = (inst >> 4) & 3;
    unsigned field32 = (inst >> 2) & 3;
    unsigned field10 = inst & 3;

    uint8_t next_pc = static_cast<uint8_t>(state.pc + 1);

    // exe & write back
    switch(opcode) {
        case 0: // add
            state.r[rd] = static_cast<uint8_t>(state.r[field32] +state.r[field10]);
            break;
        case 1: // io
            if ((inst & 8) && ((inst & 7) == 0))
                state.led = state.r[rd];
            break;
        case 2: // enhanced_li
            state.r[rd] = static_cast<uint8_t>(field10 << (2 * field32));
            break;
        case 3: {// bner0
            int offset = (inst >>2) & 15;

            if (offset & 8)
                offset -= 16;
            if (state.r[0] != state.r[field10])
                next_pc = static_cast<uint8_t>(state.pc + offset);
            break;
        }
    }

    // 更新pc
    state.pc = next_pc;

}
