#ifndef NPC_CPU_VIEW_H
#define NPC_CPU_VIEW_H

#include <cassert>
#include <cstdint>
#include "Vysyx_00000000.h"
#include "Vysyx_00000000___024root.h"

// 独立 NPC 的观察接口：只有这一层依赖 Verilator 生成的内部层级名。
// SoC 使用 VSimTop，不能直接复用这一层的 CPU 实例路径。
namespace npc {
using Cpu = Vysyx_00000000;

inline uint32_t pc(const Cpu& dut) { return dut.rootp->ysyx_00000000__DOT__pc; }
inline uint32_t inst(const Cpu& dut) { return dut.rootp->ysyx_00000000__DOT__inst; }
inline bool commit(const Cpu& dut) { return dut.rootp->ysyx_00000000__DOT__commit; }
inline bool illegal(const Cpu& dut) { return dut.rootp->ysyx_00000000__DOT__illegal; }
inline uint32_t rs1_data(const Cpu& dut) { return dut.rootp->ysyx_00000000__DOT__rs1_data; }
inline uint32_t rs2_data(const Cpu& dut) { return dut.rootp->ysyx_00000000__DOT__rs2_data; }

// 原始 GPR 存储槽：测试初始化可以写入；x0 读行为仍由指令测试验证。
inline auto& gpr(Cpu& dut, unsigned index)
{
    assert(index < 16);
    return dut.rootp->ysyx_00000000__DOT__u_rf__DOT__rf[index];
}
}
#endif
