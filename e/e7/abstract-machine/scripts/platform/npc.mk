NPC_CPU_FREQ_MHZ ?= 25
NPC_TIMER_CALIBRATION_Q16 ?= 0
CFLAGS += -DNPC_CPU_FREQ_MHZ=$(NPC_CPU_FREQ_MHZ) -DNPC_TIMER_CALIBRATION_Q16=$(NPC_TIMER_CALIBRATION_Q16)
# 参数戳只作用于消费这些参数的对象；保留课程预编译klib。
NPC_TIMER_CONFIG = $(DST_DIR)/.npc-timer-config
.PHONY: npc-timer-config-force
npc-timer-config-force:
$(NPC_TIMER_CONFIG): npc-timer-config-force
	@printf '%s\n' 'freq=$(NPC_CPU_FREQ_MHZ) q16=$(NPC_TIMER_CALIBRATION_Q16)' > "$@.tmp"
	@cmp -s "$@.tmp" "$@" || cp "$@.tmp" "$@"
	@rm -f "$@.tmp"
# 此处AM_SRCS尚未赋值，不能通过OBJS筛选；使用明确的目标路径。
$(DST_DIR)/src/riscv/npc/timer.o: $(NPC_TIMER_CONFIG)

AM_SRCS := riscv/npc/start.S \
           riscv/npc/trm.c \
           riscv/npc/ioe.c \
           riscv/npc/timer.c \
           riscv/npc/input.c \
           riscv/npc/cte.c \
           riscv/npc/trap.S \
           platform/dummy/vme.c \
           platform/dummy/mpe.c

CFLAGS    += -fdata-sections -ffunction-sections
LDSCRIPTS += $(AM_HOME)/scripts/linker.ld
LDFLAGS   += --defsym=_pmem_start=0x80000000 --defsym=_entry_offset=0x0
LDFLAGS   += --gc-sections -e _start

MAINARGS_MAX_LEN = 64
MAINARGS_PLACEHOLDER = the_insert-arg_rule_in_Makefile_will_insert_mainargs_here
CFLAGS += -DMAINARGS_MAX_LEN=$(MAINARGS_MAX_LEN) -DMAINARGS_PLACEHOLDER=$(MAINARGS_PLACEHOLDER)

insert-arg: image
	@python $(AM_HOME)/tools/insert-arg.py $(IMAGE).bin $(MAINARGS_MAX_LEN) $(MAINARGS_PLACEHOLDER) "$(mainargs)"

image: image-dep
	@$(OBJDUMP) -d $(IMAGE).elf > $(IMAGE).txt
	@echo + OBJCOPY "->" $(IMAGE_REL).bin
	@$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary $(IMAGE).elf $(IMAGE).bin

# DIFFTEST=1 使用逐指令比较；默认仍用普通仿真入口。
DIFFTEST ?= 0
ifeq ($(DIFFTEST),1)
NPC_MAKEFILE := Makefile.diff
NPC_RUN_TARGET := diff
else
NPC_MAKEFILE := Makefile.cpptest
NPC_RUN_TARGET := run
endif

run: insert-arg
	$(MAKE) -C /home/ysyx/ysyx-workbench/npc -f $(NPC_MAKEFILE) $(NPC_RUN_TARGET) PROGRAM="$(IMAGE).bin"

.PHONY: insert-arg
