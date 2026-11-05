# string 单例诊断

只修改 WSL npc/tests/soc_main.cpp，增加上升沿前提交计数及每一千万周期的 PC、指令、IFU 状态和 IFU/LSU 握手快照。构建通过。未改 CPU、AM、klib、Makefile、Windows 副本或 Git。

重跑 string，约 1.6 亿周期进入 PSRAM；之后提交数继续增长，PC 样本反复落在 putch() 的 0x800005ec～0x80000720。

源文件 abstract-machine/klib/src/string.c 中 strcmp/strcpy/strcat/memset/memcmp 仍是 panic(Not implemented)；string ELF 的 main 第一次调用 strcmp，strcmp 反汇编直接输出 AM Panic 文本，再调用 putch。AM trm.c 仍轮询 0x10000004 & 1，ELF 与此一致，尚未适配 SoC UART16550。

故本次不通过，继续等待或加大预算不能解决。需要在主线完成相应 klib 实现和 UART16550 适配后重编译镜像并复测。诊断进程设有180秒墙钟上限；定位完成后提前停止（若已到限则保留超时结果）。
