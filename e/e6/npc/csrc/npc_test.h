#ifndef NPC_NPC_TEST_H
#define NPC_NPC_TEST_H

#include <cstdint>
#include <string>
#include <vector>

#include "Vtop.h"
#include "Vtop___024root.h"
#include "check.h"
#include "pmem.h"
#include "sim.h"

// 第 2 层：面向 NPC/Verilator 的语义检查器。
//
// 把 E4/E5 测试里反复出现的底层写法收进来：
//   dut.pc / dut.inst / dut.illegal
//   dut.rootp->top__DOT__u_rf__DOT__rf[i]
//   sim_halted() / sim_halt_pc()
//   pmem_read()
//
// 测试代码只写“pc 应为 0x80000000”“x10 应为 0”这类语义。

class NpcTest : public Checker {
public:
    explicit NpcTest(Vtop& dut) : dut_(dut) {}

    // 语义读取。
    std::uint32_t pc() const
    {
        return static_cast<std::uint32_t>(dut_.pc);
    }

    std::uint32_t inst() const
    {
        return static_cast<std::uint32_t>(dut_.inst);
    }

    bool illegal() const { return dut_.illegal != 0; }

    bool halted() const { return sim_halted(); }

    std::uint32_t halt_pc() const { return sim_halt_pc(); }

    // rf 的底层槽；下标仅支持 0..15，越界返回 0（调用方保证）。
    std::uint32_t reg(unsigned index) const
    {
        return index < 16
                   ? static_cast<std::uint32_t>(
                         dut_.rootp->top__DOT__u_rf__DOT__rf[index])
                   : 0;
    }

    // 语义断言。
    bool expect_pc(const char* name, std::uint32_t expected,
                   const char* file = nullptr, int line = 0)
    {
        return eq_u32(name, pc(), expected, file, line);
    }

    bool expect_pc_aligned(const char* name,
                           const char* file = nullptr, int line = 0)
    {
        return aligned(name, pc(), 4, file, line);
    }

    bool expect_inst(const char* name, std::uint32_t expected,
                     const char* file = nullptr, int line = 0)
    {
        return eq_u32(name, inst(), expected, file, line);
    }

    bool expect_illegal(const char* name, bool expected,
                        const char* file = nullptr, int line = 0)
    {
        return eq_u32(name, illegal() ? 1u : 0u,
                      expected ? 1u : 0u, file, line);
    }

    bool expect_halted(const char* name, bool expected,
                       const char* file = nullptr, int line = 0)
    {
        return eq_u32(name, halted() ? 1u : 0u,
                      expected ? 1u : 0u, file, line);
    }

    bool expect_halt_pc(const char* name, std::uint32_t expected,
                        const char* file = nullptr, int line = 0)
    {
        return eq_u32(name, halt_pc(), expected, file, line);
    }

    bool expect_gpr(const char* name, unsigned index,
                    std::uint32_t expected,
                    const char* file = nullptr, int line = 0)
    {
        return eq_u32(name, reg(index), expected, file, line);
    }

    // x0 的底层槽应保持 0（写 x0 被丢弃）。
    bool expect_x0_zero(const char* name,
                        const char* file = nullptr, int line = 0)
    {
        return eq_u32(name, reg(0), 0, file, line);
    }

    // 16 个寄存器的整体比较，一个用例只记一次。
    bool expect_regs(const char* name, const std::uint32_t* expected,
                     unsigned count = 16,
                     const char* file = nullptr, int line = 0)
    {
        static const char* const names[16] = {
            "x0",  "x1",  "x2",  "x3",  "x4",  "x5",  "x6",  "x7",
            "x8",  "x9",  "x10", "x11", "x12", "x13", "x14", "x15"};
        if (count > 16) count = 16;

        Value values[16];
        for (unsigned i = 0; i < count; ++i)
            values[i] = {names[i], reg(i), expected[i]};
        return all(name, values, count, file, line);
    }

    // 单字内存检查（地址是 0x80000000 起的绝对地址）。
    bool expect_mem_word(const char* name, std::uint32_t addr,
                         std::uint32_t expected,
                         const char* file = nullptr, int line = 0)
    {
        return eq_u32(name,
                      static_cast<std::uint32_t>(
                          pmem_read(static_cast<int>(addr))),
                      expected, file, line);
    }

    // 连续 count 个字的内存检查，一个用例只记一次。
    bool expect_mem_words(const char* name, std::uint32_t addr,
                          const std::uint32_t* expected, unsigned count,
                          const char* file = nullptr, int line = 0)
    {
        std::vector<Value> values;
        values.reserve(count);
        for (unsigned i = 0; i < count; ++i) {
            char field[40];
            std::snprintf(field, sizeof field, "mem[0x%08x]",
                          addr + 4u * i);
            values.push_back(
                {field,
                 static_cast<std::uint32_t>(
                     pmem_read(static_cast<int>(addr + 4u * i))),
                 expected[i]});
        }
        return all(name, values.data(), values.size(), file, line);
    }

    // cycles 不超上限：主要用来把“超时”变成一条可读的检查。
    bool expect_cycles_at_most(const char* name, unsigned cycles,
                               unsigned limit,
                               const char* file = nullptr, int line = 0)
    {
        return in_range(name, cycles, 0, limit, file, line);
    }

private:
    Vtop& dut_;
};

#endif
