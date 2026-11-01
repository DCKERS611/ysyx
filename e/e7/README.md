# E7：SimpleBus、SoC 接入与测试库

正式开发环境是 WSL Ubuntu-22.04，源码位于 `/home/ysyx/ysyx-workbench`。本目录是供 Git 审阅的 Windows 副本；2026-11-01 已从 WSL 同步，运行及验证仍在 WSL 中进行。

## 当前实现与停点

- CPU 顶层为 `npc/vsrc/ysyx_00000000.v`，临时编号统一使用00000000，内部模块也使用相同前缀。
- IFU 保存指令，LSU 保存访存任务，通过 start/done 连接；请求与回复走 SimpleBus，等待期间不提交。
- CPU 对外端口已对齐 `io_ifu_*`、`io_lsu_*`，包含2位size；调试信号保留在CPU内部。
- SoC 的 `ysyxSoC/ready-to-run/minirv/ElaborateTop.v` 实例化该CPU，并以参数覆盖复位地址为 `0x30000000`。独立NPC默认复位到 `0x80000000`。
- 阶段e曾由用户运行，已触发Flash桩函数断言，证明请求到达Flash模型。
- 阶段f正在实现Flash镜像加载与读取。**SoC hello尚未验收**；当前代码是学习中的工作版本，不把构建成功或达到周期预算当作hello通过。

## 先看这些代码

| 内容 | 入口 |
|---|---|
| CPU 顶层与各模块 | `npc/vsrc/` |
| 通用检查库，复用已有实现 | `npc/csrc/check.h` |
| 旧TestSuite兼容入口 | `npc/csrc/test_suite.h` |
| 独立CPU内部状态观察接口 | `npc/csrc/cpu_view.h` |
| 独立NPC时钟、总线模型与波形 | `npc/csrc/sim.cpp` |
| 逐条DiffTest | `npc/csrc/difftest.cpp` |
| 独立参考模型 | `minirvEMU/emu.cpp` |
| 手写期望与调度 | `npc/tests/expectations.h`、`npc/tests/run_cpu_tests.py` |
| SoC驱动、Flash加载与读取 | `npc/csrc/soc_main.cpp` |
| SoC构建入口 | `npc/Makefile.soc` |

测试库的分层、输入输出和期望语义见 [npc/tests/README.md](npc/tests/README.md)。实际验证记录见 [E7学习记录.md](E7学习记录.md) 第十七节；阶段级命令见 [测试与构建入口索引](../测试与构建入口索引.md) 的E7部分。

## 在 WSL 运行

需要现有的 Verilator、C++17编译器、GNU Make、Python3；波形转换需要fst2vcd，人工查看使用GTKWave。AM程序编译还需要原环境的RISC-V工具链和AM相关环境变量。

在正式源码中执行：

```bash
cd /home/ysyx/ysyx-workbench/npc
make -f Makefile.cpptest lint
make -f Makefile.cpptest test-library
make -f Makefile.cpptest test-all
make -f Makefile.diff difftest
make -f Makefile.cpptest test-fixed
make -f Makefile.diff difftest-fixed
make -f Makefile.cpptest check-waves
```

默认 `NPC_MEM_DELAY=0` 使用原有LFSR、初值0xACE1，每笔请求随机回复1～20拍；设为1～20则使用对应固定延迟，无需改源码重编译。IFU与LSU的请求随机参数RANDOM_REQ默认均为0，开启请求侧压力测试时两处都要修改。

SoC使用独立驱动，不与独立NPC的随机回复模型混用：

```bash
make -f Makefile.soc build
make -f Makefile.soc run
make -f Makefile.soc wave
```

驱动当前从npc工作目录读取课程提供的hello镜像；波形参数与周期上限以 `soc_main.cpp` 当前实现为准。断言中止可能使FST未完整关闭，生成文件不等于有效波形或检查通过。

当前保留的 `npc/Makefile` 是旧NVBoard入口，仍有原环境路径和历史约束，不将其当作本轮已验证入口。

## 验证边界

2026-11-01在WSL实际验证：通用检查库最终10项检查通过；普通手写功能4项、边界14项在默认随机和固定一拍配置均通过；两种配置的手写DiffTest均23/23通过；三个程序的NPC/独立EMU/DiffTest三方验收通过；add/lw/sb提交沿自动波形检查通过。

独立NPC的dummy与hello普通检查及DiffTest通过。hello为30467条指令、546583周期、IPC=0.055741；这不是SoC hello结果。本轮未重跑完整AM cpu-tests、完整RV32I、archbench或综合，旧结果仍按学习记录中的版本和配置理解。自动波形检查不代表本人已亲自阅读。

本仓库保存CPU、参考模型、AM、测试程序及课程SoC源码，保留各依赖的许可证。大型benchmark数据、媒体与工具生成的资源遵循依赖自身的获取/生成流程，不将本机所有数据集强行加入提交。`.git`、build、缓存、原始波形、ECC/PDK安装目录和本机学习计划不提交。同步不等于在Windows重新验证。
