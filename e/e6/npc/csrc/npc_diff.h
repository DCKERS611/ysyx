#ifndef NPC_NPC_DIFF_H
#define NPC_NPC_DIFF_H

#include <cstdint>
#include <cstdio>
#include <string>

#include "emu.h"
#include "npc_test.h"

// 第 3 层：DiffTest 适配器。
//
// 与 minirvEMU 耦合的部分全部在这里，npc_test.h 不依赖 emu.h。
// 约定：参考模型 CPUState::M[off] 对应 NPC 地址 (base + off)；
// 如果你的 EMU 改成按绝对地址存，把 compare_memory 里的下标换掉。

class DiffStep {
public:
    void begin(unsigned step, std::uint32_t pre_pc, std::uint32_t inst)
    {
        step_ = step;
        pre_pc_ = pre_pc;
        inst_ = inst;
        diffs_.clear();
    }

    void compare(const std::string& field, std::uint32_t actual,
                 std::uint32_t expected)
    {
        diffs_.compare(field, actual, expected);
    }

    bool failed() const { return !diffs_.ok(); }
    unsigned total() const { return diffs_.total(); }
    unsigned failures() const { return diffs_.failures(); }

    void print() const
    {
        if (diffs_.ok()) return;

        std::printf("step=%u pre_pc=0x%08x inst=0x%08x\n",
                    step_, pre_pc_, inst_);
        for (const auto& d : diffs_.differences()) {
            std::printf("%s: actual=0x%08x expect=0x%08x\n",
                        d.field.c_str(), d.actual, d.expected);
        }
        std::printf("FAILED: %u/%u\n", diffs_.failures(), diffs_.total());
    }

private:
    unsigned step_ = 0;
    std::uint32_t pre_pc_ = 0;
    std::uint32_t inst_ = 0;
    DiffCollector diffs_;
};

// 比较一条指令执行后的架构状态：
//   pc（ebreak 时用执行前 pc）+ 16 个 GPR；
//   illegal / halted / halt_pc；
//   rs1/rs2 的读端口值（EMU 声明读过时才比）。
inline void compare_step(DiffStep& out, const Vtop& dut,
                         std::uint32_t pre_pc,
                         std::uint32_t read_rs1,
                         std::uint32_t read_rs2,
                         const minirv::StepInfo& info,
                         const minirv::CPUState& reference)
{
    const bool halted = info.status == minirv::StepStatus::halted;
    const bool illegal = info.status == minirv::StepStatus::illegal;

    if (halted)
        out.compare("pc.before_ebreak", pre_pc, info.pc);
    else
        out.compare("pc", static_cast<std::uint32_t>(dut.pc),
                    reference.pc);

    for (unsigned i = 0; i < 16; ++i) {
        out.compare("x" + std::to_string(i),
                    static_cast<std::uint32_t>(
                        dut.rootp->top__DOT__u_rf__DOT__rf[i]),
                    reference.R[i]);
    }

    out.compare("illegal", dut.illegal != 0 ? 1u : 0u,
                illegal ? 1u : 0u);
    out.compare("halted", sim_halted() ? 1u : 0u,
                reference.halted ? 1u : 0u);

    if (reference.halted)
        out.compare("halt_pc", sim_halt_pc(), reference.halt_pc);

    if (!illegal) {
        if (info.reads_rs1)
            out.compare("rs1.read", read_rs1, info.rs1_value);
        if (info.reads_rs2)
            out.compare("rs2.read", read_rs2, info.rs2_value);
    }
}

// 整块内存比较：NPC 从 pmem_read 读，EMU 从 CPUState::M 按偏移拼字。
inline void compare_memory(DiffStep& out, std::uint32_t base,
                           std::uint32_t bytes,
                           const minirv::CPUState& reference)
{
    if (bytes > reference.memory_size) bytes = reference.memory_size;

    for (std::uint32_t off = 0; off + 4 <= bytes; off += 4) {
        const std::uint32_t expected =
            static_cast<std::uint32_t>(reference.M[off]) |
            (static_cast<std::uint32_t>(reference.M[off + 1]) << 8) |
            (static_cast<std::uint32_t>(reference.M[off + 2]) << 16) |
            (static_cast<std::uint32_t>(reference.M[off + 3]) << 24);

        char field[40];
        std::snprintf(field, sizeof field, "mem[0x%08x]", base + off);
        out.compare(field,
                    static_cast<std::uint32_t>(
                        pmem_read(static_cast<int>(base + off))),
                    expected);
    }
}

#endif
