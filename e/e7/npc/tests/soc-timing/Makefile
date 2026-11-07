NAME = soc-uptime
SRCS = main.c
include $(AM_HOME)/Makefile

# 本测试应用打印编译频率，必须随配置一起重编。
$(DST_DIR)/main.o: $(NPC_TIMER_CONFIG)
