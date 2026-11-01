#include "check.h"

// 验证通用库的失败传播与多差异收集；这里的故意失败不代表回归失败。
int main()
{
    Checker result;
    TestSuite compatibility;
    compatibility.check("旧接口兼容", 42, 42);
    result.check("旧接口汇总", compatibility.report(), 0);

    Checker empty;
    result.check("零检查不能通过", empty.report(), 1);

    Checker checks;
    checks.eq_u32("正常相等", 7, 7);
    checks.ne_u32("不同值", 1, 2);
    checks.masked_eq("只比较选中的位", 0xab12, 0xcd12, 0xff);
    checks.aligned("合法对齐", 0x80000000, 4);
    const unsigned char actual[] = {0x78, 0x56};
    const unsigned char same[] = {0x78, 0x56};
    const unsigned char other[] = {0x78, 0x57};
    checks.bytes_eq("相同字节", actual, same, 2);
    result.check("成功检查结果", checks.report(), 0);

    Checker failures;
    failures.eq_u32("故意错误数值", 1, 2);
    failures.aligned("零对齐参数必须失败", 0, 0);
    failures.bytes_eq("错误字节", actual, other, 2);
    failures.all("同时显示多个错误", {{"pc", 4, 8}, {"x1", 1, 2}});
    result.check("失败项数量", failures.failures(), 4);
    result.check("失败汇总退出码", failures.report(), 1);

    DiffCollector differences;
    differences.compare("pc", 4, 8);
    differences.compare("x1", 1, 2);
    differences.compare("x2", 3, 3);
    result.check("比较项数", differences.total(), 3);
    result.check("收集全部差异", differences.failures(), 2);
    result.is_false("有差异不能通过", differences.ok());
    differences.clear();
    result.check("清除比较项数", differences.total(), 0);
    result.is_true("清除差异", differences.ok());
    return result.report();
}
