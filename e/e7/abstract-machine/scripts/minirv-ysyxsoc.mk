include $(AM_HOME)/scripts/minirv-npc.mk

# 复用其余NPC运行时，仅将TRM切换为ysyxsoc的UART16550实现。
AM_SRCS := $(patsubst riscv/npc/trm.c,riscv/ysyxsoc/trm.c,$(AM_SRCS))

NPC_MAKEFILE := Makefile.soc
NPC_RUN_TARGET := run

image: image-dep
	cd $(AM_HOME)/../ysyxSoC/ready-to-run/minirv && bash gen.sh $(IMAGE).elf $(IMAGE).bin

# 当前BALANCE 3收敛估计306MHz，取25MHz的12倍；命令行可选择25MHz基线。
NPC_CPU_FREQ_MHZ = 300
