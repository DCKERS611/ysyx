# E4 南大数字电路实验的通用构建 Makefile（参考副本）
# 实际使用位置：~/e4/NJU_exp/expN/Makefile
# 本文件在 Windows E 盘仅作参考/备份，不要在这里构建。

# main.cpp 穷举数码管译码器；上板顶层由 Makefile.board 构建
TOPNAME = decoder
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj_dir
BIN = $(OBJ_DIR)/V$(TOPNAME)
TEMPLATE = ../../common/template.v

VSRCS = $(wildcard *.v)
CSRCS = $(abspath main.cpp)

$(BIN): $(VSRCS) $(CSRCS) $(TEMPLATE)
	@mkdir -p $(BUILD_DIR)
	verilator --cc --exe --build --top-module $(TOPNAME) \
	    --Mdir $(OBJ_DIR) -Wno-MULTITOP \
	    $(VSRCS) $(TEMPLATE) $(CSRCS)

sim: $(BIN)
	@./$(BIN)

lint:
	verilator --lint-only -Wall -Wno-MULTITOP -Wno-DECLFILENAME --top-module $(TOPNAME) $(VSRCS) $(TEMPLATE)

clean:
	rm -rf $(BUILD_DIR)

.PHONY: sim lint clean
