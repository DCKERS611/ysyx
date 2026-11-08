# 分类回归使用独立测试入口，不改变 tests/am_main.cpp 的程序运行接口。
REGRESS_DIR ?= build/regress
REGRESS_BIN := $(REGRESS_DIR)/cpu_test
REGRESS_SRCS := $(abspath tests/cpu_test.cpp csrc/pmem.cpp csrc/sim.cpp csrc/dpi.cpp)

$(REGRESS_BIN): $(VSRCS) $(REGRESS_SRCS) $(HEADERS) tests/expectations.h $(MAKEFILE_LIST)
	@mkdir -p $(REGRESS_DIR)
	$(VERILATOR) --cc --exe --build -Wall -Wno-DECLFILENAME \
		--public-flat-rw --top-module $(TOPNAME) $(TRACE_FLAGS) \
		--Mdir $(abspath $(REGRESS_DIR)/obj_dir) $(VSRCS) $(REGRESS_SRCS) \
		-CFLAGS "$(TEST_CXXFLAGS) -I$(abspath csrc) -I$(abspath tests)" -o $(abspath $(REGRESS_BIN))

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
DIFF_SRCS := $(abspath tests/difftest.cpp csrc/pmem.cpp csrc/sim.cpp csrc/dpi.cpp $(REF_DIR)/emu.cpp)

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
	$(MAKE) -f Makefile.cpptest REGRESS_DIR=build/wave-tests TRACE=1 build/wave-tests/cpu_test
	build/wave-tests/cpu_test build/acceptance/programs/array_sum.bin build/acceptance/programs/array_sum.expect acceptance/array_sum build/acceptance/waves/array_sum.fst
	build/wave-tests/cpu_test build/acceptance/programs/byte_sum.bin build/acceptance/programs/byte_sum.expect acceptance/byte_sum build/acceptance/waves/byte_sum.fst
	fst2vcd build/acceptance/waves/array_sum.fst > build/acceptance/waves/array_sum.vcd
	fst2vcd build/acceptance/waves/byte_sum.fst > build/acceptance/waves/byte_sum.vcd
	$(PYTHON) tests/check_acceptance_wave.py --array build/acceptance/waves/array_sum.vcd --bytes build/acceptance/waves/byte_sum.vcd

# 同一套用例在固定一拍与默认随机回复下运行，区分功能和时序口径。
.PHONY: test-fixed difftest-fixed
test-fixed:
	NPC_MEM_DELAY=1 $(MAKE) -f Makefile.cpptest test-all

difftest-fixed:
	NPC_MEM_DELAY=1 $(MAKE) -f Makefile.diff difftest

CXX ?= g++
CHECKER_BIN := build/test-library/checker_test
$(CHECKER_BIN): tests/checker_test.cpp csrc/check.h csrc/test_suite.h
	@mkdir -p $(dir $@)
	$(CXX) -std=c++17 -Wall -Wextra -Werror -Icsrc $< -o $@

.PHONY: test-library
test-library: $(CHECKER_BIN)
	$(CHECKER_BIN)

# 总线协议监视器：不依赖 Verilator，直接喂合成的合法/违例时序。
BUS_MONITOR_BIN := build/test-library/bus_monitor_test
$(BUS_MONITOR_BIN): tests/bus_monitor_test.cpp csrc/bus_monitor.h csrc/check.h
	@mkdir -p $(dir $@)
	$(CXX) -std=c++17 -Wall -Wextra -Werror -Icsrc $< -o $@

.PHONY: test-bus-monitor
test-bus-monitor: $(BUS_MONITOR_BIN)
	$(BUS_MONITOR_BIN)

# 依次执行，避免并行调度让固定/随机配置同时写同一组验收文件。
.PHONY: regress
regress:
	$(MAKE) -f Makefile.cpptest lint
	$(MAKE) -f Makefile.cpptest test-csr
	$(MAKE) -f Makefile.cpptest test-gpio
	$(MAKE) -f Makefile.cpptest test-library
	$(MAKE) -f Makefile.cpptest test-bus-monitor
	$(MAKE) -f Makefile.cpptest test-all
	$(MAKE) -f Makefile.cpptest test-fixed
	$(MAKE) -f Makefile.diff difftest
	$(MAKE) -f Makefile.diff difftest-fixed
	$(MAKE) -f Makefile.cpptest test-acceptance
	$(MAKE) -f Makefile.cpptest check-waves

# CSR 定向测试直接驱动真实 CPU 的取指回复，检查等待与拒绝边界。
CSR_TEST_DIR := build/csr-tests
CSR_TEST_BIN := $(CSR_TEST_DIR)/csr_test
$(CSR_TEST_BIN): $(VSRCS) tests/csr_test.cpp $(HEADERS) $(MAKEFILE_LIST)
	@mkdir -p $(CSR_TEST_DIR)
	$(VERILATOR) --cc --exe --build -Wall -Wno-DECLFILENAME \
		--public-flat-rw --top-module $(TOPNAME) \
		--Mdir $(abspath $(CSR_TEST_DIR)/obj_dir) $(VSRCS) $(abspath tests/csr_test.cpp) \
		-CFLAGS "$(TEST_CXXFLAGS) -I$(abspath csrc)" -o $(abspath $(CSR_TEST_BIN))

.PHONY: test-csr
test-csr: $(CSR_TEST_BIN)
	$(CSR_TEST_BIN)

# 新CSR语义及计数器独立模型的逐提交验证。
.PHONY: difftest-csr difftest-csr-fixed
difftest-csr: $(DIFF_BIN)
	$(PYTHON) tests/run_cpu_tests.py --group csr --runner $(DIFF_BIN) --output-dir $(DIFF_DIR)/programs

difftest-csr-fixed: $(DIFF_BIN)
	NPC_MEM_DELAY=1 $(PYTHON) tests/run_cpu_tests.py --group csr --runner $(DIFF_BIN) --output-dir $(DIFF_DIR)/programs

# GPIO独立APB验证，不构建AM或整个SoC；仍复用通用checker。
GPIO_TEST_DIR ?= build/gpio-tests
GPIO_TEST_RTL ?= $(abspath ../ysyxSoC/perip/gpio/mygpio_top_apb.v)
GPIO_TEST_BIN := $(GPIO_TEST_DIR)/gpio_apb_test
$(GPIO_TEST_BIN): $(GPIO_TEST_RTL) tests/gpio_apb_test.cpp csrc/check.h $(MAKEFILE_LIST)
	@mkdir -p $(GPIO_TEST_DIR)
	$(VERILATOR) --cc --exe --build --trace-fst -Wall -Wno-DECLFILENAME -Wno-UNUSEDSIGNAL \
		--top-module mygpio_top_apb --Mdir $(abspath $(GPIO_TEST_DIR)/obj_dir) \
		$(GPIO_TEST_RTL) $(abspath tests/gpio_apb_test.cpp) \
		-CFLAGS "$(TEST_CXXFLAGS) -I$(abspath csrc)" -o $(abspath $(GPIO_TEST_BIN))

.PHONY: test-gpio
test-gpio: $(GPIO_TEST_BIN)
	$(GPIO_TEST_BIN) $(abspath $(GPIO_TEST_DIR)/gpio-apb.fst)
