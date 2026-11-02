# E7：SimpleBus、SoC 程序运行与 UART/NVBoard

正式开发环境是 WSL Ubuntu-22.04，源码位于 `/home/ysyx/ysyx-workbench`。本目录是供 Git 审阅的 Windows 副本；2026-11-02 已同步本轮f–h源码，1119个选定源码/必要输入文件与WSL的SHA-256一致。运行及验证仍在WSL进行，同步不是Windows复测。

## 当前实现与停点

- CPU 顶层为 `npc/vsrc/ysyx_00000000.v`，临时编号统一使用00000000，内部模块也使用相同前缀。
- IFU 保存指令，LSU 保存访存任务，通过 start/done 连接；请求与回复走 SimpleBus，等待期间不提交。
- CPU 对外端口已对齐 `io_ifu_*`、`io_lsu_*`，包含2位size；调试信号保留在CPU内部。
- SoC 的 `ysyxSoC/ready-to-run/minirv/ElaborateTop.v` 实例化该CPU，并以参数覆盖复位地址为 `0x30000000`。独立NPC默认复位到 `0x80000000`。
- 阶段e曾由用户运行，已触发Flash桩函数断言，证明请求到达Flash模型。
- 测试架构步骤1–4已完成：sim_session、事件/结果、比较器复用、RESULT/Python调度与入口整理。
- 阶段f已通过课程hello、自编dummy、SoC cpu-tests（35项正常PASS、wrong预期FAIL）和RV32I（38/38）。Flash为16 MiB，CPU执行loader装载到PSRAM，以ebreak和a0判断程序退出。
- NPC与ysyxsoc使用独立TRM：NPC保留行为模型设备接口及128 MiB内存范围，SoC使用UART16550和8 MiB PSRAM范围。
- 阶段g/h已验证自编hello、UART初始化/发送、NVBoard TX接收，以及错误除数对照和恢复。UART除数13、NVBoard接收间隔208；执行阶段每完整SoC时钟周期更新一次NVBoard。
- 当前只开始阶段i的GPIO背景，mygpio_top_apb.v仍为空壳，GPIO/CSR尚未实现。功能验收与本人理解情况分开记录。

## 先看这些代码

| 内容 | 入口 |
|---|---|
| CPU 顶层与各模块 | `npc/vsrc/` |
| 通用检查库，复用已有实现 | `npc/csrc/check.h` |
| test_suite 兼容入口 | `npc/csrc/test_suite.h` |
| 独立CPU内部状态观察接口 | `npc/csrc/cpu_view.h` |
| 独立NPC时钟、总线模型与波形 | `npc/csrc/sim.cpp` |
| 逐条DiffTest | `npc/tests/difftest.cpp` |
| 独立参考模型 | `minirvEMU/emu.cpp` |
| 手写期望与调度 | `npc/tests/expectations.h`、`npc/tests/run_cpu_tests.py` |
| SoC驱动、Flash加载与读取 | `npc/tests/soc_main.cpp` |
| SoC构建入口 | `npc/Makefile.soc` |
| 两平台TRM与SoC镜像规则 | `abstract-machine/am/src/riscv/npc/trm.c`、`abstract-machine/am/src/riscv/ysyxsoc/trm.c`、`abstract-machine/scripts/minirv-ysyxsoc.mk` |
| NVBoard串口绑定 | `npc/constr/soc.nxdc`；绑定C++由脚本生成到构建目录 |

测试库的分层、输入输出和期望语义见 [npc/tests/README.md](npc/tests/README.md)。实际验证记录见 [E7学习记录.md](E7学习记录.md) 第十九节及第二十二至二十八节；阶段级命令见 [测试与构建入口索引](../测试与构建入口索引.md) 的E7部分。

## 在 WSL 运行

需要现有的Verilator、C++17编译器、GNU Make、Python3；波形转换需要fst2vcd，人工查看使用GTKWave。AM程序编译还需要RISC-V工具链及AM_HOME。NVBoard还需要SDL2、SDL2_image、SDL2_ttf和可用图形环境，并设置NVBOARD_HOME。

在正式源码中执行：

```bash
cd /home/ysyx/ysyx-workbench/npc
make -f Makefile.cpptest regress
```

默认 `NPC_MEM_DELAY=0` 使用原有LFSR、初值0xACE1，每笔请求随机回复1～20拍；设为1～20则使用对应固定延迟，无需改源码重编译。IFU与LSU的请求随机参数RANDOM_REQ默认均为0，开启请求侧压力测试时两处都要修改。

SoC使用独立驱动，不与独立NPC的随机回复模型混用：

```bash
make -f Makefile.soc build
make -f Makefile.soc run
make -f Makefile.soc wave
```

Makefile.soc默认选择课程hello镜像，也可用PROGRAM指定镜像；驱动参数为sim <镜像.bin> [波形.fst]。观察上限与进度输出见npc/tests/soc_main.cpp，耗尽预算不判成功。断言中止可能使FST未完整关闭，生成文件不等于检查通过。

自编SoC hello与NVBoard的入口为：
```bash
export AM_HOME=/home/ysyx/ysyx-workbench/abstract-machine
export NVBOARD_HOME=/home/ysyx/ysyx-workbench/nvboard
cd /home/ysyx/ysyx-workbench/am-kernels/kernels/hello
make ARCH=minirv-ysyxsoc run
make ARCH=minirv-ysyxsoc run NVBOARD=1
```

默认模式生成npc/build/soc/sim，NVBOARD=1生成npc/build/soc-nvboard/sim，并自动生成引脚绑定、构建及链接NVBoard库。NVBoard模式成功结束后保留窗口，关闭窗口退出；验收看两端的loader/Hello/参数及GOOD TRAP，不能只凭关窗退出码判通过。批量功能回归使用默认命令行模式，具体清单见测试索引。

SoC TRM在main前设置DLAB、DLL/DLM和8N1；putch等待LSR bit5再写THR，main返回后等LSR bit6再halt。UART除数13沿用课程loader，与标称115200有误差；NVBoard按每位208次更新匹配实际发送节奏。


E5/E6/E7和WSL中的旧npc/e4已清理，独立E:/ysyx/e/e4备份保留。

当前保留的 `npc/Makefile` 是旧NVBoard入口，仍有原环境路径和历史约束，不将其当作本轮已验证入口。

## 验证边界

2026-11-01在WSL实际验证：通用检查库最终10项检查通过；普通手写功能4项、边界14项在默认随机和固定一拍配置均通过；两种配置的手写DiffTest均23/23通过；三个程序的NPC/独立EMU/DiffTest三方验收通过；add/lw/sb提交沿自动波形检查通过。

独立NPC的dummy与hello普通检查及DiffTest通过。hello为30467条指令、546583周期、IPC=0.055741；这不是SoC hello结果。测试架构重构的最终验收已重新跑完整AM cpu-tests（35项正常通过、wrong预期失败）与RV32I（38/38），主/辅助计数和内存范围与基线一致；本次文档整理与发布没有重新运行这些测试。archbench和综合未重跑，旧结果仍按学习记录中的版本和配置理解。自动波形检查不代表本人已亲自阅读。

2026-11-01—02用户在WSL完成SoC程序及NVBoard正常/故障对照：完整SoC cpu-tests与RV32I属于TRM拆分前的验收；拆分后助手另运行SoC hello、独立NPC hello普通/DiffTest，用户继续完成UART和NVBoard故障恢复。正常与故障截图在verification/2026-11-02，恢复208按用户报告及源码/构建状态记录。本轮同步发布未重跑lint、仿真、DiffTest或波形，不把历史成绩当作发布时的新验收。SoC逐条DiffTest尚未接入。

本仓库保存CPU、参考模型、AM、测试程序及课程SoC源码，保留各依赖的许可证。大型benchmark数据、媒体与工具生成的资源遵循依赖自身的获取/生成流程，不将本机所有数据集强行加入提交。`.git`、build、缓存、原始波形、ECC/PDK安装目录和本机学习计划不提交。同步不等于在Windows重新验证。
