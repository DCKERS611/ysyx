NAME = rtc-wait-profile
SRCS = main.c rtc.c formatter.c
CFLAGS += -DAM_RTC_SAMPLES=11 -DRTC_PREPARE_PRINTF
INC_PATH += $(AM_HOME)/../am-kernels/tests/am-tests/include
include $(AM_HOME)/Makefile
LDSCRIPTS := $(CURDIR)/../rtc_linker.ld
$(DST_DIR)/rtc.o: $(AM_HOME)/../am-kernels/tests/am-tests/src/tests/rtc.c $(NPC_TIMER_CONFIG)
$(DST_DIR)/formatter.o: ../light_printf.c ../decimal_4digits.h
