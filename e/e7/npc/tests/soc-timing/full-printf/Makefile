NAME = rtc-full-printf
SRCS = main.c rtc_entry.c light_printf.c
INC_PATH += $(AM_HOME)/../am-kernels/tests/am-tests/include
CFLAGS += -DAM_RTC_SAMPLES=11 -DRTC_PREPARE_PRINTF
ifeq ($(ARCH),minirv-ysyxsoc)
SRCS += fast_uart.c
LDFLAGS += --wrap=putch
endif
include $(AM_HOME)/Makefile
$(DST_DIR)/main.o $(DST_DIR)/rtc_entry.o: $(NPC_TIMER_CONFIG)

# 主机libc独立对照，不构建或覆盖AM/klib。
.PHONY: test-printf-native
test-printf-native:
	@mkdir -p build/printf-validation
	gcc -std=c11 -O2 -Wall -Wextra -Werror -fsanitize=undefined,address -fno-builtin \
		-DRTC_PRINTF_NATIVE -DRTC_PRINTF_NAME=rtc_test_printf \
		light_printf.c printf_oracle.c -o build/printf-validation/printf_oracle
	build/printf-validation/printf_oracle

# minirv二段编译会覆盖自动依赖，显式保留包含源与查表头依赖。
$(DST_DIR)/light_printf.o: decimal_4digits.h
$(DST_DIR)/rtc_entry.o: $(AM_HOME)/../am-kernels/tests/am-tests/src/tests/rtc.c
$(DST_DIR)/fast_uart.o: uart_status.h

# 为只读格式缓存提供精确边界，不修改共享链接脚本。
LDSCRIPTS := $(CURDIR)/rtc_linker.ld
