# CSR的SoC功能验收

正式源码位于WSL Ubuntu-22.04的/home/ysyx/ysyx-workbench，本目录为npc/tests/csr-functional。
普通hello.c没有替换。每个子目录均采用AM Makefile、ARCH=minirv-ysyxsoc构建镜像，通过npc/build/soc/sim启动，完整执行Flash loader与PSRAM程序。

- id：原hello-csr-id.c.bak打印及断言程序。
- carry：csrrs置全1后，用高低高一致性循环读取两次；minirv将bne展开，差值6622拍。
- carry-tight：连续采样两组高低高，采样后断言高位一致；差值228拍。
- invalid-address：csrr t0,0x123。
- readonly-write：t1=1后执行csrrs t0,mvendorid,t1。

本次正向程序退出码0并GOOD TRAP。负向运行仅设置NPC_CONTINUE_ON_REJECT=1、NPC_MAX_CYCLES=200000000，程序停在故障指令直至周期上限，退出码1；不设置前者时仍立即报错。
没有更改计数器复位值、CSR RTL、CPU倍率或timer换算系数。

results保存原始构建/运行日志、实际退出码与耗时、反汇编和机器核验summary.json。Windows保留同相对路径；build为编译产物未同步。

11-08 的人工波形复盘使用同一个 id 程序的独立 NPC 镜像，固定一拍回复。原波形和运行日志保存在 `npc/build/verification/csr-marchid-review/`。指令 `csrr s0, marchid` 位于 `0x800002a8`，在 `2251138 ps` 提交后 `rf[8]` 更新为 `0x05F63D25`。本次人工核对见 E7 学习记录 §54。
