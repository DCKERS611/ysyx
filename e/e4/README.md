# E4：处理器的仿真和验证

学习过程与验收结果见 [E4学习记录.md](E4学习记录.md)。E4 文件现已集中在 `E:\ysyx\e\e4`，WSL 中对应 `/mnt/e/ysyx/e/e4`。原来的 `~/e4` 和 `~/ysyx-workbench/npc` 是指向这里的链接。编译产物保留在本地，不提交仓库。

## 目录

| 目录 | 内容 |
|---|---|
| `npc` | 增强版 sCPU、sEMU、DiffTest 和 NVBoard 入口 |
| `NJU_exp/exp2` | 译码器、编码器和优先编码器 |
| `NJU_exp/exp3` | 全加器、加减法器和 ALU |
| `NJU_exp/exp6` | 移位寄存器、桶形移位器、LFSR 和数码管译码器 |
| `NJU_exp/exp7` | 状态机与 PS/2 键盘 |
| `NJU_exp/exp8` | VGA 控制器、图像 ROM；`ball` 为弹性碰撞选做 |
| `common` | Reg、MuxKey、Rom 模板 |
| `equiv_light` | 流水灯逐拍等价验证源码 |
| `ex02`、`npc/examples` | 早期练习源码 |

## sEMU 和 DiffTest

在 Linux/WSL 中安装 g++、make 和 Verilator 后，从本目录运行：

```bash
cd npc
make -f Makefile.test test
```

正常输出 `PASS: 6` 和 `PASS: 300`。也可以分别使用 `semu`、`difftest` 目标。修改源文件后会自动重新构建。

当前测试使用固定求和程序，逐条检查 PC、四个 GPR 和 LED，尚未穷举全部指令和设备输入。`test/scpu_fetch.cpp` 是早期取指练习，不用于带跳转的完整处理器验收。

NVBoard 运行使用 `npc/Makefile` 的 `make run`，需要安装 NVBoard、SDL 依赖，并配置 `NVBOARD_HOME`、`NPC_HOME`。`WORKBENCH_HOME` 默认是 `$(HOME)/ysyx-workbench`，用于加载框架 Makefile；框架放在其他位置时，可运行 `make WORKBENCH_HOME=/实际路径/ysyx-workbench run`。`NPC_HOME` 当前为 `/mnt/e/ysyx/e/e4/npc`。仓库不包含完整的 workbench 框架。

## 数字电路实验

在 `exp3`、`exp6`、`exp7`、`exp8` 或 `exp8/ball` 中运行 `make sim`。其中实验六的 `main.cpp` 测试对象是 `decoder`，LFSR 上板顶层使用单独的 `Makefile.board`。

实验二的 Makefile 直接构建 NVBoard；其他实验上板使用 `make -f Makefile.board board`，并配置 `NVBOARD_HOME`。VGA 需要从实验八目录运行，ROM 初始化数据为 `imgs/mem.hex`。

2026-10-13 同步后重新验证：ALU 2048 项、数码管译码 16 项、PS/2 338 项、VGA 420000 项、弹性碰撞 80000 项全部通过。更早的流水灯等价验证结果与错误注入过程见学习记录。

迁移前的原目录备份保存在本地 `E:\ysyx\backups\e4-before-migration-20261013.tar.gz`。迁移时发现的两个旧草稿改名放在 `migration_notes/`，不参与构建。
