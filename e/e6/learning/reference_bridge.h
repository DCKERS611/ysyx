#ifndef LEARN_REFERENCE_BRIDGE_H
#define LEARN_REFERENCE_BRIDGE_H

#include <stdint.h>

/* 给学习版提供普通函数接口。这里没有 class、模板或 STL。 */
enum RefStatus { REF_EXECUTED, REF_HALTED, REF_ILLEGAL, REF_FAULT };

struct RefStep {
    enum RefStatus status;
    uint32_t pc;
    uint32_t inst;
    int reads_rs1;
    int reads_rs2;
    uint32_t rs1_value;
    uint32_t rs2_value;
};

struct RefState {
    uint32_t pc;
    uint32_t reg[16];
    int halted;
    uint32_t halt_pc;
};

int ref_load(const char *path);
int ref_step(struct RefStep *info);
void ref_get_state(struct RefState *state);
uint32_t ref_word(unsigned addr);
unsigned ref_memory_size(void);

#endif
