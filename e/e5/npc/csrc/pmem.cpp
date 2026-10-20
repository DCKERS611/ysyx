#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include "pmem.h"

static uint32_t M[256] = {};

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

    uint8_t bytes[sizeof(M)];
    const size_t byte_count = static_cast<size_t>(size);
    if (std::fread(bytes, 1, byte_count, file) != byte_count)
        return fail("cannot read complete program");
    if (std::fclose(file) != 0) {
        std::fprintf(stderr, "cannot close program: %s\n", path);
        return false;
    }

    // 显式按小端组装，不依赖宿主机字节序。
    uint32_t words[sizeof(M) / sizeof(M[0])] = {};
    const size_t count = byte_count / 4;
    for (size_t i = 0; i < count; ++i) {
        words[i] = static_cast<uint32_t>(bytes[4 * i])
                 | (static_cast<uint32_t>(bytes[4 * i + 1]) << 8)
                 | (static_cast<uint32_t>(bytes[4 * i + 2]) << 16)
                 | (static_cast<uint32_t>(bytes[4 * i + 3]) << 24);
    }

    pmem_load(words, count);
    std::printf("Loaded %s: %zu bytes\n", path, byte_count);
    return true;
}

extern "C" int pmem_read(int raddr)
{
    const uint32_t addr  = static_cast<uint32_t>(raddr) & ~0x3u;

    constexpr size_t word_count = sizeof(M) / sizeof(M[0]);

    if (addr/4 >= word_count) {
        fprintf(stderr, "pmem_read out of range: addr=0x%08x\n", addr);
        std::abort();
    }

    return static_cast<int>(M[addr/4]);
}

extern "C" void pmem_write(int waddr, int wdata, char wmask)
{
    const uint32_t addr = static_cast<uint32_t>(waddr) & ~0x3u;

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
