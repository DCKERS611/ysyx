#include "cpu_view.h"
#ifndef NPC_TEST_EXPECTATIONS_H
#define NPC_TEST_EXPECTATIONS_H

#include <cstdint>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

#include "Vysyx_00000000.h"
#include "sim.h"
#include "pmem.h"
#include "test_suite.h"

struct expectation {
    std::string kind;
    std::vector<uint32_t> values;
};

struct expected_program {
    std::vector<expectation> items;
    bool illegal = false;
};

inline bool read_expectations(const char* path, expected_program& expected)
{
    std::ifstream input(path);
    if (!input) {
        std::fprintf(stderr, "%s: cannot open expectations\n", path);
        return false;
    }
    try {
        std::string line;
        while (std::getline(input, line)) {
            std::istringstream row(line);
            expectation item;
            if (!(row >> item.kind)) continue;
            std::string token;
            while (row >> token) {
                size_t end = 0;
                const unsigned long value = std::stoul(token, &end, 0);
                if (end != token.size() || value > UINT32_MAX)
                    throw std::invalid_argument("invalid expectation value");
                item.values.push_back(static_cast<uint32_t>(value));
            }
            const size_t count = item.values.size();
            const bool valid =
                ((item.kind == "halt" || item.kind == "cycles" || item.kind == "instructions" || item.kind == "cycles_random") && count == 1)
                || ((item.kind == "reg" || item.kind == "mem"
                     || item.kind == "illegal" || item.kind == "cycles_fixed") && count == 2)
                || (item.kind == "trace" && count > 0);
            if (!valid) throw std::invalid_argument("unknown or malformed expectation");
            if (item.kind == "cycles_fixed" && (item.values[0] < 1 || item.values[0] > 20))
                throw std::invalid_argument("fixed delay must be 1..20");
            if (item.kind == "reg" && (item.values[0] == 0 || item.values[0] > 15))
                throw std::invalid_argument("check x0 through instructions, not its backing array");
            if (item.kind == "mem") {
                const uint32_t addr = item.values[0];
                if ((addr & 3u) || addr < 0x80000000u || addr >= 0x88000000u)
                    throw std::invalid_argument("invalid memory check address");
            }
            expected.illegal |= item.kind == "illegal";
            expected.items.push_back(item);
        }
        if (expected.items.empty()) throw std::invalid_argument("no expectations");
    } catch (const std::exception& error) {
        std::fprintf(stderr, "%s: %s\n", path, error.what());
        return false;
    }
    return true;
}

// 末态手写期望独立于 EMU，用来交叉验证参考模型与 RTL。
inline int check_expectations(Vysyx_00000000& dut, const expected_program& expected,
                              const run_result& run,
                              const std::vector<uint32_t>& trace,
                              const std::string& name,
                              checker& tests)
{
    const bool step_failed = run.reason == stop_reason::rejected;
    auto check = [&](const std::string& field, uint32_t actual, uint32_t value) {
        const std::string label = name + "." + field;
        tests.check(label.c_str(), actual, value);
    };
    check("step_failed", step_failed, expected.illegal);
    check("illegal_stop", step_failed && npc::illegal(dut), expected.illegal);
    check("hit_ebreak", sim_halted(), !expected.illegal);
    check("finish_flag", dut.contextp()->gotFinish(), !expected.illegal);
    for (const auto& item : expected.items) {
        const auto& v = item.values;
        if (item.kind == "reg")
            check("x" + std::to_string(v[0]), npc::gpr(dut, v[0]), v[1]);
        else if (item.kind == "mem")
            check("memory[" + std::to_string(v[0]) + "]",
                  static_cast<uint32_t>(pmem_read(static_cast<int>(v[0]))), v[1]);
        else if (item.kind == "halt") check("halt_pc", sim_halt_pc(), v[0]);
        else if (item.kind == "cycles") check("cycles", run.cycles, v[0]);
        else if (item.kind == "instructions")
            check("instructions", static_cast<uint32_t>(run.retired), v[0]);
        else if (item.kind == "cycles_random" && run.mem_delay == 0)
            check("cycles.random", run.cycles, v[0]);
        else if (item.kind == "cycles_fixed" && run.mem_delay == v[0])
            check("cycles.fixed", run.cycles, v[1]);
        else if (item.kind == "illegal") {
            check("illegal_pc", npc::pc(dut), v[0]);
            check("illegal_instruction", npc::inst(dut), v[1]);
        } else if (item.kind == "trace") {
            check("trace.length", static_cast<uint32_t>(trace.size()), static_cast<uint32_t>(v.size()));
            for (size_t i = 0; i < trace.size() && i < v.size(); ++i)
                check("trace[" + std::to_string(i) + "]", trace[i], v[i]);
        }
    }
    return tests.report();
}
#endif
