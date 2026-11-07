# minirv 分类测试

在 WSL 的 ~/ysyx-workbench/npc 中运行：

```bash
# 检查 RTL
make -f Makefile.cpptest lint

# 功能与边界分开运行
make -f Makefile.cpptest test-functional
make -f Makefile.cpptest test-boundary

# 全部运行
make -f Makefile.cpptest test-all
```

普通的 sim <program.bin> [wave.fst] 接口保持不变。
分类测试另用 tests/cpu_test.cpp，调用同一份 sim/pmem/dpi，
由现有 csrc/test_suite.h 中的 TestSuite 检查。
没有修改 RTL，也不依赖 NVBoard。

每个 .s 文件的开头直接写预期，测试脚本提取注释生成 .expect；
不需要在另一个文件中重复维护期望。
成功时每行显示类别和程序名，失败时打印该程序完整轨迹及具体检查项，
最后返回非零退出码。一个程序失败后仍会运行同组其他程序。
每个程序是独立进程，避免 GPR 没有整体复位而残留上一个程序的状态。

## 功能测试

| 文件（tests/programs/functional） | 检查 |
|---|---|
| arithmetic.s | addi/add/lui 基本计算与写回 |
| word_memory.s | sw/lw，非零基址和偏移，核对寄存器及内存 |
| byte_memory.s | lbu 的四个小端字节通道、零扩展；sb 四个通道及相邻字节保留，含 0xff |
| call_return.s | jalr 调用/返回、ra/a0、完整 PC 轨迹 |

## 边界测试

| 类别 | 文件（tests/programs/boundary） | 检查 |
|---|---|---|
| 立即数符号扩展 | immediate_sign.s | -1/-2048/2047、I/S 型负偏移、跨符号边界结果 |
| 立即数符号扩展 | jalr_negative.s | jalr 负偏移，跳过毒丸指令 |
| U 型拼接 | u_immediate.s | 0xfffff/0x80000/1，低 12 位清零，立即数位不误作寄存器检查 |
| x0 只读 | x0_readonly.s | 用 addi/add/lui/lw/jalr 尝试写 x0，再通过真实指令读 x0 |
| 非法寄存器 | illegal_rd.s | rd=x16，必须在提交前拒绝 |
| 非法寄存器 | illegal_rs1.s | rs1=x16，不能截断成 x0 |
| 非法寄存器 | illegal_rs2.s | rs2=x16，不能截断成 x0 |
| 非法寄存器 | illegal_store.s | 非法 store 不允许修改内存 |
| jalr rd=rs1 | jalr_same_register.s | 用旧 rs1=17 算出目标16，同时写回8；也核对目标最低位清零 |
| 未支持编码 | unsupported_funct3.s | ori 不得误当 addi |
| 未支持编码 | unsupported_funct7.s | sub 不得误当 add |
| 未支持编码 | unsupported_system.s | ecall 不得误当 ebreak |
| 未支持编码 | unsupported_store.s | sh 不得误当 sw/sb，不允许写内存 |
| 连续跳转 | consecutive_jumps.s | 连续改变 PC，核对每条轨迹和链接寄存器，毒丸指令不得执行 |

## EXPECT 注释

示例：

```asm
# EXPECT halt 0x0c
# EXPECT cycles 6
# EXPECT reg 10 30
# EXPECT mem 0x100 0x12345678
# EXPECT trace 0 4 16 20 8 12
```

| 注释 | 含义 |
|---|---|
| EXPECT halt 地址 | 触发 ebreak 时的旧 PC，不是执行后 PC |
| EXPECT cycles 数量 | 成功提交的指令条数；非法指令不计入 |
| EXPECT reg 编号 值 | 真实 GPR 数组的 x1..x15；编号使用数字 |
| EXPECT mem 字节地址 值 | 对齐的 32 位内存值 |
| EXPECT trace 地址... | 执行/尝试执行的完整 PC 序列 |
| EXPECT illegal 地址 编码 | 必须在该地址拒绝该编码，不能误触发 ebreak |

每个案例还自动检查单步是否失败、是否因 illegal 拒绝、是否触发 ebreak、
以及仿真结束标志。正常程序超时、非法程序一路跑到 ebreak 都算失败。

不要检查 rf[0] 的数组底层值来证明 x0 正确：硬件可以不存储 x0，
因此本组程序用 addi、store 等真实读端口的行为验证 x0。

## 故意非法的指令如何生成

小汇编器会拒绝 x16 和不支持的指令，因此这些案例保留一条合法占位指令，
并用明确的注释在指定位置替换为原始机器码：

```asm
# INJECT 0x04 0x00100813
# EXPECT illegal 0x04 0x00100813
addi a0, zero, 7
addi zero, zero, 0  # 地址4被替换为 addi x16,x0,1
ebreak
```

INJECT 只由 tests/run_cpu_tests.py 处理，不扩充 mkprog 的指令集。
故意非法的案例必须通过分类测试入口生成，直接调用 mkprog 只会保留占位指令。
脚本验证注入地址的对齐、范围、重复，以及 32 位编码范围。
生成的 .hex 会显示实际注入的编码，不隐藏非法输入。

生成文件位于 build/regress/programs/functional 和 boundary：
每个案例对应 .bin、.hex、.expect。二进制均从地址0装载。

## 看某个案例的波形

先运行对应分类测试以生成 bin，然后：

```bash
make -f Makefile.wave wave PROGRAM=build/regress/programs/boundary/jalr_same_register.bin
```

该命令使用通用 main，只生成波形并检查是否命中 ebreak；
完整的寄存器/内存/轨迹期望仍由分类测试检查。
对于预期非法的案例，通用 main 会返回失败，这是正常的；
分类测试才会把“正确拒绝非法编码”识别为通过。

## 本次结果

2026-10-20：RTL lint 通过；功能测试4个程序、48项检查通过，
边界测试14个程序、151项检查通过。
这些是针对当前 minirv 的定向测试，不等同于逐条 DiffTest 或指令组合穷举。

## 逐条 DiffTest

### 构建和运行

```bash
# 全部：功能4个、边界14个、规模2个、验收3个，共23个程序
make -f Makefile.diff

# 也可以沿用原入口
make -f Makefile.cpptest difftest

# 单独运行
make -f Makefile.diff difftest-functional
make -f Makefile.diff difftest-boundary
make -f Makefile.diff difftest-small
make -f Makefile.diff difftest-medium

# 对比一个已有的合法 bin，不附加手写末态期望
make -f Makefile.diff diff PROGRAM=build/programs/addi-jalr.bin
```

新驱动为 csrc/difftest.cpp；普通 main.cpp 与分类测试入口保持独立。
原来 tests/difftest.cpp/.h、minirv_ref.cpp/.h 已删除，避免维护两套参考实现。

### EMU 核心

minirvEMU 现在拆为：

| 文件 | 内容 |
|---|---|
| ../minirvEMU/emu.h | CPUState：pc、R[16]、M[1024字节]；Emulator 的 reset/step/load_program/get_state 接口 |
| ../minirvEMU/emu.cpp | 独立的取指、译码、执行与文件装载；不打印 |
| ../minirvEMU/main.cpp | 独立命令行入口，调用相同 emu 接口并打印执行过程 |

reset 清除 PC/GPR/结束标志，保留已装载内存；
load_program 清空整块内存后装载文件，并初始化 CPU 状态。
EMU 不调用 NPC 的 pmem，不复用 RTL 的译码结果。
两边从同一 bin 分别装载，开始后不再同步运行状态。

```bash
cd ~/ysyx-workbench/minirvEMU
make lint
make sim
# 或指定程序
make sim PROGRAM=../npc/build/difftest/programs/difftest/medium.bin
```

当前 RTL 不会整体复位 GPR，因此 DiffTest 测试台在复位前把 rf[0..15]
一次性设为0，与 EMU 初态相同。此举不代表 RTL 实现了 GPR 复位。
rf[0] 是未使用的底层槽，对其做快照比较不能单独证明 x0 读端口正确；
因此还检查实际 rs1/rs2 读端口，并保留 x0_readonly 指令程序。

### 驱动与比较时机

1. 两边分别装载程序并复位。
2. 记录执行前 PC、指令、寄存器读端口与 illegal。
3. NPC 走一拍，然后 EMU 执行一条。
4. 正常指令比较执行后 PC、R0～R15；发现差异时打印本步全部差异，再停止。
5. 程序结束后一次性比较全部1024字节内存（256个对齐字）。

sim_set_verbose(false) 关闭逐拍和 ebreak 的正常输出；
错误诊断仍保留。普通运行默认继续打印。
独立驱动的命令行为：

```text
build/difftest/difftest <program.bin>
build/difftest/difftest <program.bin> <expectations> <case-name>
```

分类模式还会用原 EXPECT 注释独立检查末态，不仅依赖参考模型。

### ebreak PC 约定

EMU 在 ebreak 后 PC 保持不动；NPC 在该上升沿更新 PC。
halt 那一步只比较执行前 PC，不比较两边执行后的 PC。
例如讲义程序结束时 NPC.pc=0x10、EMU.pc=0x0c，两者允许不同；
触发结束的位置均必须是0x0c，结束状态与GPR仍需一致。
普通指令的前PC/指令也做辅助核对，后PC照常比较。

### 计数和失败格式

主计数严格是每一步17项：1个PC、16个寄存器。
halt 当步的PC项改为前PC，以保持 N×17。非法案例在拒绝前也做一次
状态检查，因此其 N 包含被拒绝的那次尝试。
存储器、读端口与停止协议单独计数；手写 EXPECT 也单独汇总。

成功示例：

```text
PASS: 221 (13 steps x 17)
Memory: PASS 256 words; protocol/read checks: ...
```

失败示例（来自真实双重故障实验）：

```text
step=1 pre_pc=0x00000000 inst=0x10000113
pc: actual=0x00000008 expect=0x00000004
x2: actual=0x00000101 expect=0x00000100
FAILED: 2/24
```

失败总数包含截至该步的主比较和辅助比较，所以分母可能不为17的倍数。
PC、寄存器和结束后的内存比较均收集全部差异，不只报第一项。
每组继续运行其他程序，最终存在失败则返回非零。

### 规模与手写期望

| 程序 | 静态指令数 | 动态步数 | 主比较项 | 独立期望 |
|---|---:|---:|---:|---|
| tests/programs/difftest/small.s | 14 | 13 | 221 | 覆盖8条指令，a0=0x101、ra=0x2c、内存0x100=0x12ab5678 |
| tests/programs/difftest/medium.s | 38 | 80 | 1360 | 数组1..8求和36，指针与跳转表内容正确 |

minirv 没有条件分支，中程序用8项跳转地址表控制循环：
前7项回到 loop，最后一项到 done，而不是额外引入不支持的 bne。

### 真实 RTL 故障检出记录

2026-10-20 对源码做过以下临时修改，每次单独改错、运行小程序、
记录失败、恢复原字节并重新编译，均确认恢复后 PASS：

| 修改 | 预期检出点 | 实际结果 |
|---|---|---|
| EXU 加法额外加1 | 第1步 addi sp,x0,0x100 | x2 实际0x101，期望0x100 |
| sb 的 wmask 通道错移一字节 | 第9步 lw s1,0(sp) | x9 实际0x00345678，期望0x12ab5678 |
| wen 屏蔽 addi 写回 | 第1步 addi sp,x0,0x100 | x2 实际0，期望0x100 |
| 同时改错 EXU 与顺序 PC | 第1步 | 同时打印 pc 和 x2 两项差异 |

wmask 错误在 store 时仅改变内存，按本方案的比较时机，
直到紧接着的 lw 改变 GPR 才被检出；若没有该次读取，则在结束后的内存比较检出。
日志保存在 build/difftest/mutations/*.log，恢复日志带 -restored。
全部 RTL 均已恢复，不保留任何故障修改。

改造时的20个程序全部通过；这是定向验证，不代表全指令组合穷举。
尚不包括 MMIO、中断和多周期总线协议。参考模型要求 lw/sw 对齐，
与当前讲义的测试程序约定一致。

## 第7步：大程序验收

```bash
make -f Makefile.cpptest test-acceptance
make -f Makefile.diff difftest-acceptance
make -f Makefile.cpptest check-waves
```

三个 .s 都在 tests/programs/acceptance，用 tools/mkprog.py 的 assemble
生成原始 bin 与 hex 清单。期望直接写在 EXPECT 注释中：

| 程序 | 静态指令 | 动态步数 | a0 | 内存期望 |
|---|---:|---:|---:|---|
| sum_1_to_10.s | 24 | 23 | 55 | 无数据写入 |
| array_sum.s | 21 | 20 | 10 | 0x80/84/88/8c 分别为1/2/3/4 |
| byte_sum.s | 18 | 17 | 0x114 | 0x100 对齐字为0x12ab5678 |

第一份按1..10展开，便于手工核对；循环已在 medium.s 中用跳转表验证。
数组程序的84字节指令区不会覆盖0x80的数据区。
三个程序合计使用全部8条 minirv 指令与 ebreak。

test-acceptance 为每个程序分别执行：
1. NPC 独立分类入口，TestSuite 核对注释期望。
2. minirvEMU 独立入口，核对 a0、halt 地址和动态指令数。
3. DiffTest，比较所有寄存器并在结束后逐字比较全部内存，再核对注释期望。

结果与每次独立运行的日志放在 build/acceptance/programs，
汇总在 build/acceptance/results.md。完整 DiffTest 现在共23个程序：
功能4、边界14、规模2、验收3。

### 波形抽查

check-waves 使用真实的两个 FST，通过 fst2vcd 转换，再由
tests/check_acceptance_wave.py 读取上升沿前后信号；
不把“成功生成波形”当成“已检查信号”，也不声称已人工查看 GTKWave 图形窗口。

本次抽查结果：

| 指令 | 文件/执行前PC | 上升沿时间 | 核对内容 |
|---|---|---|---|
| add a0,a0,t1 | array_sum，0x34 | 28 ps | rs1=0、rs2=1、alu_src=0、结果1、rd=10；沿后a0=1 |
| lw t1,0(sp) | array_sum，0x30 | 26 ps | 地址0x80、load_data=1、wb_sel=01、wdata=1；沿后x6=1 |
| sb t2,2(sp) | byte_sum，0x38 | 32 ps | 地址0x102、store_data=0x00ab0000、mask=0x04、wen=0 |

时间只是当前驱动 eval 采样的时间精度，不代表物理频率。
sb 的内存效果另由 TestSuite 和 DiffTest 确认，最终为0x12ab5678。

手动看同一份波形：

```bash
gtkwave build/acceptance/waves/array_sum.fst
gtkwave build/acceptance/waves/byte_sum.fst
```
