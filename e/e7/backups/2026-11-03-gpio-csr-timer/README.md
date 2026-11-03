# 2026-11-03 GPIO、CSR与计时替换代码备份

正式源码仍在WSL Ubuntu-22.04的/home/ysyx/ysyx-workbench。本目录在覆盖Windows副本前创建，随E7源码提交，位于build之外。备份不作为默认构建入口。

| 目录 | 内容和来源 |
|---|---|
| before-sync-windows/ | 本次同步前Windows原样文件。hello.c是GPIO密码锁+10023589数码管程序，timer.c/rtc.c是旧实现。其他文件可能已有当日GPIO修改，不等同于上次Git版本。 |
| current-wsl/ | 同步时WSL的9个当前源码文件原样快照，包含当前CSR测试、timer、rtc、CPU接线/译码/写回、GPIO及引脚绑定。 |
| saved-wsl/hello-led-readback.c | WSL原有hello.c.bak的原样副本：两轮LED流水灯、assert读回、最后保留Hello打印。 |
| original-from-git/ | 从03184a1b9cc863f36d2b792817e84be51ef313e1直接提取的原版Hello、MMIO timer和rtc测试。 |
| reference-variants/ | 本次按当前timer派生的/4和/25参考版本，并非历史原文件。/4曾接近现实一秒；/25用于真实25MHz下周期转微秒。 |

manifest.json记录23个代码文件的来源、用途、字节数和SHA-256。当前WSL快照的计时换算保持乘17782后右移16；最新用户实测仍慢约14.9%，校准暂停，不作为精确计时验收。

## 恢复示例

以下命令在WSL执行，会覆盖当前hello.c；当前CSR版本已由current-wsl保留。恢复GPIO密码锁+数码管程序：

    cp /mnt/e/ysyx/e/e7/backups/2026-11-03-gpio-csr-timer/before-sync-windows/am-kernels/kernels/hello/hello.c /home/ysyx/ysyx-workbench/am-kernels/kernels/hello/hello.c

恢复流水灯读回检查程序：

    cp /mnt/e/ysyx/e/e7/backups/2026-11-03-gpio-csr-timer/saved-wsl/hello-led-readback.c /home/ysyx/ysyx-workbench/am-kernels/kernels/hello/hello.c

恢复原版Hello或MMIO timer，从original-from-git的相同相对路径复制。复制后重新运行已有AM构建命令。本次仅备份，没有执行恢复、编译或仿真。

TRM已分平台，但timer目前仍共享；后续旧NPC行为模型需要原计时设备时，应确认并恢复对应timer，不能认为它也已分平台。
