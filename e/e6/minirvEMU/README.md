# minirvEMU

独立模拟器和 NPC DiffTest 共用 emu.cpp，不再维护另一份参考模型。

- emu.h：CPUState 和 Emulator 接口。
- emu.cpp：独立内存、译码、单步执行，不打印。
- main.cpp：独立运行入口，负责输出和退出码。

```bash
make lint
make sim
make sim PROGRAM=../npc/build/difftest/programs/difftest/medium.bin
./build/minirvEMU program.bin
```

默认程序由 NPC 的 tests/gen_program.py 生成。
支持8条 minirv 指令和完整编码匹配的 ebreak。
reset 保留已装载的内存，清除 PC/GPR/结束状态；
load_program 清空整块内存再装载小端原始 bin。

本次统一约定：EMU 执行 ebreak 后 PC 保留在该指令处。
NPC 则在上升沿照常更新 PC，因此 DiffTest 在 halt 当步仅比较前PC。
