TOPNAME = minirvEMU
INC_PATH ?=

CXX = g++
BUILD_DIR = ./build
BIN = $(BUILD_DIR)/$(TOPNAME)

default: $(BIN)

CSRCS = $(abspath ./main.cpp ./emu.cpp)
PROGRAM ?= ../npc/build/programs/addi-jalr.bin
DEFAULT_PROGRAM := ../npc/build/programs/addi-jalr.bin

INCFLAGS = $(addprefix -I, $(INC_PATH))
CXXFLAGS += -std=c++17 -Wall -Wextra -g $(INCFLAGS)

$(BIN): $(CSRCS) emu.h Makefile
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(CSRCS) -o $@

all: default
$(DEFAULT_PROGRAM): ../npc/tests/gen_program.py
	python3 $< "$@"

sim: $(BIN) $(PROGRAM)
	@$(BIN) "$(PROGRAM)"

clean:
	rm -rf $(BUILD_DIR)

lint:
	$(CXX) $(CXXFLAGS) -Wpedantic -Werror -fsyntax-only $(CSRCS)

.PHONY: default all sim clean lint
