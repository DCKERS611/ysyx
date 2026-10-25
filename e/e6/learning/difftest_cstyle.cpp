#include <stdint.h>
#include <stdio.h>

#include "Vtop.h"
#include "Vtop___024root.h"
#include "verilated.h"
#include "pmem.h"
#include "sim.h"
#include "reference_bridge.h"

/* E5 学习版：PC 从 0 开始，参考内存 1024 字节。
 * 使用普通函数、结构体、指针和循环；不使用 auto、lambda、vector、string。
 * Verilator 本身是 C++，因此文件仍用 .cpp，保留对象创建和接口调用。 */
struct Check {
    unsigned total;
    unsigned failed;
};

/* 比较一项就打印一项错误；调用者在整条指令检查完之后才停止。
 * 不必先把差异放进 vector，再遍历打印。 */
static void check_value(struct Check *check, const char *name,
                        uint32_t actual, uint32_t expected)
{
    check->total++;
    if (actual != expected) {
        check->failed++;
        printf("  %s: actual=0x%08x expect=0x%08x\n", name, actual, expected);
    }
}

/* NPC 执行一拍、EMU 执行一条后，核对执行结果。
 * pre_pc/inst/read1/read2/illegal 都是在 NPC 上升沿之前保存的。 */
static int compare_step(Vtop *npc, VerilatedContext *context,
                        const struct RefStep *info, const struct RefState *ref,
                        uint32_t pre_pc, uint32_t inst,
                        uint32_t read1, uint32_t read2, int illegal, int accepted,
                        struct Check *check)
{
    unsigned old_failed = check->failed;
    int rejected = (info->status == REF_ILLEGAL);
    char name[32];

    check_value(check, "pre_pc", pre_pc, info->pc);
    check_value(check, "instruction", inst, info->inst);
    check_value(check, "illegal", illegal, rejected);
    check_value(check, "accepted", accepted, !rejected);

    /* NPC 在 ebreak 那拍仍会更新 PC，EMU 停在 ebreak 地址。
     * 因此 ebreak 那步只比前 PC；普通指令比较执行后的 PC。 */
    if (info->status != REF_HALTED)
        check_value(check, "next_pc", npc->pc, ref->pc);

    for (unsigned i = 0; i < 16; i++) {
        snprintf(name, sizeof(name), "x%u", i);
        check_value(check, name, npc->rootp->top__DOT__u_rf__DOT__rf[i], ref->reg[i]);
    }

    /* rf[0] 的底层槽不等于 x0 读口行为，所以还比较真正读出的数。 */
    if (!rejected && info->reads_rs1)
        check_value(check, "rs1.read", read1, info->rs1_value);
    if (!rejected && info->reads_rs2)
        check_value(check, "rs2.read", read2, info->rs2_value);

    check_value(check, "halted", sim_halted(), ref->halted);
    check_value(check, "finish", context->gotFinish(), ref->halted);
    if (ref->halted)
        check_value(check, "halt_pc", sim_halt_pc(), ref->halt_pc);
    return check->failed == old_failed;
}

/* 两边内存分别装载、分别更新，只在结束后进行比较。 */
static int compare_memory(struct Check *check)
{
    unsigned old_failed = check->failed;
    char name[40];
    for (unsigned addr = 0; addr < ref_memory_size(); addr += 4) {
        snprintf(name, sizeof(name), "memory[0x%03x]", addr);
        check_value(check, name, (uint32_t)pmem_read((int)addr), ref_word(addr));
    }
    return check->failed == old_failed;
}

int main(int argc, char **argv)
{
    if (argc != 2 && argc != 3) {
        fprintf(stderr, "Usage: %s <E5-program.bin> [wave.fst]\n", argv[0]);
        return 1;
    }

    /* 1. 同一个文件分别装入 NPC 和 EMU；之后不复制两边的寄存器或内存。 */
    if (!ref_load(argv[1]) || !pmem_load_file(argv[1])) return 1;

    /* 2. 只有这里和 npc->... 属于必须接触的 Verilator C++ 接口。
     * & 取地址；后面的辅助函数用指针接收，所以通过 -> 访问成员。 */
    VerilatedContext context;
    context.commandArgs(argc, argv);
    context.traceEverOn(true);
    Vtop npc(&context);
    sim_set_verbose(false);
    const char *wave_path = (argc == 3) ? argv[2] : NULL;
    if (!sim_init(npc, wave_path)) {
        sim_close(npc);
        return 1;
    }

    /* GPR 没有整体复位接口，驱动清零以对齐两边测试初态。 */
    for (unsigned i = 0; i < 16; i++)
        npc.rootp->top__DOT__u_rf__DOT__rf[i] = 0;
    sim_reset(npc);

    /* 3. 逐指令比较。局部变量只保存这一条的输入和结果。 */
    struct Check check = {0, 0};
    struct RefStep info;
    struct RefState ref;
    unsigned steps = 0;
    const unsigned max_steps = 1000;
    int result = 1;

    while (!context.gotFinish() && steps < max_steps) {
        uint32_t pre_pc = npc.pc;
        uint32_t inst = npc.inst;
        uint32_t read1 = npc.rootp->top__DOT__rs1_data;
        uint32_t read2 = npc.rootp->top__DOT__rs2_data;
        int illegal = npc.illegal;
        steps++;

        int accepted = sim_step(npc);
        if (!ref_step(&info)) {
            fprintf(stderr, "step=%u pre_pc=0x%08x inst=0x%08x\n", steps, pre_pc, inst);
            goto finish;
        }
        ref_get_state(&ref);

        if (!compare_step(&npc, &context, &info, &ref,
                          pre_pc, inst, read1, read2, illegal, accepted, &check)) {
            printf("Mismatch at step=%u pre_pc=0x%08x inst=0x%08x\n", steps, pre_pc, inst);
            goto finish;
        }
        if (!accepted) {
            fprintf(stderr, "Both models rejected an illegal instruction; this runner requires ebreak.\n");
            goto finish;
        }
    }

    /* 4. 没有 ebreak 就不能把超时误判成 PASS。 */
    if (!sim_halted()) {
        fprintf(stderr, "Timed out after %u steps\n", steps);
        goto finish;
    }
    if (!compare_memory(&check)) goto finish;

    printf("DIFF PASS: %u steps, %u checks; a0=0x%08x\n", steps, check.total, ref.reg[10]);
    result = 0;

finish:
    if (result != 0)
        printf("DIFF FAIL: %u failed / %u checks\n", check.failed, check.total);
    sim_close(npc);
    return result;
}
