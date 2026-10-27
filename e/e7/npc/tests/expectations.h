#ifndef NPC_TEST_EXPECTATIONS_H
#define NPC_TEST_EXPECTATIONS_H

#include <cstdint>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

#include "Vtop.h"
#include "Vtop___024root.h"
#include "sim.h"
#include "pmem.h"
#include "test_suite.h"

struct Expectation {
    std::string kind;
    std::vector<uint32_t> values;
};

struct ExpectedProgram {
    std::vector<Expectation> items;
    bool illegal = false;
};

inline bool read_expectations(const char* path, ExpectedProgram& expected)
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
            Expectation item;
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
                ((item.kind == "halt" || item.kind == "cycles") && count == 1)
                || ((item.kind == "reg" || item.kind == "mem"
                     || item.kind == "illegal") && count == 2)
                || (item.kind == "trace" && count > 0);
            if (!valid) throw std::invalid_argument("unknown or malformed expectation");
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
inline int check_expectations(Vtop& dut, const ExpectedProgram& expected,
                              bool step_failed, unsigned cycles,
                              const std::vector<uint32_t>& trace,
                              const std::string& name)
{
    TestSuite tests;
    auto check = [&](const std::string& field, uint32_t actual, uint32_t value) {
        const std::string label = name + "." + field;
        tests.check(label.c_str(), actual, value);
    };
    check("step_failed", step_failed, expected.illegal);
    check("illegal_stop", step_failed && dut.illegal, expected.illegal);
    check("hit_ebreak", sim_halted(), !expected.illegal);
    check("finish_flag", dut.contextp()->gotFinish(), !expected.illegal);
    for (const auto& item : expected.items) {
        const auto& v = item.values;
        if (item.kind == "reg")
            check("x" + std::to_string(v[0]), dut.rootp->top__DOT__u_rf__DOT__rf[v[0]], v[1]);
        else if (item.kind == "mem")
            check("memory[" + std::to_string(v[0]) + "]",
                  static_cast<uint32_t>(pmem_read(static_cast<int>(v[0]))), v[1]);
        else if (item.kind == "halt") check("halt_pc", sim_halt_pc(), v[0]);
        else if (item.kind == "cycles") check("cycles", cycles, v[0]);
        else if (item.kind == "illegal") {
            check("illegal_pc", dut.pc, v[0]);
            check("illegal_instruction", dut.inst, v[1]);
        } else if (item.kind == "trace") {
            check("trace.length", static_cast<uint32_t>(trace.size()), static_cast<uint32_t>(v.size()));
            for (size_t i = 0; i < trace.size() && i < v.size(); ++i)
                check("trace[" + std::to_string(i) + "]", trace[i], v[i]);
        }
    }
    return tests.report();
}
#endif
