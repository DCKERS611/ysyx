# minirv NPC 测试与波形

当前 RTL 支持 minirv 的8条指令和 ebreak，IFU 通过 DPI-C 取指，LSU 通过 DPI-C 访存。
在 WSL 的 `~/ysyx-workbench/npc` 中运行以下命令。

## 构建入口

| 文件 | 用途 | 输出目录 |
|---|---|---|
| Makefile.cpptest | C++ 驱动、RTL lint、程序运行 | build/cpp |
| Makefile.wave | 同一驱动开启 FST 波形；wave 目标直接打开 GTKWave | build/wave |
| Makefile.test | 包含 Makefile.cpptest 的兼容入口 | build/cpp |
| 原 Makefile | 原 NVBoard 配置，当前 E5 暂不使用 | 原目录 |

两种新模式不调用自动 Git 提交钩子。原 NVBoard 配置和 E4 文件保留。

## 程序文件与命令行

统一参数约定：

```text
sim <program.bin> [wave.fst]
```

第一个参数始终是程序文件；第二个参数可选，只在带波形构建时使用。
未传第二个参数就不打开波形文件。main 不再内嵌机器码数组。

程序文件是原始二进制，按小端保存 32 位字，不是十六进制文本或 ELF。
当前要求文件非空、大小为 4 的倍数，且不超过 1024 字节。
pmem_load_file 负责读文件并按小端组装，pmem_load 负责清零和复制。
未装载的存储器内容保持为 0。

默认程序由 `tests/gen_program.py` 自动生成到
`build/programs/addi-jalr.bin`，内容是原来的六条讲义指令，含 ebreak。
脚本用 Python 的 `struct.pack("<I", word)` 输出小端字，修改列表后会重新生成。
生成的 bin 属于构建产物，不需要手动维护。

## 检查与运行

```bash
make -f Makefile.cpptest lint
make -f Makefile.cpptest sim
```

仅编译：`make -f Makefile.cpptest build`。
兼容旧测试命令：`make -f Makefile.test test`。
指定其他原始二进制：

```bash
make -f Makefile.cpptest sim PROGRAM=program.bin
```

也可以直接运行生成的可执行程序：

```bash
./build/cpp/sim build/programs/addi-jalr.bin
```

目前 main 保留最多 1000 周期的保护，未执行到 ebreak 则测试失败。
由于程序可替换，不再对所有程序固定要求 a0=30、ra=12 或 halt_pc=0x0c。
通用的 TestSuite 只检查 hit ebreak，因此通过输出是 `PASS: 1 checks`。
这只证明程序正常触发结束，不能代表任意程序的计算结果正确。

默认程序的结果应另外核对为：

```text
Result: halt_pc=0x0000000c a0=0x0000001e ra=0x0000000c cycles=6
```

`csrc/test_suite.h` 可用于添加每个测试程序自己的寄存器和内存期望。

## 波形

```bash
# 执行默认程序，生成 FST 并直接打开 GTKWave
make -f Makefile.wave wave

# 使用其他程序
make -f Makefile.wave wave PROGRAM=program.bin

# 只运行并生成 FST，不打开窗口
make -f Makefile.wave sim

# 修改波形输出位置
make -f Makefile.wave wave PROGRAM=program.bin WAVE_FILE=build/wave/custom.fst
```

默认输出为 `build/wave/wave.fst`。`view` 与 `wave` 行为相同。
GTKWave 需要 WSLg 或可用的图形环境。直接调用带波形的可执行程序：

```bash
./build/wave/sim build/programs/addi-jalr.bin build/wave/wave.fst
```

在 GTKWave 中展开 TOP / top，选择信号后 Append，再 Zoom Fit。
建议先看 clk、rst、pc、inst、next_pc，然后看 rs1_data、imm、alu_out、
wen、rd、wdata、halt、illegal。u_rf 下的 rf[1] 和 rf[10] 分别是 ra、a0。

上升沿前的组合结果决定本次更新，沿后的组合结果属于新 PC 对应的指令。
区分 top 的写请求和 u_rf 内部经过 x0 屏蔽后的实际 wen。
当前每次求值后推进一个时间精度单位，时间轴不代表真实运行频率。

## 源码职责

- main.cpp：参数解析、装载、运行循环和结果检查。
- pmem.cpp/.h：存储器、文件装载和读写函数。
- dpi.cpp/.h：ebreak 回调和结束记录。
- sim.cpp/.h：时钟、复位、单拍运行与波形。
- test_suite.h：32 位数值检查工具。

## 清理

```bash
make -f Makefile.cpptest clean
make -f Makefile.wave clean
```

分别只清理 build/cpp 和 build/wave；共享的默认 bin 保留，生成脚本更新时自动重建。

## 小汇编器 tools/mkprog.py

只支持 minirv 的 9 条指令和 j 伪指令，不处理宏、ELF、重定位或其他伪指令。
只依赖 Python 标准库。

```bash
# 讲义原始程序：末尾自跳，仅用于核对六条机器码
python3 tools/mkprog.py tests/programs/lecture.s -o build/programs/lecture.bin

# 用 ebreak 结束的版本：可直接运行
python3 tools/mkprog.py tests/programs/ebreak.s -o build/programs/ebreak.bin
make -f Makefile.cpptest sim PROGRAM=build/programs/ebreak.bin
make -f Makefile.wave wave PROGRAM=build/programs/ebreak.bin

# 工具自身的独立测试
python3 -m unittest discover -s tests -p test_mkprog.py -v
```

不传 -o 时，默认在输入文件旁生成同名 .bin；同时始终生成同名 .hex 清单。
bin 是供模拟器装载的小端原始字节；hex 是“字节地址、机器码、原指令”的文本清单，
不应把 hex 作为程序文件装载。

支持语法：

| 指令 | 写法 |
|---|---|
| add | add rd, rs1, rs2 |
| addi | addi rd, rs1, imm |
| lui | lui rd, imm20 |
| lw / lbu | lw rd, offset(rs1) / lbu rd, offset(rs1) |
| sw / sb | sw rs2, offset(rs1) / sb rs2, offset(rs1) |
| jalr | jalr rd, rs1, imm |
| ebreak | ebreak |
| 标签 | name:，也可和指令写在同一行 |
| j | j name，展开为 jalr x0, x0, 标签的绝对字节地址 |

例如：

```asm
    addi a0, zero, 20
    jalr ra, zero, fun
    j done
fun:
    addi a0, a0, 10
    jalr zero, ra, 0
done:
    ebreak
```

寄存器支持 x0..x15 和 ABI 名 zero、ra、sp、gp、tp、t0..t2、s0/fp、s1、a0..a5；
不接受 x16..x31 或 a6/a7。可用 #、//、分号开始注释。
立即数支持十进制、有符号数及 0x 前缀的十六进制。
I/S 型范围为 -2048..2047；lui 使用 20 位字段，
可写 0..0xfffff 或 -524288..-1 的补码表达。

标签从地址 0 开始记录，每条指令占 4 字节。
标签用于立即数时表示绝对字节地址，不自动计算 PC 相对偏移。
因此 j 不是 RISC-V 的 jal 跳转：它依靠 x0 加 12 位立即数，
正向标签地址最多为 2047，超出会报错，不会静默截断。
超过 NPC 当前 1024 字节容量的程序仍由 pmem_load_file 拒绝装载。

工具在写输出前先完成整份汇编；未知指令、重复/未定义标签、寄存器越界、
立即数越界和操作数格式错误都会给出行号并以非零状态退出。

## 分类 CPU 测试

功能与边界分开运行：

```bash
make -f Makefile.cpptest test-functional
make -f Makefile.cpptest test-boundary
```

程序期望直接写在 .s 的 EXPECT 注释中，由 C++ TestSuite 核对。
类别、程序清单、非法编码注入和波形操作见 [tests/README.md](tests/README.md)。

## 逐条 DiffTest

```bash
make -f Makefile.diff
make -f Makefile.diff difftest-small
make -f Makefile.diff difftest-medium
make -f Makefile.cpptest difftest
```

独立驱动在 csrc/difftest.cpp，参考核心与 minirvEMU 独立入口共用 emu.cpp。
每步比较1个PC和16个寄存器，程序结束后比较整块内存。
EMU 在 ebreak 后 PC 不动，NPC 前进；halt 当步只比较前PC。
逐拍打印在 DiffTest 中关闭。详细计数、初态、程序和真实改错记录见
[tests/README.md](tests/README.md)。

## 当前架构与复盘入口

RTL 顶层输入 clk、rst，输出 pc、inst、illegal；
不再有 inst_in，IFU 自己调用 pmem_read。
IDU 输出 wen/alu_src/wb_sel/pc_sel/halt 和 mem_read/mem_write/mem_byte。
EXU 的 alu_out 同时给 WBU 和 LSU.addr；LSU.load_data 接 WBU。
GPR 组合读、上升沿写，x0 写入在寄存器堆内部屏蔽。
LSU 组合读、上升沿写，sb 数据与 mask 都按地址低两位移动。
WBU 选择编码：00=ALU，01=load，10=U型立即数，11=pc+4。

复盘按四条线读，不再增加功能：
1. 代码：main.cpp 如何装载、循环、检查。
2. 架构：IFU→IDU/GPR→EXU→LSU→WBU，以及上升沿更新。
3. 驱动：sim_init/reset/step、eval、DPI 和波形的调用顺序。
4. 测试：手写 EXPECT、TestSuite、EMU 独立执行与 DiffTest 各验证什么。

## 大程序验收与收尾

```bash
make -f Makefile.cpptest lint
make -f Makefile.cpptest test-acceptance
make -f Makefile.diff
make -f Makefile.cpptest check-waves
```

验收结果：1..10求和 a0=55；数组1,2,3,4求和 a0=10；
字节累加 a0=0x114，修改字节后内存为0x12ab5678。
三个程序分别通过 NPC、独立 EMU 和 DiffTest，共用 .s 中的独立期望。
含验收程序的完整 DiffTest 共23个案例。
add/lw/sb 的实际波形抽查过程和时间点见 tests/README.md。

build/、obj_dir/、bin/FST/VCD 均忽略；测试源码、汇编源码和生成脚本应保留。
Git add/commit 由使用者在 WSL 执行，本次不代为提交。

## E6 DiffTest 接入（2026-10-22）

本节对应当前 E6 工程；上文关于 1024 字节、零基址和 E5 手写程序的说明是历史记录。
参考模型已由学习者适配为 0x80000000 基址、128MB；独立入口和 DiffTest 的 Emulator 使用 static 存储。

AM 运行命令增加 `DIFFTEST=1` 即启用逐指令比较：

```bash
cd ~/ysyx-workbench/am-kernels/tests/cpu-tests
make ARCH=minirv-npc ALL=dummy run DIFFTEST=1
make ARCH=minirv-npc ALL=wrong run DIFFTEST=1
cd ~/ysyx-workbench/riscv-tests
make ARCH=minirv-npc run ALL=addi DIFFTEST=1
make ARCH=minirv-npc run TEST_ISA=i DIFFTEST=1
```

`npc.mk` 根据开关选择普通入口 `Makefile.cpptest run` 或差分入口 `Makefile.diff diff`。
默认不带开关仍使用普通仿真。

差分入口中两边分别装载同一 bin，最多执行 1000000 步，每步比较 PC、16 个 GPR、读口及结束协议；ebreak 后 PC 的差异沿用 E5 约定。
结束后比较全部 128MB 内存，循环偏移加 memory_base 后才交给 pmem_read/emu.word。
相同内存项只计数，不构造字符串；未提供 EXPECT 文件时也不保存整段 PC 轨迹。
无 EXPECT 文件的 AM 模式还要求 a0==0；因此 wrong 即使两边状态一致仍返回非零。
旧 EXPECT 接口保留，但旧 E5 零地址的镜像/期望不可直接用于当前 E6 工程。
尚未支持 UART/时钟 MMIO 的差分同步，后续设备阶段再实现。

验证：dummy 17 步通过；addi 2283 步通过；riscv-tests 38/38 通过；wrong BAD TRAP 并传回外层 FAIL。
隔离构建中把 EXU 加法多加 1，第 1 步 x8=1、参考为 0，差异触发非零退出。正式 RTL 未修改。
完整回归日志在 /tmp/e6-diff-all.log；注入日志在 npc/build/fault-injection-e6/make.log，均为临时构建证据。
