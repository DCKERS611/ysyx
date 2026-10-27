# 2026-10-27 检查和截图

同步时重新运行了 RTL lint、word_memory 和 byte_memory 的普通期望测试及 DiffTest、hello 普通运行及 DiffTest，7 项入口都正常退出。输出保存在同名 txt 文件，退出码见 checks.json。

hello 当前输出为 30467 条指令、72249 周期、IPC=0.421694。完整回归、riscv-tests/cpu-tests 全套和当前版本的 archbench 未在这次同步中运行。

source-sha256.txt 是 WSL 源文件与 Windows 副本逐文件校验后的清单，排除了各级 .git 和 build。E7 本地文档、仓库忽略规则和本目录是单独整理的，不属于 WSL 原工程。

| 文件 | 内容 |
|---|---|
| [01-ifu-two-cycle.png](01-ifu-two-cycle.png) | 正确的两拍取指 |
| [02-ifu-early-pc-error.png](02-ifu-early-pc-error.png) | 注入错误后，等待拍 PC 提前更新 |
| [03-load-three-cycle.png](03-load-three-cycle.png) | hello 中 load 请求、返回与提交 |
| [04-sb-byte-mask.png](04-sb-byte-mask.png) | 非零字节写入的移位与掩码 |
| [05-load-early-write-error.png](05-load-early-write-error.png) | commit=0 时 GPR 写使能错误拉高 |
| [06-load-write-restored.png](06-load-write-restored.png) | 恢复后仅在提交拍写回 |

截图来自这轮实际操作，包含错误注入的历史状态；当前源码已经恢复，不能把错误截图当成当前电路仍有该错误。

## 主要复验命令

在 WSL 的 ysyx-workbench/npc 中执行：

```bash
make -f Makefile.cpptest lint build/regress/cpu_test build/difftest/difftest
python3 tests/run_cpu_tests.py --group functional --case word_memory --runner build/regress/cpu_test
python3 tests/run_cpu_tests.py --group functional --case word_memory --runner build/difftest/difftest
python3 tests/run_cpu_tests.py --group functional --case byte_memory --runner build/regress/cpu_test
python3 tests/run_cpu_tests.py --group functional --case byte_memory --runner build/difftest/difftest
```

在 am-kernels/kernels/hello 中执行：

```bash
make ARCH=minirv-npc run
make ARCH=minirv-npc DIFFTEST=1 run
```
