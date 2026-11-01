#ifndef NPC_SIM_H
#define NPC_SIM_H

#include <cstdint>

// 独立 NPC 的单拍推进和资源管理；通过规则由各入口决定。
class Vysyx_00000000;

enum class step_event { waiting, committed, rejected, halted, fault };
enum class stop_reason {
    running, ebreak, rejected, fetch_unaligned,
    cycle_limit, attempt_limit, external_finish,
    comparison_mismatch, reference_fault
};

struct run_limits {
    std::uint64_t max_cycles = 0;
    std::uint64_t max_attempts = 0;
};

struct run_result {
    stop_reason reason = stop_reason::running;
    std::uint32_t stop_pc = 0, stop_inst = 0;
    std::uint64_t cycles = 0, retired = 0, attempts = 0;
    unsigned mem_delay = 0;
};

class sim_session {
public:
    sim_session() = default;
    ~sim_session();
    sim_session(const sim_session&) = delete;
    sim_session& operator=(const sim_session&) = delete;

    bool init(Vysyx_00000000& dut, const char* wave_path);
    void reset();
    step_event step();
    run_result result(stop_reason reason) const;
    bool halted() const;
    std::uint32_t halt_pc() const;
    std::uint64_t cycles() const;
    std::uint64_t retired() const;
    std::uint64_t attempts() const;
    unsigned mem_delay() const;

private:
    Vysyx_00000000* dut_ = nullptr;
};

void sim_set_verbose(bool enabled);
unsigned sim_memory_delay();
std::uint64_t sim_cycles();
std::uint64_t sim_instructions();
bool sim_halted();
std::uint32_t sim_halt_pc();

void sim_print_result(const char* case_name, const char* backend,
                      const run_result& run, bool passed,
                      unsigned checks, unsigned failures, const char* extra);

#endif
