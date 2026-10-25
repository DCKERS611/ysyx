#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "pmem.h"
#include "sys/time.h"
#include "sim.h"

#define NPC_FREQ_HZ 100000000ull

static uint32_t M[32*1024*1024] = {};

static uint32_t MEM_BASE = 0x80000000u;

static uint64_t get_time()
{
    return sim_cycles() * 1000000ull / NPC_FREQ_HZ ;
}

void pmem_load(const uint32_t* program, size_t count)
{
    constexpr size_t capacity = sizeof(M) / sizeof(M[0]);

    if (count > capacity) {
        std::fprintf(stderr, "program too large: %zu words\n", count);
        std::abort();
    }

    for (size_t i = 0; i < capacity; i++) M[i] = 0;

    for (size_t i = 0; i < count; i++) M[i] = program[i];
}


// 文件内容是小端排列的 32 位字，返回 false 时由 main 报告失败。
bool pmem_load_file(const char* path)
{
    std::FILE* file = std::fopen(path, "rb");
    if (file == nullptr) {
        std::perror(path);
        return false;
    }

    auto fail = [&](const char* reason) {
        std::fprintf(stderr, "cannot load %s: %s\n", path, reason);
        std::fclose(file);
        return false;
    };

    if (std::fseek(file, 0, SEEK_END) != 0)
        return fail("cannot seek file");

    const long size = std::ftell(file);
    if (size < 0) return fail("cannot get file size");
    if (size == 0) return fail("empty program");
    if (static_cast<unsigned long>(size) > sizeof(M))
        return fail("program exceeds memory capacity");
    if (size % 4 != 0)
        return fail("program size must be a multiple of 4 bytes");
    if (std::fseek(file, 0, SEEK_SET) != 0)
        return fail("cannot rewind file");

    const size_t byte_count = static_cast<size_t>(size);

    std::memset(M, 0, sizeof(M));
    if (std::fread(reinterpret_cast<uint8_t *>(M), 1, byte_count, file) != byte_count)
        return fail("cannot read complete program");
    if (std::fclose(file) != 0) {
        std::fprintf(stderr, "cannot close program: %s\n", path);
        return false;
    }

    std::printf("Loaded %s: %zu bytes\n", path, byte_count);
    return true;
}

extern "C" int pmem_read(int raddr)
{
    if (static_cast<uint32_t>(raddr) == 0x10000004u) 
        return (std::rand() & 0x7) == 0 ? 1 : 0;
    if (static_cast<uint32_t>(raddr) == 0x20000000u)
        return static_cast<int>(get_time() & 0xffffffffu);
    if (static_cast<uint32_t>(raddr) == 0x20000004u)
        return static_cast<int>(get_time()  >> 32);

    const uint32_t addr  = static_cast<uint32_t>(raddr) - MEM_BASE;

    constexpr size_t word_count = sizeof(M) / sizeof(M[0]);

    if (addr/4 >= word_count) {
        fprintf(stderr, "pmem_read out of range: addr=0x%08x\n", addr);
        std::abort();
    }

    return static_cast<int>(M[addr/4]);
}

extern "C" void pmem_write(int waddr, int wdata, char wmask)
{
    if (static_cast<uint32_t>(waddr) == 0x10000000u) {
        std::fputc(wdata & 0xff, stderr);
        return ;
    }

    const uint32_t addr = static_cast<uint32_t>(waddr) - MEM_BASE;

    const uint32_t data = static_cast<uint32_t>(wdata);
    const uint8_t  mask = static_cast<uint8_t>(wmask);
    constexpr size_t word_count = sizeof(M) / sizeof (M[0]);

    if (addr/4 >= word_count) {
        std::fprintf(stderr, "pmem_write out of range: addr=0x%08x\n", addr);
        std::abort();
    }

    uint32_t word = M[addr/4];

    for (unsigned i = 0; i < 4 ; i++) {
        if (mask & (1u << i)) {
            const unsigned shift = i * 8;
            const uint32_t byte_mask = 0xffu << shift;
                                                        
            word = (word & ~byte_mask) | (data & byte_mask);
        }
    }

    M[addr/4] = word;

}
