#ifndef NPC_CHECK_H
#define NPC_CHECK_H

#include <cinttypes>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <initializer_list>
#include <string>
#include <vector>

// 第 1 层：通用检查器，不依赖 Verilator。
//
// 设计来源：
//   - E5 csrc/test_suite.h 的 check()/report() 接口保持不变；
//   - E3 minunit 的"每个检查有名字"；
//   - E5 difftest.cpp 的 Difference/Counts 收集式比较。
//
// 约定：
//   - 失败后继续执行，最后统一 report()；
//   - 没有执行任何检查时 report() 返回 1；
//   - ysyx 的 RISC-V 只有 32 位，不提供 64 位比较。

class Checker {
public:
    // 一个字段的检查：相等。
    bool eq_u32(const char* name, std::uint32_t actual,
                std::uint32_t expected,
                const char* file = nullptr, int line = 0)
    {
        ++total_;
        if (actual == expected) return true;

        ++failures_;
        begin_failure(file, line);
        std::printf("%s: actual=0x%08" PRIx32 " expect=0x%08" PRIx32 "\n",
                    name, actual, expected);
        return false;
    }

    // 一个字段的检查：不相等。
    bool ne_u32(const char* name, std::uint32_t actual,
                std::uint32_t unexpected,
                const char* file = nullptr, int line = 0)
    {
        ++total_;
        if (actual != unexpected) return true;

        ++failures_;
        begin_failure(file, line);
        std::printf("%s: value=0x%08" PRIx32 " should differ\n",
                    name, actual);
        return false;
    }

    // 条件真假。
    bool is_true(const char* name, bool condition,
                 const char* file = nullptr, int line = 0)
    {
        ++total_;
        if (condition) return true;

        ++failures_;
        begin_failure(file, line);
        std::printf("%s: condition is false\n", name);
        return false;
    }

    bool is_false(const char* name, bool condition,
                  const char* file = nullptr, int line = 0)
    {
        ++total_;
        if (!condition) return true;

        ++failures_;
        begin_failure(file, line);
        std::printf("%s: condition is true\n", name);
        return false;
    }

    // 闭区间 [lo, hi]。
    bool in_range(const char* name, std::uint32_t value,
                  std::uint32_t lo, std::uint32_t hi,
                  const char* file = nullptr, int line = 0)
    {
        ++total_;
        if (value >= lo && value <= hi) return true;

        ++failures_;
        begin_failure(file, line);
        std::printf("%s: value=0x%08" PRIx32
                    " not in [0x%08" PRIx32 ", 0x%08" PRIx32 "]\n",
                    name, value, lo, hi);
        return false;
    }

    // 只比较 mask 选中的位。
    bool masked_eq(const char* name, std::uint32_t actual,
                   std::uint32_t expected, std::uint32_t mask,
                   const char* file = nullptr, int line = 0)
    {
        ++total_;
        if ((actual & mask) == (expected & mask)) return true;

        ++failures_;
        begin_failure(file, line);
        std::printf("%s: actual=0x%08" PRIx32 " expect=0x%08" PRIx32
                    " (mask=0x%08" PRIx32 ")\n",
                    name, actual, expected, mask);
        return false;
    }

    // 对齐检查：value % align == 0。
    bool aligned(const char* name, std::uint32_t value,
                 std::uint32_t align,
                 const char* file = nullptr, int line = 0)
    {
        ++total_;
        if (align != 0 && value % align == 0) return true;

        ++failures_;
        begin_failure(file, line);
        std::printf("%s: value=0x%08" PRIx32 " is not aligned to %" PRIu32 "\n",
                    name, value, align);
        return false;
    }

    // 逐字节比较，报告第一个不同的字节。
    bool bytes_eq(const char* name, const void* actual,
                  const void* expected, std::size_t count,
                  const char* file = nullptr, int line = 0)
    {
        ++total_;
        const auto* a = static_cast<const std::uint8_t*>(actual);
        const auto* e = static_cast<const std::uint8_t*>(expected);

        for (std::size_t i = 0; i < count; ++i) {
            if (a[i] != e[i]) {
                ++failures_;
                begin_failure(file, line);
                std::printf("%s: byte[%zu] actual=0x%02x expect=0x%02x\n",
                            name, i, a[i], e[i]);
                return false;
            }
        }
        return true;
    }

    // 多字段检查（E4 exp7 的 check 封装）。
    // 一个“用例”只记一次 total；任一字段不符就记一次 failure，并打印所有不符字段。
    struct Value {
        std::string name;
        std::uint32_t actual;
        std::uint32_t expected;
    };

    bool all(const char* name, const Value* values, std::size_t count,
             const char* file = nullptr, int line = 0)
    {
        ++total_;
        bool ok = true;
        for (std::size_t i = 0; i < count; ++i) {
            if (values[i].actual == values[i].expected) continue;

            if (ok) {
                ok = false;
                ++failures_;
                begin_failure(file, line);
                std::printf("%s:\n", name);
            }
            std::printf("  %s: actual=0x%08" PRIx32 " expect=0x%08" PRIx32 "\n",
                        values[i].name.c_str(), values[i].actual,
                        values[i].expected);
        }
        return ok;
    }

    bool all(const char* name, std::initializer_list<Value> values,
             const char* file = nullptr, int line = 0)
    {
        return all(name, values.begin(), values.size(), file, line);
    }

    // 兼容 E5 test_suite.h 的调用方式。
    bool check(const char* name, std::uint32_t actual,
               std::uint32_t expected)
    {
        return eq_u32(name, actual, expected);
    }

    unsigned total() const { return total_; }
    unsigned failures() const { return failures_; }

    // 返回 0 表示全部通过且至少执行了一个检查，否则返回 1。
    int report() const
    {
        if (total_ == 0) {
            std::printf("FAILED: no checks executed\n");
            return 1;
        }
        if (failures_ != 0) {
            std::printf("FAILED: %u/%u\n", failures_, total_);
            return 1;
        }
        std::printf("PASS: %u checks\n", total_);
        return 0;
    }

private:
    void begin_failure(const char* file, int line) const
    {
        if (file != nullptr)
            std::printf("FAIL %s:%d ", file, line);
        else
            std::printf("FAIL ");
    }

    unsigned total_ = 0;
    unsigned failures_ = 0;
};

// ---------------------------------------------------------------------------
// 第 1.5 层：收集式比较（DiffTest 用）。
// 与 E5 difftest.cpp 的 Counts/Difference 同构，但封装成一个类。
// ---------------------------------------------------------------------------

struct Difference {
    std::string field;
    std::uint32_t actual;
    std::uint32_t expected;
};

class DiffCollector {
public:
    void compare(const std::string& field, std::uint32_t actual,
                 std::uint32_t expected)
    {
        ++total_;
        if (actual != expected)
            differences_.push_back({field, actual, expected});
    }

    unsigned total() const { return total_; }
    unsigned failures() const
    {
        return static_cast<unsigned>(differences_.size());
    }
    bool ok() const { return differences_.empty(); }

    void clear()
    {
        total_ = 0;
        differences_.clear();
    }

    const std::vector<Difference>& differences() const
    {
        return differences_;
    }

private:
    unsigned total_ = 0;
    std::vector<Difference> differences_;
};

// 宏只负责捕获文件名/行号和把表达式文本变成名字；
// 判断与打印都在函数里，参数只求值一次。
#define CHECK_EQ_U32(c, actual, expected) \
    (c).eq_u32(#actual, (actual), (expected), __FILE__, __LINE__)

#define CHECK_NE_U32(c, actual, unexpected) \
    (c).ne_u32(#actual, (actual), (unexpected), __FILE__, __LINE__)

#define CHECK_TRUE(c, condition) \
    (c).is_true(#condition, (condition), __FILE__, __LINE__)

#define CHECK_FALSE(c, condition) \
    (c).is_false(#condition, (condition), __FILE__, __LINE__)

#define CHECK_IN_RANGE(c, value, lo, hi) \
    (c).in_range(#value, (value), (lo), (hi), __FILE__, __LINE__)

#define CHECK_MASKED_EQ(c, actual, expected, mask) \
    (c).masked_eq(#actual, (actual), (expected), (mask), __FILE__, __LINE__)

#define CHECK_ALIGNED(c, value, align) \
    (c).aligned(#value, (value), (align), __FILE__, __LINE__)

#define CHECK_BYTES_EQ(c, actual, expected, count) \
    (c).bytes_eq(#actual, (actual), (expected), (count), __FILE__, __LINE__)

// 用法：CHECK_ALL(c, "reset", {{"pressed", dut.pressed, 0},
//                              {"keycode", dut.keycode, 0}});
#define CHECK_ALL(c, ...) (c).all(__VA_ARGS__, __FILE__, __LINE__)

// 兼容 E5 test_suite.h 的类名；把 #include "test_suite.h" 换成
// #include "check.h" 后，旧的 TestSuite tests; 写法不用改。
using TestSuite = Checker;

#endif
