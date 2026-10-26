# E6：简易运行时环境

一生一芯 26.07 E6 的源码、学习记录和验收归档。正式开发目录是 Ubuntu-22.04 的 `/home/ysyx/ysyx-workbench`；本目录是同步到 Windows 的独立副本。

## 2026-10-26 收尾结果

- NPC 取指/数据访存已通过端口接到外部 C++ 内存，IFU/LSU 不再调用 DPI-C；ebreak 用 SYNTHESIS 宏隔离。
- 用户反馈改造后 lint、dummy、ISA/cpu-tests DiffTest、hello 和 FCEUX 字符画面通过；cpu-tests 的 wrong 是预期失败。
- NPC syn_sta 原始报告：404 MHz、标准单元面积 6941 μm²，BALANCE 3、100 MHz 约束；综合源快照与当前 8 个 RTL 文件 SHA-256 一致。
- 当前 `NPC_FREQ_HZ=404000000`；404 MHz archbench train 的 20 项原始日志全部 PASS / GOOD TRAP，几何平均 613、算术平均 1680。
- LLaMA train 已成功生成完整句子，20 Marks、4004974287 周期、a0=0；此前超时记录保留为历史，不再作为最新状态。

- E5/E6 尚未亲自打开并分析波形，列为待补；关键路径 JSON 已归档到 `synthesis/npc/reports/timing_paths.json`。

## 目录

- `npc/`、`minirvEMU/`：CPU、仿真、DiffTest 与参考模型。
- `abstract-machine/`、`am-kernels/`、`riscv-tests/`、`archbench/`：运行时、测试和 benchmark 源码及必要输入。
- `fceux-am/`、`nemu/`、`nvboard/`：课程依赖，各自许可证随源码保留。
- `learning/` 和额外 check 库：Windows 原有学习副本/草稿，不是正式 E6 运行入口。
- `synthesis/`：流水灯与 NPC 的配置、综合源快照和原始报告。
- `verification/2026-10-26/`：当前 archbench 原始日志、验收汇总、归档 SHA-256 清单；`verification/archbench-2026-10-25.md` 是旧快照。
- `E6学习记录.md`：分阶段实验和排错记录，最新结论见第十四节。

## 运行

在正式 WSL workbench 中：

```bash
cd ~/ysyx-workbench/am-kernels/tests/cpu-tests
make ARCH=minirv-npc run ALL=dummy
make ARCH=minirv-npc run DIFFTEST=1 ALL=dummy
```

当前源文件/配置保留 WSL 绝对路径，换位置时需检查 AM_HOME、NPC_HOME、BENCH_HOME、npc.mk 与综合 filelist/PDK 路径。
ECC、OSS CAD Suite、PDK 工具/大库、build/runs、波形不提交；正式环境所需的预编译 `klib-minirv-npc.a` 保留本机并按讲义获取。archbench 中 .bin/.model 等是上游测试输入，不是本轮编译产物；超大 huge 输入和 bad-apple 视频不上传。

E6 主流程已验收；完整 1000 MHz archbench 日志、UART 专项故障注入、DELAY 0 对照和旧 E5 大程序/波形复验仍是可补充项。综合频率不是布局布线后签核频率。本次收尾没有重新运行全部测试。

综合改造前的源码快照保存在 Git 提交 `8b2f013`；当前快照包含用户完成的接口改造。
