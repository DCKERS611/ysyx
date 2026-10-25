# archbench 现有日志摘录（2026-10-25）

来源：WSL `/home/ysyx/ysyx-workbench/archbench/result/*.log`，各项为 `mainargs=train` 的运行日志。本次同步没有重新运行测试。

20 项日志中 19 项包含程序自检 PASS 和 GOOD TRAP；LLaMA 在旧的 1000000000 周期预算下超时，没有成功结束。当前源码提高了预算，但没有据此补写通过结论。

| 程序 | 日志结果 | 日志总周期数 |
|---|---|---:|
| 100.blockchain | PASS / GOOD TRAP | 16994582 |
| 101.igemm | PASS / GOOD TRAP | 369058546 |
| 102.queen | PASS / GOOD TRAP | 89304177 |
| 103.dinic | PASS / GOOD TRAP | 116656051 |
| 104.malloc | PASS / GOOD TRAP | 85099390 |
| 105.bf | PASS / GOOD TRAP | 32080450 |
| 106.qsort | PASS / GOOD TRAP | 216593555 |
| 107.stream | PASS / GOOD TRAP | 88892980 |
| 108.ntt | PASS / GOOD TRAP | 123458890 |
| 200.genann | PASS / GOOD TRAP | 781917375 |
| 201.jpeg | PASS / GOOD TRAP | 59542390 |
| 202.llama2 | TIMEOUT / 未通过 | 1000000000 |
| 203.rsa | PASS / GOOD TRAP | 236785091 |
| 204.hypergraph | PASS / GOOD TRAP | 231114475 |
| 300.bzip3 | PASS / GOOD TRAP | 110191833 |
| 301.gsim | PASS / GOOD TRAP | 42015661 |
| 302.lua | PASS / GOOD TRAP | 12665430 |
| 303.cproc | PASS / GOOD TRAP | 22595171 |
| 304.mp3 | PASS / GOOD TRAP | 371085030 |
| 305.h264 | PASS / GOOD TRAP | 92974554 |

这些是各自历史运行的记录，不是当前快照的一次统一回归；不能据此推断测试当时均使用当前 100 MHz 参数，也不汇报统一性能分数。
