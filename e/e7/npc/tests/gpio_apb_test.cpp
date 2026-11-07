#include "Vmygpio_top_apb.h"
#include "verilated_fst_c.h"
#include "check.h"
#include <array>
#include <cstdint>
#include <cstring>
#include <random>

class gpio_test {
    Vmygpio_top_apb dut;
    VerilatedFstC trace;
    bool tracing = false;
    uint64_t trace_time = 0;
    checker checks;
    std::array<uint8_t, 2> led_bytes{};
    std::array<uint8_t, 4> seg_bytes{};
    unsigned transactions = 0;

    void evaluate() {
        dut.eval();
        if (tracing) trace.dump(trace_time++);
    }
    void edge() {
        dut.clock = 0; evaluate();
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
        std::printf("GPIO_APB transactions=%u\n", transactions);
        return checks.report();
    }
};

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    gpio_test test;
    return test.run(argc > 1 ? argv[1] : nullptr);
}
