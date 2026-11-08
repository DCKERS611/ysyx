# 完整printf RTC墙钟演示

直接编译原am-tests的rtc.c，保留日期、时分秒、单复数秒数的完整格式。AM_RTC_SAMPLES=11仅让自动验收收尾；原am-tests未定义该宏时仍无限运行。此目录只用于仿真墙钟演示，不参与性能评分。

局部整数printf支持d/i/u/x/X/s/c、%%、宽度、零填充、左对齐及动态宽度；不支持的精度或长度修饰符返回-1。只读格式预解析在RTC起点前完成，所有动态数值转换和UART字符发送仍在计时区内。约40KB通用十进制表以空间换软件运算，原格式串及运行时参数不替换成固定输出。

fast_uart.c只在本工程通过--wrap=putch使用，仍读取真实UART LSR bit5、逐字符写THR。256状态跳转表省去minirv的软件分支展开；共享TRM的初始化、结束等待及其他应用的putch保持原实现。

AM非零Q16用等价常量移位加法，保留uint64模2^64后右移16位语义；Q16=0仍按25/300MHz换算。两份课程预编译klib均未被改写。

在WSL执行：

```bash
export AM_HOME=/home/ysyx/ysyx-workbench/abstract-machine
cd /home/ysyx/ysyx-workbench/npc/tests/soc-timing/full-printf
make ARCH=minirv-npc test-printf-native
NPC_RTC_MAX_TRIALS=8 taskset -c 0 python3 calibrate.py
```

每档 11 行、10 个主机单调时间间隔。默认同系数、同镜像连续两次平均间隔落在 1 秒 ±5%，客机最大迟到小于一整秒。`NPC_RTC_RUNS` 可设为 2～5，`NPC_RTC_MAX_TRIALS` 至少为所选轮数。每轮记录各间隔及偏差、均值、极值和总体标准差。单间隔用于诊断，沿用原平均间隔与最大迟到判据。

默认生成独立时间戳目录，拒绝覆盖；needs_review非零退出。已知系数可通过NPC_RTC_INITIAL_Q16_K1/K12设置，NPC_RTC_FIXED_Q16=1用于固定系数确认；NPC_RTC_RATIOS默认1,12，必要时可重测尚未完成的档位。实际验收以JSON和原始完整行、退出码为准。

profile/ 保留独立 NPC 与 SoC 的周期剖析、PC 计数及 native oracle，诊断统计不在正式间隔中启用。k12、Q16=6929 的两轮通过记录见 E7 学习记录 §47，P1 同镜像第三轮待补，逐间隔复核见 §51。
