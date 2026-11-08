#include "Vmygpio_top_apb.h"
#include "verilated_fst_c.h"
#include "check.h"
#include <array>
#include <cstdint>
#include <cstring>
#include <random>

class apb_monitor {
public:
    void reset() {
        setup_seen_ = false;
        waiting_ = false;
    }
    void sample(bool reset_active, bool psel, bool penable, bool pwrite,
                uint32_t paddr, uint32_t pwdata, uint8_t pstrb,
                bool pready, bool pslverr, uint64_t cycle) {
        if (reset_active) {
            reset();
            return;
        }
        if (pready && (!psel || !penable))
            violation("ready_outside_access", cycle);
        if (pslverr)
            violation("unexpected_slave_error", cycle);
        if (!psel) {
            // 这是其他 APB 从设备或未选中探针的总线周期，不属于本 GPIO。
            if (waiting_) violation("access_abandoned_before_ready", cycle);
            setup_seen_ = waiting_ = false;
            return;
        }
        if (!penable) {
            if (waiting_) {
                violation("access_withdrawn_before_ready", cycle);
            } else {
                saved_addr_ = paddr;
                saved_data_ = pwdata;
                saved_strb_ = pstrb;
                saved_write_ = pwrite;
                setup_seen_ = true;
            }
            return;
        }

        if (!setup_seen_ && !waiting_)
            violation("access_without_setup", cycle);
        if (paddr != saved_addr_ || pwdata != saved_data_ ||
            pstrb != saved_strb_ || pwrite != saved_write_)
            violation("control_changed_during_access", cycle);
        if (pready) {
            ++transactions_;
            setup_seen_ = waiting_ = false;
        } else {
            setup_seen_ = false;
            waiting_ = true;
        }
    }
    bool ok() const { return violations_ == 0; }
    unsigned transactions() const { return transactions_; }
    unsigned violations() const { return violations_; }
    void report() const {
        std::printf("APB monitor: %s transactions=%u violations=%u\n",
                    ok() ? "PASS" : "FAIL", transactions_, violations_);
    }
private:
    void violation(const char* kind, uint64_t cycle) {
        ++violations_;
        std::printf("APB VIOLATION cycle=%llu kind=%s\n",
                    static_cast<unsigned long long>(cycle), kind);
    }
    bool setup_seen_ = false, waiting_ = false, saved_write_ = false;
    uint32_t saved_addr_ = 0, saved_data_ = 0;
    uint8_t saved_strb_ = 0;
    unsigned transactions_ = 0, violations_ = 0;
};

static void apb_monitor_self_test(checker& checks) {
    const unsigned failures_before = checks.failures();
    apb_monitor missing_setup;
    missing_setup.sample(false, true, true, false, 0, 0, 0,
                         true, false, 1);
    checks.is_true("APB监视器拒绝缺少setup的access", !missing_setup.ok());

    apb_monitor changed_during_wait;
    changed_during_wait.sample(false, true, false, true, 0x20001000, 0x12345678, 15,
                               false, false, 1);
    changed_during_wait.sample(false, true, true, true, 0x20001000, 0x12345678, 15,
                               false, false, 2);
    changed_during_wait.sample(false, true, true, true, 0x20001000, 0x87654321, 15,
                               true, false, 3);
    checks.is_true("APB等待期间控制变化触发违例", !changed_during_wait.ok());

    apb_monitor unselected;
    unselected.sample(false, false, false, true, 0x20001000, 0xffffffff, 15,
                      false, false, 1);
    unselected.sample(false, false, true, true, 0x20001000, 0xffffffff, 15,
                      false, false, 2);
    checks.is_true("未选中的从设备周期不算GPIO事务", unselected.ok());

    apb_monitor reset_during_setup;
    reset_during_setup.sample(false, true, false, true, 0x20001008, 0x12345678, 15,
                              false, false, 1);
    reset_during_setup.sample(true, true, true, true, 0x20001008, 0x12345678, 15,
                              false, false, 2);
    reset_during_setup.sample(false, false, false, false, 0, 0, 0,
                              false, false, 3);
    checks.is_true("reset清除APB阶段且不制造违例", reset_during_setup.ok());
    std::printf("APB monitor negative probes: %s\n",
                checks.failures() == failures_before ? "PASS" : "FAIL");
}

class gpio_test {
    Vmygpio_top_apb dut;
    VerilatedFstC trace;
    bool tracing = false;
    uint64_t trace_time = 0;
    checker checks;
    apb_monitor bus;
    uint64_t bus_cycles = 0;
    std::array<uint8_t, 2> led_bytes{};
    std::array<uint8_t, 4> seg_bytes{};
    unsigned transactions = 0;

    void evaluate() {
        dut.eval();
        if (tracing) trace.dump(trace_time++);
    }
    void edge() {
        dut.clock = 0; evaluate();
        bus.sample(dut.reset, dut.in_psel, dut.in_penable, dut.in_pwrite,
                   dut.in_paddr, dut.in_pwdata, dut.in_pstrb,
                   dut.in_pready, dut.in_pslverr, bus_cycles++);
        dut.clock = 1; evaluate();
        dut.clock = 0; evaluate();
    }
    template <size_t size> static uint32_t pack(const std::array<uint8_t, size>& bytes) {
        uint32_t value = 0;
        for (size_t i = 0; i < size; ++i) value |= uint32_t(bytes[i]) << (8 * i);
        return value;
    }
    // 用要点亮的段名独立计算输出，不复制RTL中的十六进制译码表。
    static uint8_t segment_pattern(unsigned digit) {
        static const char* lit[] = {"ABCDEF", "BC", "ABDEG", "ABCDG", "BCFG", "ACDFG",
            "ACDEFG", "ABC", "ABCDEFG", "ABCDFG", "ABCEFG", "CDEFG", "ADEF",
            "BCDEG", "ADEFG", "AEFG"};
        uint8_t value = 0xff;
        for (const char* p = lit[digit]; *p; ++p) value &= ~(1u << (7 - (*p - 'A')));
        return value;
    }
    void check_state() {
        checks.eq_u32("LED output", dut.gpio_out, pack(led_bytes));
        const uint32_t address = dut.in_paddr;
        dut.in_paddr = 0x20001000; evaluate();
        checks.eq_u32("LED readback and upper zeros", dut.in_prdata, pack(led_bytes));
        dut.in_paddr = 0x20001004; evaluate();
        checks.eq_u32("switches read-only input", dut.in_prdata, dut.gpio_in);
        dut.in_paddr = 0x20001008; evaluate();
        checks.eq_u32("segment register readback", dut.in_prdata, pack(seg_bytes));
        dut.in_paddr = 0x2000100c; evaluate();
        checks.eq_u32("reserved address read", dut.in_prdata, 0);
        dut.in_paddr = address; evaluate();
        const std::array<uint8_t, 8> actual = {dut.gpio_seg_0, dut.gpio_seg_1,
            dut.gpio_seg_2, dut.gpio_seg_3, dut.gpio_seg_4, dut.gpio_seg_5,
            dut.gpio_seg_6, dut.gpio_seg_7};
        for (unsigned i = 0; i < 8; ++i)
            checks.eq_u32("digit position, polarity and decimal point", actual[i],
                          segment_pattern((pack(seg_bytes) >> (4 * i)) & 15));
        checks.eq_u32("APB ready", dut.in_pready, dut.in_psel && dut.in_penable);
        checks.eq_u32("APB error", dut.in_pslverr, 0);
    }
    // 参考状态按字节数组更新，与RTL的并行切片赋值分别实现。
    void update_reference(uint32_t address, uint32_t data, unsigned strobe) {
        if ((address & 12) == 0) {
            for (unsigned i = 0; i < led_bytes.size(); ++i)
                if (strobe & (1u << i)) led_bytes[i] = data >> (8 * i);
        }
        if ((address & 12) == 8) {
            for (unsigned i = 0; i < seg_bytes.size(); ++i)
                if (strobe & (1u << i)) seg_bytes[i] = data >> (8 * i);
        }
    }
    void transfer(uint32_t address, uint32_t data, unsigned strobe,
                  bool write = true, bool selected = true, bool idle_after = true) {
        ++transactions;
        dut.in_paddr = 0x20001000 + address;
        dut.in_pwdata = data; dut.in_pstrb = strobe;
        dut.in_pwrite = write; dut.in_psel = selected; dut.in_penable = 0;
        // setup沿不能写；未选中和读取事务也不能改变状态。
        edge(); check_state();
        dut.in_penable = 1; evaluate();
        checks.eq_u32("access ready before edge", dut.in_pready, selected);
        edge();
        if (write && selected) update_reference(address, data, strobe);
        check_state();
        if (idle_after) {
            dut.in_psel = 0; dut.in_penable = 0;
            edge(); check_state();
        }
    }
    void reset() {
        // 即使同一沿存在合法写，复位也必须优先。
        dut.reset = 1;
        edge(); led_bytes.fill(0); seg_bytes.fill(0); check_state();
        dut.in_psel = 0; dut.in_penable = 0; dut.reset = 0;
        evaluate(); check_state();
    }
public:
    int run(const char* wave) {
        apb_monitor_self_test(checks);
        if (wave) {
            Verilated::traceEverOn(true);
            dut.trace(&trace, 99); trace.open(wave); tracing = true;
        }
        dut.clock = 0; dut.in_paddr = 0; dut.in_pprot = 0;
        dut.in_psel = 0; dut.in_penable = 0; dut.in_pwrite = 0;
        dut.in_pwdata = 0; dut.in_pstrb = 0; dut.gpio_in = 0;
        reset();
        for (uint32_t pattern : {0x12345678u, 0xa5c37e19u}) {
            for (unsigned strobe = 0; strobe < 16; ++strobe) {
                transfer(0, 0x89abcdef, 15);
                transfer(8, 0x76543210, 15);
                transfer(0, pattern, strobe);
                transfer(8, pattern, strobe);
                transfer(0, ~pattern, strobe, true, false);
                transfer(8, ~pattern, strobe, false);
                transfer(4, ~pattern, strobe);
                transfer(12, ~pattern, strobe);
            }
        }
        // 覆盖各字节地址、背靠背APB传输以及高两字节写LED的忽略语义。
        for (unsigned lane = 0; lane < 4; ++lane) {
            transfer(lane, 0xdeadbeef, 1u << lane, true, true, false);
            transfer(8 + lane, 0xfedcba98, 1u << lane, true, true, false);
        }
        // 每一个数码管都显示过0..f，并检查小数点始终熄灭。
        for (unsigned digit = 0; digit < 16; ++digit) {
            uint32_t word = 0;
            for (unsigned place = 0; place < 8; ++place) word |= ((digit + place) & 15) << (4 * place);
            transfer(8, word, 15);
        }
        for (unsigned bit = 0; bit < 16; ++bit) {
            dut.gpio_in = 1u << bit; evaluate();
            transfer(4, 0xffffffff, 15); transfer(4, 0, 0, false);
        }
        std::mt19937 random(0xe7);
        for (unsigned i = 0; i < 256; ++i)
            transfer(random() % 16, random(), random() % 16, random() & 1, random() & 1);
        dut.in_psel = 1; dut.in_penable = 1; dut.in_pwrite = 1;
        dut.in_paddr = 0x20001008; dut.in_pwdata = 0xffffffff; dut.in_pstrb = 15;
        reset();
        dut.final();
        if (tracing) trace.close();
        std::printf("GPIO_APB driver_transactions=%u\n", transactions);
        const int check_result = checks.report();
        bus.report();
        const bool passed = check_result == 0 && bus.ok();
        std::printf("RESULT case=gpio_apb backend=apb verdict=%s transactions=%u "
                    "violations=%u checks=%u failures=%u\n",
                    passed ? "pass" : "fail", bus.transactions(), bus.violations(),
                    checks.total(), checks.failures());
        return passed ? 0 : 1;
    }
};

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    gpio_test test;
    return test.run(argc > 1 ? argv[1] : nullptr);
}
