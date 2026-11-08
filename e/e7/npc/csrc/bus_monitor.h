#ifndef NPC_BUS_MONITOR_H
#define NPC_BUS_MONITOR_H

#include <cstdint>
#include <cstdio>

// 一次 CPU 上升沿前的 SimpleBus 样本。req/resp 与 commit 都指向随后
// 的同一个 CPU 上升沿；回复数据在 respValid 为 1 时同时有效。
struct bus_cycle_sample {
    bool reset = false;
    bool ifu_req_valid = false;
    std::uint32_t ifu_addr = 0;
    bool ifu_resp_valid = false;
    std::uint32_t ifu_rdata = 0;
    bool lsu_req_valid = false;
    std::uint32_t lsu_addr = 0;
    std::uint8_t lsu_size = 0;
    bool lsu_wen = false;
    std::uint32_t lsu_wdata = 0;
    std::uint8_t lsu_wmask = 0;
    bool lsu_resp_valid = false;
    std::uint32_t lsu_rdata = 0;
    bool commit = false;
    std::uint32_t pc = 0;
    std::uint32_t inst = 0;
};

// E7 SimpleBus v3 被动监视器。除了既有请求/回复配对和对齐检查，
// 还用 IFU 回复形成当前指令头，将 LSU 事务归属到该指令再检查提交。
class bus_monitor {
public:
    static constexpr unsigned k_max_print = 20;

    void reset()
    {
        ifu_requests_ = lsu_requests_ = 0;
        ifu_responses_ = lsu_responses_ = 0;
        violations_ = 0;
        printed_ = 0;
        ifu_pending_ = lsu_pending_ = false;
        ifu_saved_addr_ = 0;
        head_valid_ = false;
        head_pc_ = head_inst_ = 0;
        lsu_seen_ = lsu_completed_ = false;
        lsu_owner_pc_ = lsu_owner_inst_ = 0;
        halted_ = false;
        last_kind_ = "";
    }

    // 所有字段均在同一 CPU 上升沿前读取；先登记请求、再消费回复，
    // 最后判定提交，因此允许请求/回复/提交在同一沿发生。
    void sample_cycle(const bus_cycle_sample& sample, std::uint64_t cycle)
    {
        if (sample.reset) {
            reset();
            return;
        }

        const bool ifu_was_pending = ifu_pending_;
        if (sample.ifu_req_valid && !ifu_was_pending)
            ifu_saved_addr_ = sample.ifu_addr;
        sample_ifu(ifu_pending_, sample.ifu_req_valid, sample.ifu_addr, cycle);

        if (sample.ifu_resp_valid) {
            const bool matched = ifu_pending_;
            const std::uint32_t fetched_pc = ifu_saved_addr_;
            on_ifu_response(cycle);
            if (matched) {
                if (head_valid_) {
                    violation("ifu_response_before_previous_commit", fetched_pc, cycle);
                } else {
                    head_valid_ = true;
                    head_pc_ = fetched_pc;
                    head_inst_ = sample.ifu_rdata;
                    lsu_seen_ = lsu_completed_ = false;
                    lsu_owner_pc_ = lsu_owner_inst_ = 0;
                }
            }
        }

        const bool lsu_was_pending = lsu_pending_;
        sample_lsu(lsu_pending_, sample.lsu_req_valid, sample.lsu_addr,
                   sample.lsu_size, cycle);
        if (sample.lsu_req_valid && !lsu_was_pending) {
            if (!head_valid_) {
                violation("lsu_request_without_instruction", sample.lsu_addr, cycle);
            } else if (!is_memory_instruction(head_inst_)) {
                violation("lsu_request_for_non_memory_instruction", sample.lsu_addr, cycle);
            } else if (lsu_seen_) {
                violation("lsu_duplicate_for_instruction", sample.lsu_addr, cycle);
            } else {
                lsu_seen_ = true;
                lsu_completed_ = false;
                lsu_owner_pc_ = head_pc_;
                lsu_owner_inst_ = head_inst_;
                const bool instruction_is_store = (head_inst_ & 0x7fu) == 0x23u;
                if (sample.lsu_wen != instruction_is_store)
                    violation("lsu_direction_mismatch", sample.lsu_addr, cycle);
            }
        }

        if (sample.lsu_resp_valid) {
            const bool matched = lsu_pending_;
            on_lsu_response(cycle);
            if (matched && lsu_seen_ && head_valid_ &&
                lsu_owner_pc_ == head_pc_ && lsu_owner_inst_ == head_inst_)
                lsu_completed_ = true;
        }

        if (sample.commit)
            check_commit(sample.pc, sample.inst, cycle);
    }

    // 兼容原有独立 NPC 测试使用的协议判据接口。
    void sample_ifu(bool pending, bool req_valid, std::uint32_t addr,
                    std::uint64_t cycle)
    {
        if (req_valid) {
            if (pending) {
                violation("ifu_request_while_pending", addr, cycle);
            } else {
                ++ifu_requests_;
                if ((addr & 3u) != 0) violation("ifu_addr_unaligned", addr, cycle);
            }
            ifu_pending_ = true;
        } else {
            ifu_pending_ = pending;
        }
    }

    void sample_lsu(bool pending, bool req_valid, std::uint32_t addr,
                    std::uint8_t size, std::uint64_t cycle)
    {
        if (req_valid) {
            if (pending) {
                violation("lsu_request_while_pending", addr, cycle);
            } else {
                ++lsu_requests_;
                if (size == 0x3u) violation("lsu_size_illegal", addr, cycle);
                if (size == 0x2u && (addr & 3u) != 0)
                    violation("lsu_word_unaligned", addr, cycle);
                if (size == 0x1u && (addr & 1u) != 0)
                    violation("lsu_half_unaligned", addr, cycle);
            }
            lsu_pending_ = true;
        } else {
            lsu_pending_ = pending;
        }
    }

    void on_ifu_response(std::uint64_t cycle)
    {
        ++ifu_responses_;
        if (!ifu_pending_) violation("ifu_response_without_request", 0, cycle);
        ifu_pending_ = false;
    }

    void on_lsu_response(std::uint64_t cycle)
    {
        ++lsu_responses_;
        if (!lsu_pending_) violation("lsu_response_without_request", 0, cycle);
        lsu_pending_ = false;
    }

    // 旧接口仅能检查仍在途的请求；完整提交归属由 sample_cycle 判定。
    void on_commit(bool lsu_pending, std::uint32_t pc, std::uint64_t cycle)
    {
        if (lsu_pending) violation("commit_with_pending_lsu", pc, cycle);
    }

    void on_halt(std::uint64_t cycle) { finish(cycle); }

    void finish(std::uint64_t cycle)
    {
        if (halted_) return;
        halted_ = true;
        if (ifu_pending_) violation("halt_with_pending_ifu", 0, cycle);
        if (lsu_pending_) violation("halt_with_pending_lsu", 0, cycle);
    }

    bool ok() const { return violations_ == 0; }
    unsigned violations() const { return violations_; }
    const char* last_kind() const { return last_kind_; }
    std::uint64_t ifu_requests() const { return ifu_requests_; }
    std::uint64_t ifu_responses() const { return ifu_responses_; }
    std::uint64_t lsu_requests() const { return lsu_requests_; }
    std::uint64_t lsu_responses() const { return lsu_responses_; }

    void report(std::FILE* output = stdout) const
    {
        std::fprintf(output,
                     "Bus: %s ifu_req=%llu ifu_resp=%llu lsu_req=%llu "
                     "lsu_resp=%llu violations=%u\n",
                     ok() ? "PASS" : "FAIL",
                     static_cast<unsigned long long>(ifu_requests_),
                     static_cast<unsigned long long>(ifu_responses_),
                     static_cast<unsigned long long>(lsu_requests_),
                     static_cast<unsigned long long>(lsu_responses_),
                     violations_);
    }

private:
    static bool is_memory_instruction(std::uint32_t inst)
    {
        const std::uint32_t opcode = inst & 0x7fu;
        return opcode == 0x03u || opcode == 0x23u;
    }

    void check_commit(std::uint32_t pc, std::uint32_t inst, std::uint64_t cycle)
    {
        on_commit(lsu_pending_, pc, cycle);

        if (!head_valid_) {
            violation("commit_without_fetched_instruction", pc, cycle);
        } else if (head_pc_ != pc || head_inst_ != inst) {
            violation("commit_fetch_mismatch", pc, cycle);
        }

        if (is_memory_instruction(inst)) {
            if (!lsu_seen_) {
                violation("commit_without_lsu_request", pc, cycle);
            } else if (lsu_owner_pc_ != pc || lsu_owner_inst_ != inst) {
                violation("commit_lsu_owner_mismatch", pc, cycle);
            } else if (!lsu_completed_ && !lsu_pending_) {
                violation("commit_without_lsu_response", pc, cycle);
            }
        }

        head_valid_ = false;
        lsu_seen_ = lsu_completed_ = false;
        lsu_owner_pc_ = lsu_owner_inst_ = 0;
    }

    void violation(const char* kind, std::uint32_t addr, std::uint64_t cycle)
    {
        ++violations_;
        last_kind_ = kind;
        if (printed_ < k_max_print) {
            ++printed_;
            std::printf("BUS VIOLATION cycle=%llu kind=%s addr=0x%08x\n",
                        static_cast<unsigned long long>(cycle), kind, addr);
            if (printed_ == k_max_print)
                std::printf("BUS VIOLATION ... 后续报告省略\n");
        }
    }

    std::uint64_t ifu_requests_ = 0, lsu_requests_ = 0;
    std::uint64_t ifu_responses_ = 0, lsu_responses_ = 0;
    unsigned violations_ = 0, printed_ = 0;
    bool ifu_pending_ = false, lsu_pending_ = false;
    std::uint32_t ifu_saved_addr_ = 0;
    bool head_valid_ = false;
    std::uint32_t head_pc_ = 0, head_inst_ = 0;
    bool lsu_seen_ = false, lsu_completed_ = false;
    std::uint32_t lsu_owner_pc_ = 0, lsu_owner_inst_ = 0;
    bool halted_ = false;
    const char* last_kind_ = "";
};

#endif
