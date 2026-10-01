TOPNAME = top
NXDC_FILES = constr/top.nxdc
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj_dir
BIN = $(BUILD_DIR)/$(TOPNAME)

VERILATOR = verilator
VERILATOR_CFLAGS += -MMD --build -cc -O3 --x-assign fast --x-initial fast --noassert

$(shell mkdir -p $(BUILD_DIR))

SRC_AUTO_BIND = $(abspath $(BUILD_DIR)/auto_bind.cpp)
$(SRC_AUTO_BIND): $(NXDC_FILES)
	python3 $(NVBOARD_HOME)/scripts/auto_pin_bind.py $^ $@

VSRCS = $(wildcard *.v)
CSRCS = $(wildcard *.cpp) $(SRC_AUTO_BIND)
VSRCS += ../../common/template.v

include $(NVBOARD_HOME)/scripts/nvboard.mk

CXXFLAGS += -I$(NVBOARD_HOME)/usr/include -DTOP_NAME="\"V$(TOPNAME)\""

$(BIN): $(VSRCS) $(CSRCS) $(NVBOARD_ARCHIVE)
	@rm -rf $(OBJ_DIR)
	$(VERILATOR) $(VERILATOR_CFLAGS) --top-module $(TOPNAME) $^ \
	    $(addprefix -CFLAGS , $(CXXFLAGS)) $(addprefix -LDFLAGS , $(LDFLAGS))\
	    --Mdir $(OBJ_DIR) --exe -o $(abspath $(BIN))

sim: $(BIN)
	@$^
clean:
	rm -rf $(BUILD_DIR)

.PHONY: sim clean
