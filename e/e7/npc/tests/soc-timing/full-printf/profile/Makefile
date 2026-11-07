NAME = rtc-printf-profile
SRCS = main.c formatter.c
CFLAGS += -DRTC_ENABLE_PRINTF_PROFILE
ifeq ($(ARCH),minirv-ysyxsoc)
SRCS += uart_backend.c
LDFLAGS += --wrap=putch
endif
ifeq ($(ARCH),minirv-npc)
SRCS += npc_backend.c
LDFLAGS += --wrap=putch
endif
include $(AM_HOME)/Makefile
$(DST_DIR)/formatter.o: ../light_printf.c ../decimal_4digits.h
$(DST_DIR)/uart_backend.o: ../fast_uart.c ../uart_status.h

# 为只读格式缓存提供精确边界，不修改共享链接脚本。
LDSCRIPTS := $(CURDIR)/../rtc_linker.ld
