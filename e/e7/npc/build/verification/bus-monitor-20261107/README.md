# 总线协议监视器（测试库重构步骤 6）本机证据

日期：2026-11-07。范围：独立 NPC 的 `sim_session::step()` 总线事件流。
正式源码在 WSL `/home/ysyx/ysyx-workbench/npc`；本目录只存本次运行证据。

## 1. 改了什么

| 文件 | 改动 |
|---|---|
| `csrc/bus_monitor.h`（新增） | 被动协议监视器：统计请求/回复数，按 7 条判据报告违例 |
| `csrc/sim.cpp` | `step()` 每拍采样总线信号、回复时通知监视器；`reset()` 清零；新增 `sim_bus_ok()`；`sim_print_result` 打印 `Bus:` 汇总并在 RESULT 追加 `bus=pass/fail` |
| `csrc/sim.h` | 声明 `sim_bus_ok()` |
| `tests/cpu_test.cpp`、`tests/am_main.cpp`、`tests/difftest.cpp` | 把总线结果并入本次运行的 verdict（有违例即判失败） |
| `tests/bus_monitor_test.cpp`（新增） | 不依赖 Verilator 的单元测试，喂合成的合法/违例时序 |
| `tests/Makefile.mk` | 新增 `test-bus-monitor`，并加入 `regress` 序列 |

监视器只观察、不改变仿真行为：`step()` 里接受/回复请求的逻辑未动，
原先"等待期第二个请求被静默忽略"的行为保留，只是现在会报告出来。

## 2. 判据

| kind | 触发条件 | 为什么算违例 |
|---|---|---|
| `ifu_request_while_pending` | 已有取指请求在途，`io_ifu_reqValid` 再次为 1 | 单请求在途协议；当前会被静默忽略 |
| `lsu_request_while_pending` | 已有数据请求在途，`io_lsu_reqValid` 再次为 1 | 同上 |
| `ifu_addr_unaligned` | 取指地址不是 4 字节对齐 | 取指固定按字访问 |
| `lsu_size_illegal` | `io_lsu_size == 2'b11` | 保留编码，1B=00、2B=01、4B=10 |
| `lsu_word_unaligned` | size=4B 而地址不是 4 字节对齐 | 与 size 冲突 |
| `lsu_half_unaligned` | size=2B 而地址不是 2 字节对齐 | 与 size 冲突 |
| `*_response_without_request` | 没有在途请求却收到回复 | 回复与请求不配对 |
| `halt_with_pending_*` | 正常停机（ebreak）时仍有请求未回复 | 程序结束应无遗留事务 |

同类违例最多打印 20 条，计数不受限制。

## 3. 本次实际运行

| 验证 | 命令 | 结果 |
|---|---|---|
| 监视器单元测试 | `make -f Makefile.cpptest test-bus-monitor` | `PASS: 15 checks`，退出 0 |
| 全量短回归 | `make -f Makefile.cpptest regress` | 退出 0；functional 4/4、boundary 14/14（默认与固定一拍各一遍）、difftest 2/2 ×2、acceptance 3/3 ×2、check-waves PASS、lint/CSR/GPIO/检查库全过 |
| AM hello | `am-kernels/kernels/hello`：`make ARCH=minirv-npc run` | 30467 条、546583 周期（与基线一致）、取指 30467/30467、访存 18752/18752、0 违例 |
| 固定 5 拍 hello | `NPC_MEM_DELAY=5 ./build/cpp/sim hello-minirv-npc.bin` | 30467 条、276562 周期、0 违例 || CSR DiffTest | `make -f Makefile.diff difftest-csr difftest-csr-fixed` | 两种延迟各 11/11 通过，0 违例 |
| 负向注入（真实 RTL） | 见第 4 节 | 37 条违例、`verdict=fail`、退出 1 |

## 4. 负向注入

在 `build/bus-injection/vsrc/` 复制一份 RTL，只改 `ysyx_00000000_ifu.v` 一行：
把 `ifu_reqValid` 的状态条件从 `state == IDLE` 改成 `state == IDLE || state == WAIT`，
即"等待回复期间仍拉高请求"。正式 `vsrc/` 未改动，补丁见 `ifu-injection.diff`。

| 运行 | 结果 |
|---|---|
| 正确 RTL（`build/bus-clean/regress/cpu_test`） | `PASS: 11 checks`、0 违例、退出 0 |
| 注入 RTL（`build/bus-injection/regress/cpu_test`） | 从 cycle=1 起报告 `ifu_request_while_pending`，共 37 条、`Bus: FAIL`、`verdict=fail`、退出 1 |

补充说明：这次注入也改变了执行时序（retired 6 而非 5），因此功能检查也出现 2 项不符；
它证明的是"监视器能抓住协议违例并否决运行"，不代表该故障只能被协议监视发现。
功能完全不受影响、只有协议违例的注入用例本次没有构造。

## 5. 未覆盖范围

- **SoC 通路**：`tests/soc_main.cpp` 直接驱动 `SimTop` 和 ysyxSoC 的 MemBridge，
  不经过 `sim_session`，本步骤不覆盖；若要覆盖需在 `soc_main.cpp` 的推进循环里另接监视点。
- **自驱入口**：`tests/csr_test.cpp`、`tests/gpio_apb_test.cpp` 各自驱动 Verilator 循环，
  也不经过 `sim()`，同样不在本次范围。
- **提交相关判据**：没有检查"某条指令是否在拿到回复前就提交"，
  这需要按指令类型把在途请求归属到具体指令，留待后续。

## 6. 复现

```bash
cd /home/ysyx/ysyx-workbench/npc
make -f Makefile.cpptest test-bus-monitor
make -f Makefile.cpptest regress
# 负向注入
make -f Makefile.cpptest BUILD_DIR=build/bus-injection/bin \
  VSRCS="$(ls build/bus-injection/vsrc/*.v | tr '\n' ' ')" build
```

证据文件：`unit-test.log`、`regress.log`、`am-hello.log`、`am-hello-fixed5.log`、
`clean-run.log`、`injected-run.log`、`ifu-injection.diff`、
`injection-cpu-test-build.log`、`clean-cpu-test-build.log`、`csr-difftest.log`。
