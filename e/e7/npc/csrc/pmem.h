#ifndef NPC_PMEM_H
#define NPC_PMEM_H

#include <cstddef>
#include <cstdint>

void pmem_load(const uint32_t* program, size_t count);
bool pmem_load_file(const char* path);

extern "C" int pmem_read(int raddr);
extern "C" void pmem_write(int waddr, int wdata, char wmask);

// 供测试库只读扫描完整物理内存；调用方不得通过该视图修改内存。
const uint8_t* pmem_memory_bytes();

#endif
