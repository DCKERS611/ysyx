# E7 测试库与运行入口

正式环境是 WSL Ubuntu-22.04，目录为 `/home/ysyx/ysyx-workbench/npc`。
Windows `E:\ysyx\e\e7` 是独立副本，不会自动同步。

## 先看各层负责什么

| 层 | 代码入口 | 输入 | 输出与职责 |
|---|---|---|---|
| 通用检查 | `csrc/check.h` | 实际值、期望值、检查名称 | 相等、范围、掩码、字节、多字段检查；收集失败并汇总 |
| 兼容入口 | `csrc/test_suite.h` | 原有 `TestSuite` 调用 | 复用 Checker，不再维护第二份判断逻辑 |
| CPU 观察 | `csrc/cpu_view.h` | 独立 NPC 的 Verilator 模型 | 读取 PC、指令、commit、illegal、GPR 和读端口；集中维护内部层级名 |
| 独立 NPC 仿真 | `csrc/sim.cpp` | 总线请求、回复延迟配置 | 时钟推进、存储器回复、波形、周期和退休指令统计 |
| 手写末态检查 | `tests/expectations.h`、`tests/cpu_test.cpp` | bin、expect、案例名，可选 FST 路径 | 检查寄存器、内存、停止位置、轨迹、指令数和指定配置的精确周期 |
| DiffTest | `csrc/difftest.cpp` | 同一份 bin 和可选手写期望 | 只在提交或拒绝指令时推进参考模型；比较架构状态，结束比较128 MiB内存 |
| 案例调度 | `tests/run_cpu_tests.py` | 案例组、runner | 汇编、注入非法编码、生成期望、执行并汇总退出状态 |
| SoC 仿真 | `csrc/soc_main.cpp`、`Makefile.soc` | Flash 镜像 | 使用 VSimTop 和真实 RTL 总线通路；与独立 NPC 的随机存储器模型分开 |

E6 已有 `check.h` 被复用到 E7 并实际接入。E6 的 `npc_test.h`、`npc_diff.h`
仍依赖旧 Vtop 和旧模型布局，没有直接复制接入；本轮 CPU 适配集中在 cpu_view.h。
SoC 当前没有接入逐条 DiffTest，不能把独立 NPC 的结果写成 SoC 已通过。

## 通用检查器怎么使用

```cpp
#include "check.h"

Checker checks;
checks.eq_u32("寄存器结果", actual, expected);
checks.is_true("写入后可读", condition);
return checks.report();
```

失败后继续收集，最后 `report()` 返回非零；零项检查也返回非零。
旧代码的 `TestSuite checks; checks.check(...);` 接口继续可用。
`CHECK_EQ_U32` 等宏还会记录调用文件和行号，表达式只求值一次。
DiffCollector 用于收集一次比较中的多个字段差异；DiffTest 保留每步17项主比较和独立辅助计数。

## 现有批量入口

```bash
make -f Makefile.cpptest lint
make -f Makefile.cpptest test-library
make -f Makefile.cpptest test-all
make -f Makefile.diff difftest
make -f Makefile.cpptest test-fixed
make -f Makefile.diff difftest-fixed
make -f Makefile.cpptest test-acceptance
make -f Makefile.cpptest check-waves
```

`test-library` 不依赖 Verilator，包含故意失败的数值/字节/多字段检查；
中间打印 FAILED 是验证失败传播的输入，最终退出码及最后汇总才是该入口的结果。
`test-all` 是功能4个、边界14个；`difftest` 另含规模2个、验收3个，共23个。
`test-acceptance` 对3个验收程序分别执行 NPC、独立 EMU、DiffTest。
`check-waves` 使用带期望检查的测试 runner 生成真实 FST，再转为 VCD 检查提交沿；
不再使用要求 a0=0 的通用 AM main 判断非零计算结果。

## 固定延迟与随机延迟

默认 `NPC_MEM_DELAY=0`：原有 LFSR、初值0xACE1，每笔请求随机等待1～20拍。
环境变量设为1～20时使用对应固定拍数，无需修改源码和重新编译。
`test-fixed`、`difftest-fixed` 使用固定1拍，两个 CPU RANDOM_REQ 参数保持0。
其他固定拍数可用于功能回归；精确周期期望只检查该案例明确声明的配置。

| EXPECT 项 | 含义 |
|---|---|
| `instructions N` | 成功退休的指令数，包含 ebreak，不包含被拒绝的非法指令 |
| `cycles N` | 无条件检查时钟周期数，用于明确固定配置的材料 |
| `cycles_fixed D N` | NPC_MEM_DELAY=D 时检查精确周期数N |
| `cycles_random N` | 默认确定性随机回复时检查精确周期数N |
| `halt 地址` | ebreak 所在 CPU 地址 |
| `illegal 地址 编码` | 必须在该地址拒绝指定编码，不能误触发 ebreak |
| `reg 编号 值` | 寄存器末态；x0 通过真实指令读行为验证 |
| `mem 地址 值` | 对齐32位内存末态 |
| `trace 地址...` | 已执行或拒绝的完整指令PC序列 |

全部源码地址以0x80000000为内存基址；INJECT 地址仍是bin文件内偏移。
旧用例迁移时用a5保存基址，更新了跳转、指针、轨迹和非法编码注入位置。
固定1拍下，每条普通指令占2拍，每次load/store另占1拍；
非法指令在取指回复后拒绝，不计入退休数，但其取指等待计入周期数。
功能组还保留默认随机配置下的精确周期检查；寄存器和内存期望不随延迟改变。

## 波形与结果边界

波形位于 `build/acceptance/waves/`。例如在 WSL 使用 GTKWave 打开已生成的 FST。
当前自动抽查 add、lw、sb 的提交沿，检查读操作写回、写操作数据移位及掩码。
这是自动检查结果，不代表用户已经亲自阅读波形。

实际验证结果继续记在 Windows 的 `E7学习记录.md`，本目录不另建验收记录。
