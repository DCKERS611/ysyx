TOPNAME = top
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj_dir
BIN = $(OBJ_DIR)/V$(TOPNAME)
TEMPLATE = ../../common/template.v

VSRCS = $(wildcard *.v)
CSRCS = main.cpp

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
