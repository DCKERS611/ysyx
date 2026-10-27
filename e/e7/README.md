# E7：简易总线和 SoC

开发目录是 WSL Ubuntu-22.04 的 `/home/ysyx/ysyx-workbench`，这里是同步到 Windows 的副本。同步不包含 `.git` 和各级 `build/`，运行仍在 WSL 中进行。

目前做到了固定延迟的 SimpleBus：取指两拍，load 三拍，store 在提交拍写一次。DiffTest 按 `commit` 比较，已检查 load 时序、字节写掩码，并做过错误注入和恢复。

当前 hello：30467 条指令、72249 个周期，IPC 约 0.421694。word_memory 和 byte_memory 的普通期望测试、DiffTest 通过。完整回归和这一版的 archbench 跑分还没补齐，不能拿 E6 的成绩当作当前成绩。

- [学习记录](E7学习记录.md)：实际改动、测试、读波形和排错过程。
- `npc/`、`minirvEMU/`：处理器、仿真驱动、DiffTest 和参考模型。
- `abstract-machine/`、`am-kernels/`、`riscv-tests/`、`archbench/`、`nvboard/`：运行时和测试依赖。
- `verification/2026-10-27/`：同步时的检查输出和手工读波形截图。

下一步是给 IFU/LSU 增加请求有效和回复有效信号，再测试固定多拍延迟和随机延迟。ysyxSoC 还没下载。

学习计划保留在本机，不提交。ECC、PDK、编译产物和原始波形也不提交；课程依赖保留各自的许可证。现有 Makefile 中还有 WSL 路径和环境变量，Windows 副本不是可以直接在 PowerShell 编译的工程。
