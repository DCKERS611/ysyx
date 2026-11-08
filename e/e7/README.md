# E7：SimpleBus、SoC、GPIO与CSR计时

2026-11-08 的最新进度见 [学习记录 §51–55](E7学习记录.md#五十一p1-工程缺口实施与验收2026-11-08)。P1 的 SoC DiffTest、完整 128 MiB 比较优化和总线监视均已通过集成验收。RTC 保留原均值判据并新增逐间隔统计，k=12 同镜像第三轮待补。

个人复验已完成 NVBoard 串口的正常、故障和恢复，GPIO 三项演示和字节访问，以及 `marchid` 提交沿。CSR 波形和日志在 [原位置](npc/build/verification/csr-marchid-review/)。SoC 全量 test 为 20/20，用户启动的全量 train 截至本次核对已有 19 项通过，`202.llama2` 仍在运行。

本轮发布的源码和证据按 WSL 原相对路径归档，见 [发布同步清单](verification/2026-11-08/release-sync/sync-manifest.json)。

正式开发环境是 WSL Ubuntu-22.04，源码位于 `/home/ysyx/ysyx-workbench`。本目录是 Windows 副本。2026-11-05按原相对路径核对并同步源码、ECC工程/runs和测试证据；完整文件、链接及排除清单见 `verification/2026-11-05/sync-audit/`。以本次Git提交记录确认发布版本；同步期间未重新编译、仿真或运行DiffTest，也没有Windows功能复测。此前1184等数字只表示当时选取的子集。


## 2026-11-07：首轮已完成部分同步

已按原相对路径从WSL正式工作台同步本次明确范围的921个文件，逐文件SHA-256一致。包括CSR/时钟比例源码、两份预编译klib、GPIO字节写与数码管读回、两拍行为重建及20项train结果、SoC全量test 20/20结果、回归和现有综合证据。范围与排除清单见[同步清单](verification/2026-11-07/completed-sync/sync-manifest.json)，这是指定范围同步，不代表整个工作台全量同步。

RTC源码是当前工作版本；11-07 的 `rtc-k12-cache-phase-20261107` 已完成 k=12 完整 printf 墙钟验收（Q16=6929，两次独立运行 0.9676/0.9941 秒，最大迟到 137474µs），证据已按原路径同步。未复制编译对象、可执行程序、缓存及锁文件；两拍波形保留原 FST，105MiB 派生 VCD 不重复复制。Windows独有学习资料、README和本地计划保留。此次没有重新运行测试，也没有提交或推送Git。
## 2026-11-06 当前运行入口（§39–44）

正式执行环境为WSL Ubuntu-22.04的`/home/ysyx/ysyx-workbench`。SoC驱动`npc/tests/soc_main.cpp`从`NPC_CPU_CLOCK_RATIO`读取k，默认12，基线显式设1；外设按25MHz，CPU分别25/300MHz。同一仿真器可以选择两档，但AM镜像必须分别以`NPC_CPU_FREQ_MHZ=25/300`构建，不能只切运行k而复用错误频率镜像。

在工作台`am-kernels/kernels/hello`目录运行（先设置AM_HOME；默认不启用NVBoard）：

```bash
export AM_HOME=/home/ysyx/ysyx-workbench/abstract-machine
NPC_CPU_CLOCK_RATIO=1 make ARCH=minirv-ysyxsoc NPC_CPU_FREQ_MHZ=25 NPC_TIMER_CALIBRATION_Q16=0 run
NPC_CPU_CLOCK_RATIO=12 make ARCH=minirv-ysyxsoc NPC_CPU_FREQ_MHZ=300 NPC_TIMER_CALIBRATION_Q16=0 run
```

AM的`NPC_TIMER_CALIBRATION_Q16`默认0，按实际配置的MHz换算mcycle；非零Q16只用于RTC墙钟演示，不能用于性能跑分。`abstract-machine/scripts/platform/npc.mk`的配置戳只驱动明确路径的timer.o，`npc/tests/soc-timing/Makefile`另让main.o依赖参数戳，避免参数未生效或重编klib源码桩。

在工作台`npc`运行`make -f Makefile.cpptest regress`及`make -f Makefile.diff difftest-csr difftest-csr-fixed`。SoC仍用`Makefile.soc`；测试清单与适用范围见共用测试索引E7部分。

RTC独立演示在工作台`npc/tests/soc-timing`运行`python3 calibrate_wallclock.py`。默认每档最多4轮、两档串行，必须同系数连续两次独立运行的10间隔均值均落在1秒±5%，且目标未漏过下一整秒。默认初值k1=18325、k12=7754，可用`NPC_RTC_INITIAL_Q16_K1/K12`覆盖；默认生成时间戳结果目录，可用`NPC_RTC_CALIBRATION_OUTPUT_DIR`指定新目录，拒绝覆盖旧证据，needs_review返回非零。`measure_host.py`同时识别旧RTC_TICK和4字节T01格式。

最终演示证据：`npc/build/verification/rtc-wallclock-compact-20261106`，两档各两次平均间隔通过；k12单间隔约0.81～1.68秒，所以不保证逐秒稳定，也未替代完整printf RTC。当前RTLblockchain计分76.161768/75.514772秒，改善0.8495%，均使用Q16=0；原镜像和配置在`current-csr-k12-20261105`，不重写旧错误标签日志。

预编译klib是当前构建输入：`abstract-machine/klib/build/klib-minirv-npc.a`与`klib-minirv-ysyxsoc.a`按原路径保留、同步和提交；minirv默认`NPC_USE_PREBUILT_KLIB=1`，缺库即报错，clean保留。只有实现源码后才显式选0进行源码构建；保留库不代表源码桩已经实现。其他.a仍按生成物排除。

本次最终验收的实际命令、日志及退出码见`npc/build/verification/final-acceptance-20261106`；§46记录四问与清单复核。学习计划仍为本地资料，不随代码发布。

## 历史实现与停点（以各条日期为准）

2026-11-05完成回报：当前RTL k=1/k=12 blockchain均PASS和GOOD TRAP，计分76.161768/75.514772秒，缩短0.8495%；运行k由NPC_CPU_CLOCK_RATIO选择。RTC主机间隔8.689069/42.809146秒，墙钟一秒未达标。k12 RTC打印标签25属于应用对象缓存错误；从冻结镜像反汇编已确认两档实际timer除数25/300，跑分有效。已用全对象配置戳修复参数缓存；独立RTC墙钟演示校准待反馈，见记录第四十节。

2026-11-05当前：CSR读抑制修正后400/800MHz BALANCE 3均估计306MHz，网表相同；k=12（CPU300MHz）定案，k由环境变量NPC_CPU_CLOCK_RATIO选择、默认12，基线显式设1。镜像分别用NPC_CPU_FREQ_MHZ=25/300编译并独立保存，AM中间目录串行复用且timer切档重编。普通/NVBoard Hello与12:1自动波形检查通过；CSR参考执行、11例两档CSR DiffTest、真实AM CSR-ID DiffTest及78例含访存等待计数检查通过。当前两档RTC墙钟采样/新blockchain及最终墙钟校准未作完成验收，旧性能表仅历史。详见学习记录第三十九节及npc/build/verification/current-csr-k12-20261105/run-configs.json。

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
- AM默认uptime按NPC_CPU_FREQ_MHZ换算；SoC默认300MHz，基线25MHz，运行k由NPC_CPU_CLOCK_RATIO选择12或1。墙钟演示系数NPC_TIMER_CALIBRATION_Q16默认0，不用于跑分。当前BALANCE代表档306MHz，见记录第三十九节。
- 当前SoC普通/NVBoard Hello均747870条、1859353315周期、IPC0.000402（k=12，K12_VALIDATE）；CSR参考执行/DiffTest及含访存等待的78例逐沿检查已通过。

## 先看这些代码

| 内容 | 入口 |
|---|---|
| CPU 顶层与各模块 | `npc/vsrc/` |
| 通用检查库，复用已有实现 | `npc/csrc/check.h` |
| 总线协议监视器（SimpleBus握手判据） | `npc/csrc/bus_monitor.h`；单元测试 `npc/tests/bus_monitor_test.cpp` |
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

`regress` 现在包含总线协议监视：单独入口是 `make -f Makefile.cpptest test-bus-monitor`（15项单元检查）。每次运行结束后打印 `Bus: PASS/FAIL ifu_req=... lsu_req=... violations=N`，RESULT 行追加 `bus=pass|fail`；出现违例时该次运行判失败。监视器只观察握手，不改变"等待期重复请求被忽略"的既有行为。

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

### SoC 逐条 DiffTest（v1）

在 WSL 的 `/home/ysyx/ysyx-workbench/npc` 构建 `make -f Makefile.soc build`。将与 Flash 镜像完全对应的应用 ELF 转成 raw，再用 `NPC_SOC_REF` 启用参考模型。当前 `gen.sh` 把应用 ELF 放在 Flash 文件的字节偏移 369152，`insert-arg` 会直接修改 Flash 内的 ELF 数据，因此从待测 Flash 提取可以保留实际的参数。

```bash
cd /home/ysyx/ysyx-workbench/npc
mkdir -p build/verification/soc-difftest
flash=../am-kernels/kernels/hello/build/hello-minirv-ysyxsoc.bin
tail -c +369153 "$flash" > build/verification/soc-difftest/hello.elf
riscv64-linux-gnu-objcopy -O binary build/verification/soc-difftest/hello.elf \
  build/verification/soc-difftest/hello-ref.bin
NPC_CPU_CLOCK_RATIO=1 NPC_SOC_REF=build/verification/soc-difftest/hello-ref.bin \
  make -f Makefile.soc run PROGRAM="$flash"
```

`FIRST_PSRAM_COMMIT` 标出 first PSRAM 提交，即首条 PC 在 `[0x80000000, 0x80800000)` 的提交。此处用沿前 GPR 初始化 EMU，跳过 Flash loader 的参考执行。每个 CPU 上升沿前取 PC、指令和提交使能（Verilator 将其折叠为 IFU 的 PC 写使能），沿后比较 GPR、下一 PC 或停机状态。两边停机时比较 `halt_pc`，不再推进 EMU。

参考模型判定的设备读只在本条指令执行后同步 DUT 的非 x0 目的寄存器。普通内存读仍逐条核对。设备地址沿用 EMU 现有 UART 和计时 MMIO 地址窗。SoC 和 EMU 的计数口径不同，v1 不比较 `mcycle`、`minstret` 的数值，对显式读取这两个计数器及其高半部的指令只同步该条读结果，仍核对指令、PC 和其余 GPR。v1 不校验设备返回值本身、不扫描 SoC PSRAM，也不覆盖 loader 的参考执行或异常路径的逐条比对。

启用 DiffTest 后，每次结束输出一行 `RESULT ... backend=socdiff verdict=pass|fail`，并返回 0 或 1。`commits` 为已匹配的应用指令数，`device_reads` 和 `counter_reads` 记录同步次数。实际验证日志在 `npc/build/verification/soc-difftest/`。

设置 `NPC_SOC_BUS=1` 启用 SoC SimpleBus 监视，可与 `NPC_SOC_REF` 同时使用。监视从复位结束开始，包含 loader，并在每个 CPU 上升沿前采样 core0 和 MemBridge 间的取指、数据请求和回复。先处理本沿回复，再判本沿提交。IFU 回复用来关联提交的 PC 和指令，load/store 必须在对应 LSU 请求已收到回复后提交。外设侧时钟经过 CDC，故不按 APB 或外设周期给 CPU 请求配对。违例会使最终 `RESULT` 的 `bus=fail`，即使程序仍到达 GOOD TRAP。日志在 `npc/build/verification/bus-monitor-extension/`。

独立 NPC 的 DiffTest 仍核对完整 128 MiB。小端主机先做全范围字节比较，发现差异后逐字定位。`NPC_DIFF_MEM_TIMING=1` 在逐用例 RESULT 附带内存比较及总耗时，记录见 `npc/build/verification/diff-mem-timing/`。

完整 printf RTC 通过原有 `tests/soc-timing/full-printf/calibrate.py` 入口运行。`NPC_RTC_RUNS` 选择同镜像、同 Q16 的连续通过轮数，默认 2，范围 2～5，`NPC_RTC_MAX_TRIALS` 至少为该值。每轮保存全部 10 个主机间隔、相对 1 秒的偏差、均值、极值及总体标准差。单间隔数据用于诊断，仍按均值 ±5% 和整轮客机迟到小于 1 秒验收。既有 k12 两次证据通过，第三次同镜像观测待补，见 `npc/build/verification/rtc-interval-stability/`。

2026-11-08 的 P1 源码和验收证据共 100 个文件，已从 WSL 按原相对路径同步到此 Windows 副本，SHA-256 一致。清单在 [P1 同步记录](verification/2026-11-08/p1-sync/sync-manifest.json)。实际测试在 WSL 完成。

2026-11-01在WSL实际验证：通用检查库最终10项检查通过；普通手写功能4项、边界14项在默认随机和固定一拍配置均通过；两种配置的手写DiffTest均23/23通过；三个程序的NPC/独立EMU/DiffTest三方验收通过；add/lw/sb提交沿自动波形检查通过。

独立NPC的dummy与hello普通检查及DiffTest通过。hello为30467条指令、546583周期、IPC=0.055741；这不是SoC hello结果。测试架构重构的最终验收已重新跑完整AM cpu-tests（35项正常通过、wrong预期失败）与RV32I（38/38），主/辅助计数和内存范围与基线一致；2026-11-01该轮文档整理发布没有重新运行这些测试。archbench和综合未重跑，旧结果仍按学习记录中的版本和配置理解。自动波形检查不代表本人已亲自阅读。

2026-11-01—02用户在WSL完成SoC程序及NVBoard正常/故障对照：完整SoC cpu-tests与RV32I属于TRM拆分前的验收；拆分后助手另运行SoC hello、独立NPC hello普通/DiffTest，用户继续完成UART和NVBoard故障恢复。正常与故障截图在verification/2026-11-02，恢复208按用户报告及源码/构建状态记录。上述2026-11-02发布整理未重跑lint、仿真、DiffTest或波形，不把历史成绩当作后续版本的新验收。

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

历史k=1/k=5对照：cpu_clock_ratio为1、timer /25；k=5验证时使用125MHz和/125，外设均按25MHz。NVBoard每个外设上升沿更新一次，复位覆盖100个外设周期。两档train计分时间分别76.161768/75.514772秒，均1 Mark；源日志留在WSL /tmp/e7-blockchian-k1-train.log及-k5-train.log。改变倍率时必须同步更改时间换算，不能用旧镜像冒充已重编译程序。面积策略对照已完成，保留BALANCE 3；当前独立NPC普通Hello通过，CSR DiffTest尚未适配。


2026-11-05约束诊断：保持BALANCE 3和RTL不变，使用ecc run --project /home/ysyx/ysyx-workbench/ecc/npc-e7 --run-id diagnostic-balance-200mhz-20261105 --set design.frequency_mhz=200.0（环境YOSYS_SYNTH_STRATEGY="BALANCE 3"）单独运行成功，综合估计254MHz、10176.32μm²。当时成绩保留BALANCE 3、100MHz约束、综合估计141MHz、10122.28μm²；该停点已被后续收敛扫描更新。均非P&R或硅上结果，诊断不更改正式配置和仿真倍率。原始运行证据在ecc/npc-e7/runs/diagnostic-balance-200mhz-20261105；verification/2026-11-05/synthesis-constraint-diagnostic仅为附加副本，分析见学习记录第三十四节。


## 源码同步与目录约定

WSL `/home/ysyx/ysyx-workbench/<相对路径>` 对应 Windows `E:/ysyx/e/e7/<相对路径>`。ECC工程及各次运行保留 `ecc/<工程>/runs/<run-id>/` 原结构，包括origin、config、home、日志、网表和报告；不再改名到synthesis。`ecc-smoke`、NEMU和FCEUX同样保留原相对路径，保存不表示它们是本轮E7新增验收。

测试成果在原位置同步，`verification/`用于附加证据和审计，不替代原目录。两个根文件有明确例外：本README用于Windows学习导航，`.gitignore`用于Windows仓库发布；WSL同名原件保存到 `verification/2026-11-05/sync-audit/wsl-workbench-root/`。其余镜像文件按SHA-256核对，原符号链接保持链接类型，空目录列表也记在清单中（Git本身不存空目录）。

在Windows PowerShell中执行现有同步工具：

```powershell
# 默认仅审计；加-Apply才同步并核验原生符号链接。
& E:/ysyx/e/e7/tools/sync_wsl_snapshot.ps1
& E:/ysyx/e/e7/tools/sync_wsl_snapshot.ps1 -Apply
```

工具只复制到E7副本，保留WSL源和Windows独有学习资料，不做普遍删除，不编译或运行程序。ECC二进制、`ecc/_internal`、安装压缩包和`icsprout55-pdk`不属于源码/成果范围。build中保留报告和测试输入，排除obj_dir、对象文件、ELF可执行程序、PID等生成项；静态库仅上述两份课程预编译klib作为输入保留。Git收录按清单选取；依赖自带忽略规则不能代替同步审计。新增源文件时无需补扩展名白名单。


历史（CSR写语义修改前，后由学习记录第三十八节更新）：2026-11-05收敛结果（取代此前“正式仍141、254仅诊断”的当前停点，旧条目保留历史）：BALANCE 3扫描100/200/400/800MHz约束，FREQ为141/254/255/255MHz；400与800网表完全相同，选择400MHz约束下综合估计255MHz、10211.60μm²、约510.58元为当前代表档。ecc/npc-e7/ecc.toml默认约束已设400MHz；k定为10（CPU250MHz、外设25MHz），驱动仍k=1、timer /25，新档待运行。未做P&R，未证明RTL绝对极限。详见学习记录第三十五节。


历史检查点：2026-11-05 CSR写语义：WSL与本Windows副本已包含六种CSR指令、计数器显式写优先级、只读ID写保护及未知地址拒绝。新增 `npc/tests/csr_test.cpp`，入口 `make -f Makefile.cpptest test-csr`；本次75例通过，默认/固定一拍普通回归均18/18，原有整数DiffTest均23/23，SoC仅重编译通过。没有运行本次SoC Hello、全量AM/ISA或CSR DiffTest；之前综合频率/面积属于修改前RTL。

历史检查点：2026-11-05 CSR四项SoC功能验收已完成：原ID程序GOOD TRAP、置位后高位进位、连续采样差228拍；两个负向PC和commits固定至2亿周期上限。程序、原始日志及反汇编见[npc/tests/csr-functional](npc/tests/csr-functional/README.md)。本次仅为负向验收增加可选环境变量NPC_CONTINUE_ON_REJECT=1与NPC_MAX_CYCLES=200000000；未设置时仍立即报错。先前6622拍的循环读取结果也保留，CSR参考模型尚未适配。

历史检查点：2026-11-05当前RTL综合：同为400MHz约束，BALANCE 3为309MHz、11032.84μm²、WNS -0.733ns、约551.64元；AREA 0为82MHz、10539.76μm²、WNS -9.646ns、约526.99元。AREA省4.47%面积但频率低73.46%，继续选BALANCE。两次运行原路径为ecc/npc-e7/runs/post-csr-{balance,area}-400mhz-20261105-215010；完整报告及快照已保留。旧255MHz属于修改前RTL；没有修改当前k=1、timer /25或重跑性能档。两档均未满足400MHz目标，未做P&R。


RTC校准修复：参数依赖只覆盖timer和RTC应用main.o，不能扩大到未实现源码桩所在的预编译klib。当前依赖的两份klib-minirv-*.a作为明确构建输入保留原路径；源码未实现不等于可从源码重建。首轮失败已归档，当前重试状态沿用rtc-wallclock-calibration-20261105/stage.json，最终校准待验收。详见学习记录第四十一节。


2026-11-06计时构建修复：timer依赖必须使用明确路径$(DST_DIR)/src/riscv/npc/timer.o，不能在AM_SRCS赋值前从OBJS筛选；RTC应用main.o单独依赖参数戳。四项数值短测及SoC构建静态检查通过。minirv klib默认使用明确预编译输入，避免覆盖为源码桩。旧Q16校准轮次均未生效、已归档作废；本轮重试待用户回报，不表示墙钟已验收。详见记录第四十二节。

2026-11-07最终更新：k12完整printf RTC已通过，Q16=6929，两次平均0.967607/0.994096秒；源代码与证据已按原路径同步。Q16仍仅用于墙钟演示。同步发布规则见《同步与推送指导.md》。
