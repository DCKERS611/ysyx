// 逐提交对照独立 EMU；通过条件包含辅助检查、整块内存和可选 EXPECT。
#include "cpu_view.h"
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>
#include "verilated.h"
#include "emu.h"
#include "expectations.h"
#include "pmem.h"
#include "sim.h"

static void print_differences(uint64_t step, uint32_t pc, uint32_t inst,
                              const diff_collector& core, const diff_collector& extra,
                              uint64_t total, unsigned failures)
{
    std::printf("step=%llu pre_pc=0x%08x inst=0x%08x\n",
                static_cast<unsigned long long>(step), pc, inst);
    for (const auto* group : {&core, &extra})
        for (const auto& item : group->differences())
            std::printf("%s: actual=0x%08x expect=0x%08x\n",
                        item.field.c_str(), item.actual, item.expected);
    std::printf("FAILED: %u/%llu\n", failures, static_cast<unsigned long long>(total));
}

int main(int argc, char** argv)
{
    if (argc != 2 && argc != 4) {
        std::fprintf(stderr, "Usage: %s <program.bin> [expectations case-name]\n", argv[0]);
        return 1;
    }
    const char* filename = std::strrchr(argv[1], '/');
    const std::string name = argc == 4 ? argv[3] : (filename ? filename + 1 : argv[1]);
    expected_program expected;
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
    Vysyx_00000000 dut{&ctx};
    sim_session sim;
    sim_set_verbose(false);
    if (!sim.init(dut, nullptr)) return 1;

    // 原始 x0 槽也清零；x0 的实际读行为仍由指令和读端口检查。
    for (unsigned i = 0; i < 16; ++i) npc::gpr(dut, i) = 0;
    sim.reset();
    emu.reset();

    uint64_t core_checks = 0, extra_checks = 0, memory_checks = 0;
    unsigned core_fail = 0, extra_fail = 0, memory_fail = 0;
    checker checks;
    const auto finish = [&](stop_reason reason, bool passed) {
        const std::string extra =
            "core=" + std::to_string(core_checks) + " core_fail=" + std::to_string(core_fail)
            + " extra=" + std::to_string(extra_checks) + " extra_fail=" + std::to_string(extra_fail)
            + " memory=" + std::to_string(memory_checks) + " memory_fail=" + std::to_string(memory_fail);
        sim_print_result(name.c_str(), "diff", sim.result(reason), passed,
                         checks.total(), checks.failures(), extra.c_str());
        return passed ? 0 : 1;
    };
    std::vector<uint32_t> trace;
    uint32_t last_pc = 0, last_inst = 0;
    stop_reason reason = stop_reason::running;
    constexpr run_limits limits{67, 1};
    while (!ctx.gotFinish() && sim.attempts() < limits.max_attempts) {
        if (sim.cycles() >= limits.max_cycles) {
            std::fprintf(stderr, "Difftest cycle limit exceeded\n");
            return finish(stop_reason::cycle_limit, false);
        }
        if (!npc::commit(dut)) {
            const auto event = sim.step();
            if (event == step_event::fault)
                return finish(stop_reason::fetch_unaligned, false);
            if (event != step_event::waiting) {
                std::fprintf(stderr, "unexpected step event during fetch wait\n");
                return finish(stop_reason::comparison_mismatch, false);
            }
            continue;
        }

        // 只读采样，位置与旧入口相同；这里不得调用 eval。
        const uint32_t pre_pc = npc::pc(dut);
        const uint32_t inst = npc::inst(dut);
        const uint32_t read1 = npc::rs1_data(dut);
        const uint32_t read2 = npc::rs2_data(dut);
        const bool illegal = npc::illegal(dut);
        if (argc == 4) trace.push_back(pre_pc);
        last_pc = pre_pc;
        last_inst = inst;

        const auto event = sim.step();
        if (event == step_event::fault)
            return finish(stop_reason::fetch_unaligned, false);
        if (event != step_event::committed && event != step_event::halted
            && event != step_event::rejected) {
            std::fprintf(stderr, "unexpected step event during commit\n");
            return finish(stop_reason::comparison_mismatch, false);
        }
        const bool accepted = event == step_event::committed || event == step_event::halted;
        const auto info = emu.step();
        const auto& reference = emu.get_state();
        if (info.status == minirv::StepStatus::fault) {
            std::fprintf(stderr, "step=%llu pre_pc=0x%08x inst=0x%08x EMU fault: %s\n",
                         static_cast<unsigned long long>(sim.attempts()), pre_pc, inst, info.error.c_str());
            return finish(stop_reason::reference_fault, false);
        }

        // 设备值由 NPC 采样；只同步既有 device_load 的非 x0 目标。
        if (info.device_load && info.device_load_rd != 0)
            emu.set_reg(info.device_load_rd, npc::gpr(dut, info.device_load_rd));

        diff_collector core, extra;
        const bool rejected = info.status == minirv::StepStatus::illegal;
        extra.compare("pre_pc", pre_pc, info.pc);
        extra.compare("inst", inst, info.inst);
        extra.compare("illegal", illegal, rejected);
        extra.compare("accepted", accepted, !rejected);
        if (info.status == minirv::StepStatus::halted)
            core.compare("pc.before_ebreak", pre_pc, info.pc);
        else
            core.compare("pc", npc::pc(dut), reference.pc);
        for (unsigned i = 0; i < 16; ++i)
            core.compare("x" + std::to_string(i), npc::gpr(dut, i), reference.R[i]);
        if (!rejected) {
            if (info.reads_rs1) extra.compare("rs1.read", read1, info.rs1_value);
            if (info.reads_rs2) extra.compare("rs2.read", read2, info.rs2_value);
        }
        extra.compare("halted", sim.halted(), reference.halted);
        extra.compare("finish", ctx.gotFinish(), reference.halted);
        if (reference.halted) extra.compare("halt_pc", sim.halt_pc(), reference.halt_pc);

        core_checks += core.total();
        extra_checks += extra.total();
        core_fail += core.failures();
        extra_fail += extra.failures();
        if (!core.ok() || !extra.ok()) {
            print_differences(sim.attempts(), pre_pc, inst, core, extra,
                              core_checks + extra_checks, core_fail + extra_fail);
            return finish(stop_reason::comparison_mismatch, false);
        }
        if (!accepted) {
            reason = stop_reason::rejected;
            break;
        }
    }

    if (reason == stop_reason::running) {
        if (sim.halted()) reason = stop_reason::ebreak;
        else if (ctx.gotFinish()) reason = stop_reason::external_finish;
        else reason = stop_reason::attempt_limit;
    }
    if (reason == stop_reason::attempt_limit) {
        std::fprintf(stderr, "DiffTest timed out after %llu steps at pc=0x%08x\n",
                     static_cast<unsigned long long>(sim.attempts()), npc::pc(dut));
        return finish(reason, false);
    }

    diff_collector no_core, final_extra;
    final_extra.compare("expected_illegal_stop", reason == stop_reason::rejected, expected.illegal);
    final_extra.compare("expected_ebreak", sim.halted(), !expected.illegal);
    extra_checks += final_extra.total();
    extra_fail += final_extra.failures();
    if (!final_extra.ok()) {
        print_differences(sim.attempts(), last_pc, last_inst, no_core, final_extra,
                          core_checks + extra_checks, core_fail + extra_fail);
        return finish(reason, false);
    }

    // 全部 128 MiB 都比较；相同字只计数，只有差异才构造字段名。
    diff_collector memory;
    for (unsigned offset = 0; offset < minirv::CPUState::memory_size; offset += 4) {
        const uint32_t addr = minirv::CPUState::memory_base + offset;
        const uint32_t actual = static_cast<uint32_t>(pmem_read(static_cast<int>(addr)));
        const uint32_t expected_word = emu.word(addr);
        ++memory_checks;
        if (actual != expected_word)
            memory.compare("memory[" + std::to_string(addr) + "]", actual, expected_word);
    }
    memory_fail = memory.failures();
    if (!memory.ok()) {
        print_differences(sim.attempts(), last_pc, last_inst, no_core, memory,
                          core_checks + extra_checks + memory_checks,
                          core_fail + extra_fail + memory_fail);
        return finish(stop_reason::comparison_mismatch, false);
    }

    if (argc == 2) {
        const uint32_t exit_code = emu.get_state().R[10];
        std::printf("%s: a0=0x%08x\n",
                    exit_code == 0 ? "HIT GOOD TRAP" : "HIT BAD TRAP", exit_code);
        if (exit_code != 0) {
            std::fprintf(stderr, "DiffTest states agree, but the AM program returned nonzero.\n");
            return finish(reason, false);
        }
    }
    if (argc == 4 && check_expectations(dut, expected, sim.result(reason), trace, name, checks) != 0)
        return finish(reason, false);

    std::printf("[ DIFF PASS ] %s\n", name.c_str());
    std::printf("PASS: %llu (%llu steps x 17)\n",
                static_cast<unsigned long long>(core_checks),
                static_cast<unsigned long long>(sim.attempts()));
    std::printf("Memory: PASS %llu words; protocol/read checks: %llu\n",
                static_cast<unsigned long long>(memory_checks),
                static_cast<unsigned long long>(extra_checks));
    std::printf("halt_pc=0x%08x NPC.pc=0x%08x EMU.pc=0x%08x\n",
                sim.halt_pc(), npc::pc(dut), emu.get_state().pc);
    return finish(reason, true);
}
