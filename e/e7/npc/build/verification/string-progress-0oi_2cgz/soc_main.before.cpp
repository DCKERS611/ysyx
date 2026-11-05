#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>

#include "verilated.h"
#include "verilated_fst_c.h"
#include "VSimTop.h"
#include "VSimTop__Dpi.h"
#include "VSimTop___024root.h"

// 16MB Flash
static constexpr uint32_t FLASH_SIZE = 16u * 1024 * 1024;
static uint8_t flash[FLASH_SIZE];

static bool load_flash(const char* path)
{
    FILE *fp = std::fopen(path, "rb");
    if (!fp) {
        std::perror(path);
        return false;
    }

    if (std::fseek(fp, 0, SEEK_END) != 0) {
        std::fclose(fp);
        return false;
    }

    const long size = std::ftell(fp);
    if (size <= 0 || size > static_cast<long>(FLASH_SIZE)) {
        std::fprintf(stderr, "Flash 镜像大小无效：%ld\n", size);
        std::fclose(fp);
        return false;
    }

    std::rewind(fp);
    const size_t loaded =
        std::fread(flash, 1, static_cast<size_t>(size), fp);
    std::fclose(fp);

    if (loaded != static_cast<size_t>(size)) {
        std::fprintf(stderr, "Flash 镜像读取不完整\n");
        return false;
    }

    std::printf("Loaded Flash: %s, %zu bytes\n", path, loaded);
    return true;
}

extern "C" void flash_read(int32_t addr, int32_t *data)
{
    const uint32_t offset = static_cast<uint32_t>(addr);

    assert(offset <= FLASH_SIZE - sizeof(*data));
    std::memcpy(data, flash + offset, sizeof(*data));
}

// 记录程序结束事件及其指令地址
static bool halted = false;
static uint32_t halt_pc = 0;

extern "C" void ebreak(int pc)
{
    halted = true;
    halt_pc = static_cast<uint32_t>(pc);
}

int main(int argc, char** argv)
{

    if (argc < 2) {
        std::fprintf(stderr, "用法：%s 镜像.bin [波形.fst]\n", argv[0]);
        return 1;
    }

    if (!load_flash(argv[1]))
        return 1;

    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    ctx.traceEverOn(true);

    VSimTop dut{&ctx};
    VerilatedFstC wave;
    const bool tracing = argc > 2;

    if (tracing) {
        dut.trace(&wave, 99);
        wave.open(argv[2]);
    }

    // 初始化所有外部输入。
    dut.clock = 0;
    dut.cpuClock = 0;
    dut.reset = 1;
    dut.coreSel = 0;
    dut.externalPins_mygpio_in = 0;
    dut.externalPins_uart0_rx = 1;

    auto eval_step = [&]() {
        dut.eval();
        if (tracing)
            wave.dump(ctx.time());
        ctx.timeInc(1);
    };

    // 当前阶段两个时钟同频、同相。
    auto single_cycle = [&]() {
        dut.clock = 0;
        dut.cpuClock = 0;
        eval_step();

        dut.clock = 1;
        dut.cpuClock = 1;
        eval_step();
    };

    // 复位期间仍然持续驱动时钟。
    for (unsigned i = 0; i < 100; ++i)
        single_cycle();

    dut.reset = 0;

    // 连通性测试设置周期上限，避免无限等待。
    constexpr uint64_t max_cycles = 100000000000;
    uint64_t cycles = 0;

    while (!halted && !ctx.gotFinish() && cycles < max_cycles) {
        single_cycle();
        ++cycles;
    }

    const auto& gpr = dut.rootp->
        SimTop__DOT__asic__DOT__soc__DOT__cpu__DOT__core0__DOT__u_rf__DOT__rf;
    const uint32_t a0 = gpr[10];
    
    dut.final();
    if (tracing)
        wave.close();
	
	if (halted) {
        std::printf(
            "%s: pc=0x%08x a0=0x%08x cycles=%llu\n",
            a0 == 0 ? "HIT GOOD TRAP" : "HIT BAD TRAP",
            halt_pc, a0,
            static_cast<unsigned long long>(cycles));
        return a0 == 0 ? 0 : 1;
    }

    if (ctx.gotFinish()) {
        std::fprintf(stderr, "仿真提前结束，未观察到 ebreak\n");
        return 1;
    }

    std::fprintf(
        stderr, "达到周期上限：%llu，未观察到 ebreak\n",
        static_cast<unsigned long long>(cycles));
    return 1;
}
