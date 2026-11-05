PROJECT := /home/ysyx/ysyx-workbench/ecc/npc-e7
ECC ?= ecc
STRATEGY ?= BALANCE 3
RUN_TAG := $(shell date +%Y%m%d-%H%M%S)
RUN_ID ?= $(word 1,$(STRATEGY))-$(word 2,$(STRATEGY))-$(RUN_TAG)

.PHONY: synth balance area

# 策略只对本次命令生效；每次使用独立的运行名称保留旧结果。
synth:
	YOSYS_SYNTH_STRATEGY="$(STRATEGY)" $(ECC) run --project "$(PROJECT)" --run-id "$(RUN_ID)"

# 保留原有快捷入口，统一复用 synth。
balance: STRATEGY = BALANCE 3
balance: synth

area: STRATEGY = AREA 0
area: synth
