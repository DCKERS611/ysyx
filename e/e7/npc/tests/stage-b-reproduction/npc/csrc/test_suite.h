#ifndef NPC_TEST_SUITE_H
#define NPC_TEST_SUITE_H

#include <cstdint>
#include <cstdio>
#include <cinttypes>

// 轻量数值测试工具，不依赖 Verilator，可用于其他 C++ 测试。
class TestSuite {
public:
    // 检查 32 位数值；失败后继续，便于一次收集多个问题。
    bool check(const char* name, std::uint32_t actual,
               std::uint32_t expected)
    {
        ++total_;

        if (actual == expected) {
            return true;
        }

        ++fails_;
        std::printf("%s=0x%08" PRIx32 " (expect 0x%08" PRIx32 ")\n",
                    name, actual, expected);
        return false;
    }

    // 返回值可以直接作为 main 的退出码；没有执行检查也算失败。
    int report() const
    {
        if (total_ == 0) {
            std::printf("FAILED: no checks executed\n");
            return 1;
        }

        if (fails_ != 0) {
            std::printf("FAILED: %u/%u\n", fails_, total_);
            return 1;
        }

        std::printf("PASS: %u checks\n", total_);
        return 0;
    }

private:
    unsigned total_ = 0;
    unsigned fails_ = 0;
};

#endif
