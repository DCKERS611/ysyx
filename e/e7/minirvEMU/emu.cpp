#include "emu.h"

#include <fstream>
#include <iterator>
#include <vector>

namespace minirv {

void Emulator::reset()
{
    // CPU 复位不清除已装载的程序。
    state_.pc = CPUState::memory_base;
    state_.R.fill(0);
    state_.halted = false;
    state_.halt_pc = 0;
}

bool Emulator::load_program(const char* path, std::string& error)
{
    std::ifstream input(path, std::ios::binary);
    if (!input) {
        error = "cannot open reference image";
        return false;
    }
    const std::vector<uint8_t> bytes(
        (std::istreambuf_iterator<char>(input)), std::istreambuf_iterator<char>());
    if (input.bad() || bytes.empty() || bytes.size() % 4 != 0
        || bytes.size() > CPUState::memory_size) {
        error = "invalid reference image";
        return false;
    }

    reset();
    state_.M.fill(0);
    for (size_t i = 0; i < bytes.size(); ++i) state_.M[i] = bytes[i];
    return true;
}

uint32_t Emulator::word(unsigned address) const
{
    uint32_t offset = address - CPUState::memory_base;
    uint32_t result = 0;

    for (unsigned i = 0; i < 4; ++i)
        result |= static_cast<uint32_t>(state_.M[offset + i]) << (8 * i);
    return result;
}

StepInfo Emulator::step()
{
    StepInfo info;
    info.pc = state_.pc;
    const uint32_t pc_offset = state_.pc - CPUState::memory_base;

    if (state_.halted) {
        info.error = "reference already halted";
        return info;
    }
    if ((state_.pc & 3u) || pc_offset > CPUState::memory_size - 4) {
        info.error = "reference fetch outside aligned memory";
        return info;
    }

    info.inst = word(state_.pc);
    const uint32_t inst = info.inst;
    const unsigned op = inst & 0x7f;
    const unsigned rd = (inst >> 7) & 31;
    const unsigned f3 = (inst >> 12) & 7;
    const unsigned rs1 = (inst >> 15) & 31;
    const unsigned rs2 = (inst >> 20) & 31;
    const unsigned f7 = inst >> 25;

    // 用算术方式符号扩展，独立于 RTL 的位拼接写法。
    auto sext12 = [](uint32_t value) {
        const int32_t result = static_cast<int32_t>(value)
                             - ((value & 0x800u) ? 4096 : 0);
        return static_cast<uint32_t>(result);
    };
    const uint32_t imm_i = sext12(inst >> 20);
    const uint32_t imm_s = sext12(((inst >> 25) << 5) | ((inst >> 7) & 31));

    enum class Op { add, addi, lui, lw, lbu, sw, sb, jalr, ebreak };
    Op operation = Op::ebreak;
    bool writes_rd = false;
    bool supported = true;

    switch (op) {
        case 0x33:
            supported = f3 == 0 && f7 == 0;
            operation = Op::add;
            writes_rd = info.reads_rs1 = info.reads_rs2 = true;
            break;
        case 0x13:
            supported = f3 == 0;
            operation = Op::addi;
            writes_rd = info.reads_rs1 = true;
            break;
        case 0x37:
            operation = Op::lui;
            writes_rd = true;
            break;
        case 0x67:
            supported = f3 == 0;
            operation = Op::jalr;
            writes_rd = info.reads_rs1 = true;
            break;
        case 0x03:
            supported = f3 == 2 || f3 == 4;
            operation = f3 == 2 ? Op::lw : Op::lbu;
            writes_rd = info.reads_rs1 = true;
            break;
        case 0x23:
            supported = f3 == 2 || f3 == 0;
            operation = f3 == 2 ? Op::sw : Op::sb;
            info.reads_rs1 = info.reads_rs2 = true;
            break;
        case 0x73:
            supported = inst == 0x00100073;
            operation = Op::ebreak;
            break;
        default:
            supported = false;
            break;
    }

    if (!supported || (writes_rd && rd >= 16)
        || (info.reads_rs1 && rs1 >= 16)
        || (info.reads_rs2 && rs2 >= 16)) {
        info.status = StepStatus::illegal;
        // 在修改 PC、GPR、内存之前拒绝非法编码。
        return info;
    }

    const uint32_t a = info.reads_rs1 ? state_.R[rs1] : 0;
    const uint32_t b = info.reads_rs2 ? state_.R[rs2] : 0;
    info.rs1_value = a;
    info.rs2_value = b;
    uint32_t next_pc = state_.pc + 4;
    uint32_t value = 0;

    const bool load = operation == Op::lw || operation == Op::lbu;
    const bool store = operation == Op::sw || operation == Op::sb;
    const bool byte = operation == Op::lbu || operation == Op::sb;
    uint32_t address = 0;
    uint32_t offset = 0;
    bool device_store = false;
    bool device_load = false;
   
    if (load || store) {
        address = a + (store ? imm_s : imm_i);
        offset  = address - CPUState::memory_base;
        const unsigned width = byte ? 1 : 4;
        const bool device= 
            (address >= 0x10000000u && address < 0x10001000u) ||
             (address >= 0x20000000u && address < 0x20001000u);
        device_store = store && device;
        device_load = load && device;

        if (!(device_store || device_load) && (offset > CPUState::memory_size - width || (!byte && (address & 3u)))) {
            info.error = "reference data address out of range or unaligned";
            return info;
        }
    }
    info.device_load = device_load;
    info.device_load_rd = rd;
    switch (operation) {
        case Op::add: value = a + b; break;
        case Op::addi: value = a + imm_i; break;
        case Op::lui: value = inst & 0xfffff000u; break;
        case Op::jalr:
            // 必须先用旧 rs1 算目标，再写入 rd。
            next_pc = (a + imm_i) & ~1u;
            value = state_.pc + 4;
            break;
        case Op::lw: value = device_load ? 0 : word(address); break;
        case Op::lbu: value = device_load ? 0 :state_.M[offset]; break;
        case Op::sw:
            if (!device_store) {
                for (unsigned i = 0; i < 4; ++i)
                    state_.M[offset + i] = static_cast<uint8_t>(b >> (8 * i));
            }
            break;
        case Op::sb:
            if (!device_store) {
                state_.M[offset] = static_cast<uint8_t>(b);
            }
            break;
        case Op::ebreak:
            state_.halted = true;
            state_.halt_pc = state_.pc;
            // 约定：EMU 执行 ebreak 后保留当前 PC。
            info.status = StepStatus::halted;
            return info;
    }

    if (writes_rd && rd != 0) state_.R[rd] = value;
    state_.R[0] = 0;
    state_.pc = next_pc;
    info.status = state_.halted ? StepStatus::halted : StepStatus::executed;
    return info;
}

} // namespace minirv
