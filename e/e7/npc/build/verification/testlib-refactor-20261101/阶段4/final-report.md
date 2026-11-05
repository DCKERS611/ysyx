# E7 测试库重构执行报告

2026-11-01；依据 v2 实施文档 §13。正式源码为 WSL Ubuntu-22.04 /home/ysyx/ysyx-workbench，Windows 为 E:/ysyx/e/e7。

## 阶段状态

| 阶段 | 状态 | 证据 |
|---|---|---|
| 0 | 40项 SHA 一致；15条基线命令通过 | testlib-baseline-20261101/ |
| 1 | 11文件机械改名；8条快速、13条核心验收通过 | 阶段1/rename、阶段1/core |
| 2 | RESULT、比较器复用、Python调度；15条验收与失败探针通过 | 阶段2/result、failure-paths |
| 3 | 三入口搬移、顺序regress；V1–V16通过 | 阶段3/final |
| 4 | 指定文档更新；68文件SHA一致；Git未写入 | 本目录completion-audit.json |

## 基线对照

| 编号 | 内容 | 阶段0值 | 最终值 |
|---|---|---|---|
| V1 | CPU lint | 退出0、无Error | 一致 |
| V2 | 检查库 | 最终10项 | 一致 |
| V3 | 默认普通手写 | 4/4 + 14/14，各案例检查数 | 一致 |
| V4 | 固定一拍普通手写 | 4/4 + 14/14，各案例检查数 | 一致 |
| V5 | 默认手写DiffTest | 23/23，逐案例steps/EXPECT，128 MiB | 一致 |
| V6 | 固定一拍DiffTest | 同V5 | 一致 |
| V7 | 三方验收 | 9/9 | 一致 |
| V8 | 波形 | add/lw/sb PASS | 一致 |
| V9 | dummy普通 | 17条 / 172周期，2项检查 | 一致 |
| V10 | dummy差分 | 289 (17×17)，33554432字 | 一致 |
| V11 | hello普通 | 30467条 / 546583周期 / IPC 0.055741 | 一致 |
| V12 | hello差分 | 517939 (30467×17)，33554432字 | 一致 |
| V13 | 完整AM差分 | 35 PASS + wrong预期失败 | 一致 |
| V14 | RV32I差分 | 38/38 | 一致 |
| V15 | SoC构建 | N/A | 构建通过；非数值基线 |
| V16 | 汇编器unittest | 9项通过 | 一致 |

普通18项与差分23项的逐案例检查数、steps分别对照原日志；非法指令的steps指attempts，不能用retired替代。dummy/hello以及完整AM和RV32I共75个成功差分运行的core、steps、memory和extra数字逐项相等，见numeric-comparison.json。阶段0无逐案例输出的字段没有虚构旧基线。

## §13 逐项复核

| 项 | 结论 | 证据 |
|---|---|---|
| 1 | 提交前只读采样保持在 step 之前 | tests/difftest.cpp + 基线计数 |
| 2 | ebreak 完成当前拍；拒绝只做低电平求值 | 阶段3/final/extra/*-edge.log |
| 3 | 比较/参考故障原因和失败矩阵落地 | 阶段2/failure-paths/summary.json |
| 4 | LFSR 接受条件、IFU→LSU 和原请求块保持 | static-order-check.json |
| 5 | 设备读同步条件与位置保持 | tests/difftest.cpp + numeric-comparison.json |
| 6 | final→FST close/reset | csrc/sim.cpp + 部分初始化注入 |
| 7 | 调用方 checker 引用与既有计数接口 | tests/expectations.h + 逐案例检查数 |
| 8 | 最终 V1–V16 通过，V15旧基线 N/A | 阶段3/final/execution-summary.json |
| 9 | 阶段0 40项 SHA；结束68项 SHA与目录对照 | source-sha256-check.log/windows-sync-check.log |
| 10 | RESULT/预算/RAII/内存未执行语义验证 | 失败探针、单拍探针、Python后端继续运行 |
| 11 | E4/E5引用检查无输出 | completion-audit.json |

## 改动清单

新增正式源文件：无。原入口移到tests，其中AM与差分入口同时适配新接口；SoC入口逐字不变。其余变化如下：

- minirvEMU/main.cpp
- npc/Makefile.cpptest
- npc/Makefile.soc
- npc/README.md
- npc/csrc/check.h
- npc/csrc/cpu_view.h
- npc/csrc/sim.cpp
- npc/csrc/sim.h
- npc/csrc/test_suite.h
- npc/tests/Makefile.mk
- npc/tests/README.md
- npc/tests/am_main.cpp
- npc/tests/checker_test.cpp
- npc/tests/cpu_test.cpp
- npc/tests/difftest.cpp
- npc/tests/expectations.h
- npc/tests/run_acceptance.py
- npc/tests/run_cpu_tests.py
- npc/tests/test_mkprog.py
- npc/tools/mkprog.py
- Windows E7学习记录第十九节与共享测试索引E7节。

移动：

- npc/csrc/main.cpp → npc/tests/am_main.cpp
- npc/csrc/difftest.cpp → npc/tests/difftest.cpp
- npc/csrc/soc_main.cpp → npc/tests/soc_main.cpp

删除仅限未跟踪生成缓存：csrc/.sim.cpp.swp、tests/__pycache__、tb/obj_dir、build/cpp/difftest/regress/wave-tests/wave，另清build/soc/obj_dir以去掉旧soc_main.d路径。旧npc/e4与tb源码保留。未新增永久测试框架；临时探针和源副本仅存build/verification。

## 与文档不同之处及原因

- session初始化绑定DUT后step()不再重复传DUT；§3.3允许签名微调，运行语义和采样顺序保持。
- 同步按改动清单补入tools/mkprog.py和npc/README.md，避免§8.4漏拷。
- SoC首轮构建因旧soc_main.d引用csrc旧路径失败。保留soc-build.initial.log，清生成缓存后原命令重试通过；没有改SoC逻辑、参数或警告策略。
- AM原Makefile的失败过滤不可靠；保留它不改，直接逐项核对36个结果，确认仅wrong失败。
- 不可写FST路径在当前Verilator仍可能被isOpen误报为成功；这是原工具行为，未算作失败处理通过。部分初始化清理由临时sim.cpp故障注入验证。
- tests README解释组和目标，完整命令索引仍在共享索引，不另建平行验收台账。

## 额外验证与边界

通过：缺失/重复/损坏RESULT、错误case/backend、退出码冲突、EXPECT不符、预期/非预期非法、未对齐、周期/尝试预算、比较差异、参考故障、1字内存差异，以及后端超时/启动失败/缺RESULT后继续其余6次成功调用。

单拍边界：arithmetic ebreak时time=89、cycles=43、retired=attempts=5；拒绝案例time=62、cycles=29、retired=2、attempts=3。拒绝只推进1个时间单位；结束后两次误调用不再推进，诊断只出现一次。

受保护的43个文件哈希不变；check.h严格为类型改名；sim请求→上升沿→写入→回复块与基线逐字相等。正常FST经生成、转换和自动检查；用户尚未亲自阅读。

未做：archbench、SoC运行、后续步骤5–7。SoC hello仍待阶段f验收。当前Verilator的实际不可写路径反馈限制未修复。根E7 README两处旧入口文字不在指定修改清单中，留待后续维护。

## 同步与待用户处理

Windows已复制21个变化文件、删除3个搬迁旧路径；68个相关源码/构建文件SHA与WSL一致，csrc/tests/tools目录对照无源文件差异。build、原始波形、缓存、各级.git未复制。这不是Windows复测。

待用户自行决定：是否删除旧npc/e4和tb归档源码、是否提交/推送当前改动，以及继续SoC hello。

Git：未add、commit、push或git rm；HEAD仍为f93e6f10c1d42edb2a3ea222d85951feeb6ef004，暂存区为空。旧提交保持不变。
