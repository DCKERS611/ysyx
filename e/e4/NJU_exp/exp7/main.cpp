#include <cstdio>
#include <cstdlib>
#include "Vtop.h"
#include "verilated.h"

// 独立参考模型：维护“当前符号 last”和“已连续长度 run”，与 RTL 的 MuxKey 表无关
static int ref_z(int w, int &last, int &run) {
    if (w == last) run++;
    else           { last = w; run = 1; }
    return (run >= 4);
}

int main(int argc, char **argv) {
    VerilatedContext ctx;
    ctx.commandArgs(argc, argv);
    Vtop dut{&ctx};

    int fails = 0, total = 0;

    // 复位：rst 拉高两拍，把状态打到 S0
    auto reset = [&]() {
        dut.rst = 1;
        for (int i = 0; i < 2; i++) {
            dut.clk = 0; dut.eval();
            dut.clk = 1; dut.eval();
        }
        dut.rst = 0;
    };

    // 走一拍：给 in=w，返回本拍的 out（上一状态的 Moore 输出）
    auto step = [&](int w) -> int {
        dut.in = w;
        dut.clk = 0; dut.eval();
        dut.clk = 1; dut.eval();
        return (int)dut.out;
    };

    // 独热合法性：state 恰好有一位为 1（power-of-two 且非 0）
    auto onehot_ok = [&]() -> bool {
        int s = (int)dut.state;
        return (s != 0) && ((s & (s - 1)) == 0);
    };

    // 跑一条序列，逐拍与参考比对
    auto run_seq = [&](const char *name, const int *w, int n) {
        reset();
        int last = -1, run = 0;
        for (int i = 0; i < n; i++) {
            int got = step(w[i]);
            int exp = ref_z(w[i], last, run);
            total++;
            bool ok = (got == exp) && onehot_ok();
            if (!ok) {
                printf("[%s] 第 %d 拍: w=%d out=%d(expect %d) state=%03x %s\n",
                       name, i, w[i], got, exp, (int)dut.state,
                       onehot_ok() ? "" : "<非法独热码!>");
                fails++;
            }
        }
    };

    // ---- 定向用例 ----
    {
        int a[] = {0, 0, 0, 0};              // 0000      -> 0 0 0 1
        int b[] = {0, 0, 0, 0, 0};           // 00000     -> 0 0 0 1 1
        int c[] = {1, 1, 1, 1};              // 1111      -> 0 0 0 1
        int d[] = {1, 1, 1, 1, 1};           // 11111     -> 0 0 0 1 1
        int e[] = {1, 1, 0, 0, 0, 0};        // 110000    -> 0 0 0 0 0 1
        int f[] = {0, 1, 0, 1, 0, 1, 0, 1};  // 0101...   -> 全 0
        run_seq("0000", a, 4);
        run_seq("00000", b, 5);
        run_seq("1111", c, 4);
        run_seq("11111", d, 5);
        run_seq("110000", e, 6);
        run_seq("01010101", f, 8);
    }

    // ---- 随机长序列：逐拍比对，要求 0 mismatch ----
    {
        srand(12345);
        reset();
        int last = -1, run = 0;
        const int N = 1000000;
        for (int i = 0; i < N; i++) {
            int w = rand() & 1;
            int got = step(w);
            int exp = ref_z(w, last, run);
            total++;
            if (got != exp || !onehot_ok()) {
                printf("[rand] 第 %d 拍: w=%d out=%d(expect %d) state=%03x\n",
                       i, w, got, exp, (int)dut.state);
                fails++;
                if (fails > 20) break;
            }
        }
    }

    if (fails) { printf("FAILED: %d/%d\n", fails, total); return 1; }
    printf("PASS: %d cases\n", total);
    return 0;
}
