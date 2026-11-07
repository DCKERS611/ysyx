#include <cstdio>
#include <string>
#include <vector>

#include "Vtop.h"
#include "Vtop___024root.h"
#include "verilated.h"
#include "emu.h"
#include "expectations.h"
#include "pmem.h"
#include "sim.h"

struct Difference {
    std::string field;
    uint32_t actual;
    uint32_t expected;
};

struct Counts {
    unsigned fails = 0;
    unsigned total = 0;

    void check(std::vector<Difference>& differences, const std::string& field,
               uint32_t actual, uint32_t expected)
    {
        ++total;
        if (actual != expected) {
            ++fails;
            differences.push_back({field, actual, expected});
        }
    }
};

static void print_differences(unsigned step, uint32_t pc, uint32_t inst,
                              const std::vector<Difference>& differences,
                              const Counts& core, const Counts& extra)
{
    std::printf("step=%u pre_pc=0x%08x inst=0x%08x\n", step, pc, inst);
    for (const auto& difference : differences)
        std::printf("%s: actual=0x%08x expect=0x%08x\n",
                    difference.field.c_str(), difference.actual, difference.expected);
    std::printf("FAILED: %u/%u\n", core.fails + extra.fails, core.total + extra.total);
}

int main(int argc, char** argv)
{
    if (argc != 2 && argc != 4) {
        std::fprintf(stderr, "Usage: %s <program.bin> [expectations case-name]\n", argv[0]);
        return 1;
    }
    const std::string name = argc == 4 ? argv[3] : argv[1];
    ExpectedProgram expected;
    if (argc == 4 && !read_expectations(argv[2], expected)) return 1;

    static minirv::Emulator emu;
    std::string error;
    if (!emu.load_program(argv[1], error)) {
        std::fprintf(stderr, "EMU: %s\n", error.c_str());
        return 1;
    }
    if (!pmem_load_file(argv[1])) return 1;

    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    Vtop dut{&ctx};
    sim_set_verbose(false);
    if (!sim_init(dut, nullptr)) {
        sim_close(dut);
        return 1;
    }

    // 统一测试初态。rf[0] 是未使用的底层槽，也初始化为0以便快照；
    // x0 的实际读行为还通过下方读端口比较和 x0_readonly 程序检查。
    for (unsigned i = 0; i < 16; ++i)
        dut.rootp->top__DOT__u_rf__DOT__rf[i] = 0;
    sim_reset(dut);
    emu.reset();

    Counts core, extra;
    unsigned attempts = 0, cycles = 0;
    bool step_failed = false;
    std::vector<uint32_t> trace;
    uint32_t last_pc = 0, last_inst = 0;

    // E6 编译程序比 E5 手写程序大，统一使用一百万步保护。
    constexpr unsigned max_steps = 10000000;
    while (!ctx.gotFinish() && attempts < max_steps) {

        if (sim_cycles() >= 3ull * max_steps + 3) {
            std::fprintf(stderr, "Difftest cycle limit exceeded\n");
            sim_close(dut);
            return 1;
        }

        if (!dut.commit) {
            if (!sim_step(dut)) {
                std::fprintf(stderr, "NPC failed during fetch wait\n");
                sim_close(dut);
                return 1;
            }
            continue;
        }
        const uint32_t pre_pc = dut.pc;
        const uint32_t inst = dut.inst;
        const uint32_t read1 = dut.rootp->top__DOT__rs1_data;
        const uint32_t read2 = dut.rootp->top__DOT__rs2_data;
        const bool illegal = dut.illegal;

        if (argc == 4) trace.push_back(pre_pc);
        last_pc = pre_pc;
        last_inst = inst;
        ++attempts;

        // 顺序固定：NPC 一拍，然后 EMU 一条；两边存储器独立。
        const bool accepted = sim_step(dut);
        const auto info = emu.step();
        const auto& reference = emu.get_state();
        if (info.status == minirv::StepStatus::fault) {
            std::fprintf(stderr, "step=%u pre_pc=0x%08x inst=0x%08x EMU fault: %s\n",
                         attempts, pre_pc, inst, info.error.c_str());
            sim_close(dut);
            return 1;
        }
        
        if (info.device_load && info.device_load_rd != 0)
            emu.set_reg(info.device_load_rd,
                        dut.rootp->top__DOT__u_rf__DOT__rf[info.device_load_rd]);
        std::vector<Difference> differences;
        const bool rejected = info.status == minirv::StepStatus::illegal;
        extra.check(differences, "pre_pc", pre_pc, info.pc);
        extra.check(differences, "inst", inst, info.inst);
        extra.check(differences, "illegal", illegal, rejected);
        extra.check(differences, "accepted", accepted, !rejected);

        // 主计数每步17项。ebreak 不比较后PC，用执行前PC作为这一项。
        if (info.status == minirv::StepStatus::halted)
            core.check(differences, "pc.before_ebreak", pre_pc, info.pc);
        else
            core.check(differences, "pc", dut.pc, reference.pc);
        for (unsigned i = 0; i < 16; ++i)
            core.check(differences, "x" + std::to_string(i),
                       dut.rootp->top__DOT__u_rf__DOT__rf[i], reference.R[i]);

        if (!rejected) {
            if (info.reads_rs1) extra.check(differences, "rs1.read", read1, info.rs1_value);
            if (info.reads_rs2) extra.check(differences, "rs2.read", read2, info.rs2_value);
        }
        extra.check(differences, "halted", sim_halted(), reference.halted);
        extra.check(differences, "finish", ctx.gotFinish(), reference.halted);
        if (reference.halted)
            extra.check(differences, "halt_pc", sim_halt_pc(), reference.halt_pc);

        // 先收集本条指令的全部差异，再停止；不会只打印首个寄存器。
        if (!differences.empty()) {
            print_differences(attempts, pre_pc, inst, differences, core, extra);
            sim_close(dut);
            return 1;
        }
        if (!accepted) {
            step_failed = true;
            break;
        }
        ++cycles;
    }

    if (!ctx.gotFinish() && !step_failed && attempts == max_steps) {
        std::fprintf(stderr, "DiffTest timed out after %u steps at pc=0x%08x\n",
                     attempts, static_cast<uint32_t>(dut.pc));
        sim_close(dut);
        return 1;
    }

    std::vector<Difference> differences;
    extra.check(differences, "expected_illegal_stop", step_failed, expected.illegal);
    extra.check(differences, "expected_ebreak", sim_halted(), !expected.illegal);
    if (!differences.empty()) {
        print_differences(attempts, last_pc, last_inst, differences, core, extra);
        sim_close(dut);
        return 1;
    }

    // 程序结束后比较整块内存，收集全部差异；单独统计，保持每步17项。
    Counts memory;
    for (unsigned offset = 0; offset < minirv::CPUState::memory_size; offset += 4) {
        // 循环变量是数组偏移；pmem_read 和 word 接收 CPU 地址。
        const uint32_t addr = minirv::CPUState::memory_base + offset;
        const uint32_t actual = static_cast<uint32_t>(pmem_read(static_cast<int>(addr)));
        const uint32_t expected_word = emu.word(addr);
        // 128MB 共 33554432 个字，相同的项只计数，避免为每项构造字符串。
        if (actual == expected_word)
            ++memory.total;
        else
            memory.check(differences, "memory[" + std::to_string(addr) + "]",
                         actual, expected_word);
    }
    if (!differences.empty()) {
        Counts all_extra{extra.fails + memory.fails, extra.total + memory.total};
        print_differences(attempts, last_pc, last_inst, differences, core, all_extra);
        sim_close(dut);
        return 1;
    }

    // 不带 EXPECT 文件时是 E6 AM 入口：一致还不够，程序也必须报告成功。
    if (argc == 2) {
        const uint32_t exit_code = emu.get_state().R[10];
        std::printf("%s: a0=0x%08x\n",
                    exit_code == 0 ? "HIT GOOD TRAP" : "HIT BAD TRAP", exit_code);
        if (exit_code != 0) {
            std::fprintf(stderr, "DiffTest states agree, but the AM program returned nonzero.\n");
            sim_close(dut);
            return 1;
        }
    }

    std::printf("[ DIFF PASS ] %s\n", name.c_str());
    std::printf("PASS: %u (%u steps x 17)\n", core.total, attempts);
    std::printf("Memory: PASS %u words; protocol/read checks: %u\n",
                memory.total, extra.total);
    std::printf("halt_pc=0x%08x NPC.pc=0x%08x EMU.pc=0x%08x\n",
                sim_halt_pc(), static_cast<uint32_t>(dut.pc), emu.get_state().pc);

    int result = 0;
    if (argc == 4)
        result = check_expectations(dut, expected, step_failed, sim_cycles(), trace, name);
    sim_close(dut);
    return result;
}
