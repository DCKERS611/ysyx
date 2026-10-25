# 在本目录运行。使用 E5 快照，不读取正在开发的 WSL E6 CPU。
.DEFAULT_GOAL := build
E5 := $(abspath ../../e5)
NPC := $(E5)/npc
REF := $(E5)/minirvEMU
OUT := $(abspath build)
BIN := $(OUT)/difftest_cstyle
PROGRAM ?= $(OUT)/array_sum.bin
WAVE ?=
VSRCS := $(wildcard $(NPC)/vsrc/*.v)
CSRCS := $(abspath difftest_cstyle.cpp reference_bridge.cpp) \
         $(NPC)/csrc/pmem.cpp $(NPC)/csrc/sim.cpp $(NPC)/csrc/dpi.cpp $(REF)/emu.cpp

.PHONY: build run wave
build: $(BIN)
$(BIN): $(VSRCS) $(CSRCS) reference_bridge.h Makefile
	mkdir -p $(OUT)
	verilator --cc --exe --build -Wall -Wno-DECLFILENAME --public-flat-rw \
	    --trace-fst --trace-structs --top-module top --Mdir $(OUT)/obj_dir \
	    $(VSRCS) $(CSRCS) \
	    -CFLAGS "-std=c++17 -Wall -Wextra -Werror -I$(NPC)/csrc -I$(REF)" -o $(BIN)

$(OUT)/array_sum.bin: $(NPC)/tests/programs/acceptance/array_sum.s
	mkdir -p $(OUT)
	python3 $(NPC)/tools/mkprog.py $< -o $@

run: $(BIN) $(PROGRAM)
	$(BIN) "$(abspath $(PROGRAM))" $(if $(WAVE),"$(abspath $(WAVE))")

wave:
	$(MAKE) run WAVE=$(OUT)/wave.fst
