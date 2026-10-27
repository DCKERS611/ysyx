#ifndef MINIRV_EMU_H
#define MINIRV_EMU_H

#include <array>
#include <cstdint>
#include <string>

namespace minirv {

struct CPUState {
    static constexpr uint32_t memory_base = 0x80000000u;
    static constexpr unsigned memory_size = 128*1024*1024;
    uint32_t pc = memory_base;
    std::array<uint32_t, 16> R{};
    std::array<uint8_t, memory_size> M{};
    bool halted = false;
    uint32_t halt_pc = 0;
};

enum class StepStatus { executed, halted, illegal, fault };

struct StepInfo {
    StepStatus status = StepStatus::fault;
    uint32_t pc = 0;
    uint32_t inst = 0;
    bool reads_rs1 = false;
    bool reads_rs2 = false;
    uint32_t rs1_value = 0;
    uint32_t rs2_value = 0;
    std::string error;
    bool device_load = false;
    unsigned device_load_rd  = 0;
};

// 核心不打印；独立 main 和 NPC DiffTest 共用同一份执行实现。
class Emulator {
public:
    void reset();
    bool load_program(const char* path, std::string& error);
    StepInfo step();
    const CPUState& get_state() const { return state_; }
    uint32_t word(unsigned address) const;
    void set_reg(unsigned index, uint32_t value) {
        if (index != 0) state_.R[index] = value;
    }

private:
    CPUState state_{};
};

} // namespace minirv

#endif
