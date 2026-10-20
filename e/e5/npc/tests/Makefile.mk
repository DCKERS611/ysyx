# 分类回归使用独立测试入口，不改变 main.cpp 的程序运行接口。
REGRESS_DIR := build/regress
REGRESS_BIN := $(REGRESS_DIR)/cpu_test
REGRESS_SRCS := $(abspath tests/cpu_test.cpp csrc/pmem.cpp csrc/sim.cpp csrc/dpi.cpp)

$(REGRESS_BIN): $(VSRCS) $(REGRESS_SRCS) $(HEADERS) tests/expectations.h $(MAKEFILE_LIST)
	@mkdir -p $(REGRESS_DIR)
	$(VERILATOR) --cc --exe --build -Wall -Wno-DECLFILENAME \
		--public-flat-rw --top-module $(TOPNAME) \
		--Mdir $(abspath $(REGRESS_DIR)/obj_dir) $(VSRCS) $(REGRESS_SRCS) \
		-CFLAGS "$(TEST_CXXFLAGS) -I$(abspath csrc)" -o $(abspath $(REGRESS_BIN))

.PHONY: test-functional test-boundary test-all
test-functional: $(REGRESS_BIN)
	$(PYTHON) tests/run_cpu_tests.py --group functional --runner $(REGRESS_BIN)

test-boundary: $(REGRESS_BIN)
	$(PYTHON) tests/run_cpu_tests.py --group boundary --runner $(REGRESS_BIN)

test-all: test-functional test-boundary


# DiffTest 共用 minirvEMU 的 emu.cpp，不另维护一份参考实现。
DIFF_DIR ?= build/difftest
DIFF_BIN := $(DIFF_DIR)/difftest
REF_DIR := ../minirvEMU
DIFF_SRCS := $(abspath csrc/difftest.cpp csrc/pmem.cpp csrc/sim.cpp csrc/dpi.cpp $(REF_DIR)/emu.cpp)

$(DIFF_BIN): $(VSRCS) $(DIFF_SRCS) $(HEADERS) tests/expectations.h $(REF_DIR)/emu.h $(MAKEFILE_LIST)
	@mkdir -p $(DIFF_DIR)
	$(VERILATOR) --cc --exe --build -Wall -Wno-DECLFILENAME \
		--public-flat-rw --top-module $(TOPNAME) \
		--Mdir $(abspath $(DIFF_DIR)/obj_dir) $(VSRCS) $(DIFF_SRCS) \
		-CFLAGS "$(TEST_CXXFLAGS) -I$(abspath csrc) -I$(abspath tests) -I$(abspath $(REF_DIR))" \
		-o $(abspath $(DIFF_BIN))

.PHONY: difftest difftest-functional difftest-boundary difftest-scale difftest-small difftest-medium diff
difftest-functional: $(DIFF_BIN)
	$(PYTHON) tests/run_cpu_tests.py --group functional --runner $(DIFF_BIN) --output-dir $(DIFF_DIR)/programs

difftest-boundary: $(DIFF_BIN)
	$(PYTHON) tests/run_cpu_tests.py --group boundary --runner $(DIFF_BIN) --output-dir $(DIFF_DIR)/programs

difftest-scale: $(DIFF_BIN)
	$(PYTHON) tests/run_cpu_tests.py --group difftest --runner $(DIFF_BIN) --output-dir $(DIFF_DIR)/programs

difftest-small: $(DIFF_BIN)
	$(PYTHON) tests/run_cpu_tests.py --group difftest --case small --runner $(DIFF_BIN) --output-dir $(DIFF_DIR)/programs

difftest-medium: $(DIFF_BIN)
	$(PYTHON) tests/run_cpu_tests.py --group difftest --case medium --runner $(DIFF_BIN) --output-dir $(DIFF_DIR)/programs

# 不带手写期望，直接对比任意一个已编译的合法程序。
diff: $(DIFF_BIN) $(PROGRAM)
	@$(abspath $(DIFF_BIN)) "$(abspath $(PROGRAM))"

difftest: difftest-functional difftest-boundary difftest-scale

# 大程序分别跑 NPC、EMU 独立入口，再跑逐条 DiffTest。
ACCEPT_EMU := ../minirvEMU/build/minirvEMU
$(ACCEPT_EMU): ../minirvEMU/main.cpp ../minirvEMU/emu.cpp ../minirvEMU/emu.h ../minirvEMU/Makefile
	$(MAKE) -C ../minirvEMU all

.PHONY: test-acceptance difftest-acceptance
test-acceptance: $(REGRESS_BIN) $(DIFF_BIN) $(ACCEPT_EMU)
	$(PYTHON) tests/run_acceptance.py --npc $(REGRESS_BIN) --emu $(ACCEPT_EMU) --diff $(DIFF_BIN)

difftest-acceptance: $(DIFF_BIN)
	$(PYTHON) tests/run_cpu_tests.py --group acceptance --runner $(DIFF_BIN) --output-dir $(DIFF_DIR)/programs

difftest: difftest-acceptance

.PHONY: check-waves
check-waves: test-acceptance
	@mkdir -p build/acceptance/waves
	$(MAKE) -f Makefile.wave sim PROGRAM=build/acceptance/programs/array_sum.bin WAVE_FILE=build/acceptance/waves/array_sum.fst
	$(MAKE) -f Makefile.wave sim PROGRAM=build/acceptance/programs/byte_sum.bin WAVE_FILE=build/acceptance/waves/byte_sum.fst
	fst2vcd build/acceptance/waves/array_sum.fst > build/acceptance/waves/array_sum.vcd
	fst2vcd build/acceptance/waves/byte_sum.fst > build/acceptance/waves/byte_sum.vcd
	$(PYTHON) tests/check_acceptance_wave.py --array build/acceptance/waves/array_sum.vcd --bytes build/acceptance/waves/byte_sum.vcd
