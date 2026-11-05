# E7：SimpleBus、SoC、GPIO与CSR计时

正式开发环境是 WSL Ubuntu-22.04，源码位于 `/home/ysyx/ysyx-workbench`。本目录是 Windows 副本。2026-11-05按原相对路径核对并同步源码、ECC工程/runs和测试证据；完整文件、链接及排除清单见 `verification/2026-11-05/sync-audit/`。以本次Git提交记录确认发布版本；同步期间未重新编译、仿真或运行DiffTest，也没有Windows功能复测。此前1184等数字只表示当时选取的子集。

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
- GPIO已有LED读写、拨码读取、八位数码管译码；用户验证了流水灯、读回、密码锁和10023589显示。整字使用，PSTRB未处理，数码管未加读回。
- 独立CSR模块已接入mcycle/minstret及高低位、mvendorid/marchid常量读取；hello.c当前已恢复普通Hello，新增CSR/ID测试另存hello-csr-id.c.bak。
- AM计时当前为高-低-高读取mcycle后除以25（25MHz口径）；11月3日乘17782右移16属于旧校准尝试。当前CPU正式结果为BALANCE 3、100MHz约束、综合估计141MHz；k=1/k=5的blockchain及比例校准已完成，当前源码保留k=1、/25。
- Hello整体统计包含loader：746454条、155534601周期、IPC=0.004799；新增CSR尚未接入现有DiffTest；当前只实现读路径，非零rs1写语义和无效地址拒绝未实现。

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

测试库的分层、输入输出和期望语义见 [npc/tests/README.md](npc/tests/README.md)。实际验证记录见 [E7学习记录.md](E7学习记录.md) 第十九节及后续学习条目；阶段级命令见 [测试与构建入口索引](../测试与构建入口索引.md) 的E7部分。

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

独立NPC的dummy与hello普通检查及DiffTest通过。hello为30467条指令、546583周期、IPC=0.055741；这不是SoC hello结果。测试架构重构的最终验收已重新跑完整AM cpu-tests（35项正常通过、wrong预期失败）与RV32I（38/38），主/辅助计数和内存范围与基线一致；2026-11-01该轮文档整理发布没有重新运行这些测试。archbench和综合未重跑，旧结果仍按学习记录中的版本和配置理解。自动波形检查不代表本人已亲自阅读。

2026-11-01—02用户在WSL完成SoC程序及NVBoard正常/故障对照：完整SoC cpu-tests与RV32I属于TRM拆分前的验收；拆分后助手另运行SoC hello、独立NPC hello普通/DiffTest，用户继续完成UART和NVBoard故障恢复。正常与故障截图在verification/2026-11-02，恢复208按用户报告及源码/构建状态记录。上述2026-11-02发布整理未重跑lint、仿真、DiffTest或波形，不把历史成绩当作后续版本的新验收。SoC逐条DiffTest尚未接入。

本仓库保存CPU、参考模型、AM、测试程序及课程SoC源码，保留各依赖的许可证和原始资源路径。源码同步不按扩展名筛选；测试报告、日志、波形、输入镜像等保留WSL原位置，verification可另存副本。嵌套`.git`、编译中间件/可执行文件、缓存、工具安装包、PDK和本机学习计划不提交。具体排除项见同步清单；不再笼统排除整个build或ecc。同步不等于在Windows重新验证。


## 当日替换代码与计时入口

备份与恢复说明见 [backups/2026-11-03-gpio-csr-timer/README.md](backups/2026-11-03-gpio-csr-timer/README.md)，来源和哈希见同目录manifest.json。当前hello已恢复普通Hello，以完整字符及GOOD TRAP验收；最新CSR/ID程序另存am-kernels/kernels/hello/hello-csr-id.c.bak，GPIO及昨晚计数程序仍在历史备份中。恢复任一变体前须保留当前代码。

AM计时测试在WSL的am-kernels/tests/am-tests中运行：

    make ARCH=minirv-ysyxsoc run mainargs=t NVBOARD=1

测试无限输出秒数，用Ctrl+C结束，不等待GOOD TRAP。rtc.c已扣除测试开始前时间，日期仍是占位值。真实25MHz应使用/25，仿真校准不能当成真实硬件频率或性能指标。2026-11-04当前源码已改为/25；旧校准误差未收敛，不把它记录为新频率或精确计时验收。

2026-11-03的备份发布属于历史；2026-11-04仅同步与文档整理，没有重跑测试、提交或推送。CSR高位进位、精确计数、CSR DiffTest及进一步校准未验收。

## 2026-11-04：IPC、局部波形及综合准备

soc_main.cpp在停止时输出instructions/cycles/IPC，范围从复位结束到停止，包含loader。FST仅从首次进入PSRAM开始记录20000个时间步（约10000拍），不是整个启动过程。用户已亲自观察UART sb的请求/回复/提交；本次从既有FST只读复核，取指采样到回复采样75拍，之后4拍，总计79拍。原手算29拍因漏完整时间前缀和混淆边沿而错误，详见学习记录第三十一节；单条值不代表全程序平均。

生成与打开当前自编SoC Hello波形，在WSL执行：

    cd /home/ysyx/ysyx-workbench/npc
    make -f Makefile.soc wave PROGRAM=/home/ysyx/ysyx-workbench/am-kernels/kernels/hello/build/hello-minirv-ysyxsoc.bin
    gtkwave /home/ysyx/ysyx-workbench/npc/build/soc/soc.fst

必须使用带loader的minirv-ysyxsoc镜像，不能用minirv-npc.bin。等待仿真正常结束、FST关闭后打开；0字节不是有效波形。波形时钟刻度用于数拍，不能作为真实芯片频率。

旧工程原路径为ecc/npc；当前工程原路径为ecc/npc-e7，与WSL保持一致。原synthesis/ecc-*错位副本已移至verification/2026-11-05/sync-audit/previous-wrong-layout供追溯。e7-syn-sta-01综合成功，报告141MHz、10122.28μm²。单项blockchain及双时钟对照已完成，见学习记录第三十二节。仅综合CPU，未综合整个SoC。

三路审计后的清单与阶段状态已统一：基本功能、严格讲义差异、未实现语义和未验证项目分别记录。最新接续以学习计划顶部/第12节及学习记录第三十二至三十四节为准，不用旧日期的当前快照覆盖今日状态。

当前双时钟：cpu_clock_ratio为1、timer /25；k=5验证时使用125MHz和/125，外设均按25MHz。NVBoard每个外设上升沿更新一次，复位覆盖100个外设周期。两档train计分时间分别76.161768/75.514772秒，均1 Mark；源日志留在WSL /tmp/e7-blockchian-k1-train.log及-k5-train.log。改变倍率时必须同步更改时间换算，不能用旧镜像冒充已重编译程序。面积策略对照已完成，保留BALANCE 3；当前独立NPC普通Hello通过，CSR DiffTest尚未适配。


2026-11-05约束诊断：保持BALANCE 3和RTL不变，使用ecc run --project /home/ysyx/ysyx-workbench/ecc/npc-e7 --run-id diagnostic-balance-200mhz-20261105 --set design.frequency_mhz=200.0（环境YOSYS_SYNTH_STRATEGY="BALANCE 3"）单独运行成功，综合估计254MHz、10176.32μm²。正式成绩保留BALANCE 3、100MHz约束、综合估计141MHz、10122.28μm²。均非P&R或硅上结果，诊断不更改正式配置和仿真倍率。原始运行证据在ecc/npc-e7/runs/diagnostic-balance-200mhz-20261105；verification/2026-11-05/synthesis-constraint-diagnostic仅为附加副本，分析见学习记录第三十四节。


## 源码同步与目录约定

WSL `/home/ysyx/ysyx-workbench/<相对路径>` 对应 Windows `E:/ysyx/e/e7/<相对路径>`。ECC工程及各次运行保留 `ecc/<工程>/runs/<run-id>/` 原结构，包括origin、config、home、日志、网表和报告；不再改名到synthesis。`ecc-smoke`、NEMU和FCEUX同样保留原相对路径，保存不表示它们是本轮E7新增验收。

测试成果在原位置同步，`verification/`用于附加证据和审计，不替代原目录。两个根文件有明确例外：本README用于Windows学习导航，`.gitignore`用于Windows仓库发布；WSL同名原件保存到 `verification/2026-11-05/sync-audit/wsl-workbench-root/`。其余镜像文件按SHA-256核对，原符号链接保持链接类型，空目录列表也记在清单中（Git本身不存空目录）。

在Windows PowerShell中执行现有同步工具：

```powershell
# 默认仅审计；加-Apply才同步并核验原生符号链接。
& E:/ysyx/e/e7/tools/sync_wsl_snapshot.ps1
& E:/ysyx/e/e7/tools/sync_wsl_snapshot.ps1 -Apply
```

工具只复制到E7副本，保留WSL源和Windows独有学习资料，不做普遍删除，不编译或运行程序。ECC二进制、`ecc/_internal`、安装压缩包和`icsprout55-pdk`不属于源码/成果范围。build中保留报告和测试输入，排除obj_dir、对象文件、静态库、ELF可执行程序、PID等生成项。Git收录按清单选取；依赖自带忽略规则不能代替同步审计。新增源文件时无需补扩展名白名单。
