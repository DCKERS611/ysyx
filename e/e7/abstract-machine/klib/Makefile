# 当前minirv课程环境使用随工作台提供的库；源码桩不能静默覆盖可用输入。
# 完成klib源码实现后，可显式NPC_USE_PREBUILT_KLIB=0选择源码构建。
NPC_USE_PREBUILT_KLIB ?= 1
ifneq ($(filter minirv-npc minirv-ysyxsoc,$(ARCH)),)
ifeq ($(NPC_USE_PREBUILT_KLIB),1)
USE_PREBUILT_MINIRV_KLIB := 1
endif
endif

ifeq ($(USE_PREBUILT_MINIRV_KLIB),1)
.DEFAULT_GOAL := archive
PREBUILT_KLIB := $(CURDIR)/build/klib-$(ARCH).a
.PHONY: archive all clean
archive all:
	@test -s "$(PREBUILT_KLIB)" || { echo "缺少课程预编译库：$(PREBUILT_KLIB)，请恢复输入库；不会改用未实现的源码桩。"; exit 1; }
# build中这份.a是输入而非可丢弃缓存，clean保留它。
clean:
	@echo "保留minirv预编译klib输入；需要源码构建时显式NPC_USE_PREBUILT_KLIB=0。"
else
NAME = klib
SRCS = $(shell find src/ -name "*.c")
include $(AM_HOME)/Makefile
endif
