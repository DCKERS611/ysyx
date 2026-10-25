# E6：简易运行时环境（NPC 综合改造前的源码快照）

对应一生一芯 26.07 E6。正式开发目录是 Ubuntu-22.04 的 `/home/ysyx/ysyx-workbench`；本目录是同步到 Windows 的独立副本，不会自动与 WSL 互相更新。

## 保存内容

- `npc/`：minirv CPU、DPI-C 仿真、UART/时钟、DiffTest 与测试工具。
- `minirvEMU/`：独立参考模型，PC/程序内存基址 `0x80000000`。
- `abstract-machine/`：AM 运行时、NPC 平台及 klib 源码。
- `am-kernels/`、`riscv-tests/`、`archbench/`：测试和 benchmark 源码。
- `fceux-am/`、`nemu/`、`nvboard/`：现有课程依赖源码；各项目沿用原有 LICENSE。
- `learning/` 与 `npc/csrc/check.h` 等：原有 Windows 学习副本和检查库草稿；不是当前 E6 运行入口。
- `E6学习记录.md`：分阶段学习、排错和验证记录。
- `verification/archbench-2026-10-25.md`：现有 archbench 日志的结果摘录，非本次重新运行。

## 当前边界

NPC 仍通过 IFU/LSU 内的 DPI-C 访问 C++ 内存，top 内仍有 ebreak 回调，尚未进行 NPC 可综合接口改造。ECC 环境和流水灯练习不代表 NPC 已完成综合。

当前同步的代码按 100 MHz 把仿真周期换算为微秒；普通仿真预算为 50000000000 周期，DiffTest 预算为 10000000 步。此前日志的预算或频率不一定与当前源码一致，不能把旧跑分当成本版本的重新测量。

## 使用方式

在正式 WSL workbench 中运行，例如：

```bash
cd ~/ysyx-workbench/am-kernels/tests/cpu-tests
make ARCH=minirv-npc run ALL=dummy
make ARCH=minirv-npc run DIFFTEST=1 ALL=dummy
```

源码中保留现有 WSL 路径；克隆到其他位置时需检查 AM_HOME、NPC_HOME 和 `abstract-machine/scripts/platform/npc.mk` 中的运行路径。

构建产物、参考模型可执行程序、波形、Git 元数据、ECC/PDK/OSS CAD Suite 安装包和运行目录不提交。archbench 随源码提供必要的 test/train 和部分 ref 输入（其中 .bin 是官方测试数据，不是本次编译产物）；超大 huge 输入和 bad-apple 视频仍保留在本机，不上传。正式 WSL 所用的预编译 `abstract-machine/klib/build/klib-minirv-npc.a` 仍保留在本机，按讲义另行获取，不把二进制库放入源码仓库。

2026-10-25 本次仅同步与提交，逐文件 SHA-256 校验；未重新编译、运行回归或综合 NPC。
