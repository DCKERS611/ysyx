# E6 综合配置与报告归档

本目录保存流水灯和 NPC 的 syn_sta 配置、源代码快照和原始报告，不保存 ECC 工具或整个 runs/build。

- `npc/reports/qor_summary.rpt`：NPC 404 MHz、CELLA 6941 μm²。
- `npc/origin/*.v`：该次综合的 8 个源文件，已与当前正式 NPC RTL 逐个 SHA-256 对比。
- `light/reports/qor_summary.rpt`：流水灯估计 1124 MHz、CELLA 559 μm²。
- `ecc.toml` 与 `rtl/filelist.f` 保留当时配置，路径指向 WSL `/home/ysyx/ysyx-workbench`；换位置重建项目时应调整 PDK 路径和 filelist。
- `timing_max.rpt` 在本次配置下只筛选负 slack 的路径；文件显示 No constrained paths 不能单独证明设计没有时钟约束，应结合保存的 SDC、qor_summary 与日志判断。

这些都是综合阶段的估计；未把完整 RTL-to-GDS 试跑或流片签核记成通过。
