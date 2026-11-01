# E7 测试库设计

正式环境为 WSL Ubuntu-22.04，工作目录是 `/home/ysyx/ysyx-workbench/npc`。
Windows `E:\ysyx\e\e7` 是独立副本。完整命令见[阶段测试索引](../../../测试与构建入口索引.md#e7)，实际结果见[E7 学习记录](../../E7学习记录.md)。
测试索引维护在 Windows 的 `E:\ysyx\e\测试与构建入口索引.md`；上述相对链接用于 Windows 副本和仓库布局，WSL 内可从 `/mnt/e/ysyx/e/` 访问索引及 E7 学习记录。

## 分层与职责

下表路径相对 npc。独立 NPC 的运行模型与 SoC 保持分开。

| 层 | 文件 | 输入、输出与职责 | 边界 |
|---|---|---|---|
| L0 | csrc/check.h | checker 接收检查值，输出诊断、计数与 report 返回值；diff_collector 收集多字段差异 | 不依赖 Verilator，不推进 CPU |
| L0 | csrc/test_suite.h | 引入 check.h，保留 test_suite 别名 | 不另维护检查实现 |
| L1 | csrc/cpu_view.h | 读取独立 CPU 的 PC、指令、commit、illegal、GPR 与读端口 | 只有这里依赖内部生成层级；不适用于 VSimTop |
| L2 | csrc/sim.h、sim.cpp | sim_session 管理初始化、复位、单拍推进、计数、回复延迟和 FST 生命周期 | 报告事件，不决定案例是否通过 |
| L2 | csrc/pmem.h、pmem.cpp | 装载镜像，维护 0x80000000 起的 128 MiB 内存及原有设备 | 与 EMU 内存独立，不承担 SoC Flash/PSRAM 模型 |
| L2 | csrc/dpi.h、dpi.cpp | 接收提交后的 ebreak，记录 halted/halt_pc 与 finish | 不代替 EXPECT 判断 |
| L3 | tests/am_main.cpp | bin、可选波形路径；检查 ebreak 和 a0==0 | 用于 AM 程序，不套用到任意手写结果 |
| L3 | tests/cpu_test.cpp | bin、expect、案例名、可选波形；保存轨迹并执行 EXPECT | 不执行参考模型 |
| L3 | tests/difftest.cpp | NPC 一拍、EMU 一条，逐提交比较并检查整块内存 | 提交前采样只读，不额外 eval |
| L3 | tests/soc_main.cpp | VSimTop、Flash 镜像、可选 FST | 独立 SoC 驱动，本轮只搬移，不纳入 RESULT 和独立 NPC 延迟模型 |
| 调度 | tests/expectations.h | 解析 EXPECT；把检查加入调用方的 checker 并 report | 保持既有检查数量、顺序与语义 |
| 调度 | tests/run_cpu_tests.py | 汇编、INJECT、expect 文件、runner 子进程与组汇总 | 只用退出码和 RESULT 判定，不解析 PASS 文案 |
| 调度 | tests/run_acceptance.py | 三个程序分别运行 NPC、EMU、DiffTest，保存日志和结果表 | 一后端启动失败或超时后继续后续后端 |
| 调度 | tests/check_acceptance_wave.py | 从 VCD 抽查指定 add/lw/sb 提交沿 | 是案例波形检查，不是通用协议监视器 |
| 工具 | tools/mkprog.py、tests/test_mkprog.py | 小汇编器和独立自测 | 只支持现有 minirv 语法；异常名为 assembly_error |
| 构建 | Makefile.cpptest、diff、wave、test、soc、tests/Makefile.mk | 保留原目标，新增顺序执行的 regress | 上层 AM 的 run/diff 调用不变 |

checker 使用 eq_u32、ne_u32、in_range、masked_eq、aligned、bytes_eq、all 等既有方法。
report 在有失败或零项检查时返回非零。CHECK_* 宏保留文件和行号；test_suite 仍是兼容别名。
diff_collector.total()/failures()/differences() 用于一次指令比较；整轮累计数在 runner 中保存。
没有增加继承、插件或新的第三方依赖。

## 单拍事件、停止原因和判定

| step_event | 意义 | 周期与退休数 |
|---|---|---|
| waiting | 实际推进一个未提交的等待拍 | cycles+1 |
| committed | 提交普通指令 | cycles+1、retired+1 |
| halted | ebreak 提交，DPI 已通知结束 | cycles+1、retired+1 |
| rejected | 低电平求值后拒绝非法指令 | 不产生上升沿；cycles/retired 不变 |
| fault | 低电平求值后发现取指未对齐 | 不产生上升沿；cycles/retired 不变 |

正常一拍有两次时间递增；rejected/fault 只有第一次低电平求值，时间加 1。
attempts 是采样到 commit 的次数，含被拒绝指令；retired 含 ebreak、不含被拒绝指令。
gotFinish 后调用方停止推进，已经开始的 ebreak 拍仍完成尾部求值。

stop_reason 包括 running、ebreak、rejected、fetch_unaligned、cycle_limit、attempt_limit、
external_finish、comparison_mismatch、reference_fault。running 只用于运行过程中。
预期非法案例可在 rejected 时通过；未对齐、预算耗尽、比较不一致和参考模型故障均失败。
AM 要求 ebreak 且 a0==0；cpu_test 要求 EXPECT 全过；DiffTest 还要求逐指令、末态和全内存一致。

EXPECT 内的 `step_failed` 现在只表示 `rejected`；`fetch_unaligned` 使用独立停止原因判失败，普通合法程序的 `hit_ebreak` 等检查也会失败。现有23个手写案例不走此 fault 路径，因此常规检查数不变；该路径另有临时故障探针覆盖。

run_result 是停止时的快照：reason、stop_pc、stop_inst、cycles、retired、attempts、mem_delay。
拒绝和故障使用该拍低电平采样；ebreak 使用 DPI halt_pc；预算耗尽读最后求值后的 PC/指令，不额外 eval。
sim_session 在 init 时绑定 DUT，reset()/step() 不重复传 DUT；进程内仍只有一份原有静态仿真状态。
对象依次创建 ctx、dut、sim，析构逆序；session 调用 dut.final() 后关闭并销毁 FST，再析构 dut 和 ctx。

## RESULT 与错误处理

独立 NPC 三种入口每次运行结束输出一行：

```text
RESULT case=<案例> backend=<am|npc|diff> verdict=<pass|fail> stop=<原因> pc=0x... inst=0x... cycles=<周期> retired=<退休数> attempts=<尝试数> checks=<EXPECT或AM检查数> failures=<失败数> delay=<random|fixed:N>
```

diff 追加 core、core_fail、extra、extra_fail、memory、memory_fail。
每条比较仍为 PC 加 x0..x15 共 17 项，辅助项单独累计；memory=0 表示未执行内存比较。
没有 EXPECT 的 DiffTest 可以 checks=0，但只有 core/extra、停止条件、128 MiB 内存和 AM a0 条件全部满足才通过。

独立 EMU 保留原逐条日志，增加：

```text
RESULT case=<镜像文件名> backend=emu verdict=<pass|fail> stop=<原因> retired=<退休数> a0=0x... halt_pc=0x...
```

手写 NPC/DiffTest 的 case 是传入的组名/案例名；AM、无 EXPECT 的 DiffTest 和独立 EMU 使用镜像文件名。
EMU 的非法、故障、步数上限对应 rejected、reference_fault、attempt_limit。

参数、镜像装载和初始化失败返回非零，不打印 RESULT；进入运行后的各停止路径打印唯一 RESULT。
Python 按后端检查必填键、重复键、案例名、后端和退出码/verdict 一致性；未知扩展键忽略。
缺失、多行或格式错误的 RESULT 都失败，不回退读取人读日志。报告保留 stdout/stderr 诊断。

## 配置与预算

NPC_MEM_DELAY=0 为原 LFSR 随机 1～20 拍，种子为 0xACE1；1～20 为固定回复拍数，其他输入拒绝。
固定模式不推进 LFSR。CPU 的 IFU、LSU RANDOM_REQ 参数仍为 0，回复延迟与请求随机化是不同配置。

| 入口 | 周期上限 | 提交尝试上限 |
|---|---|---|
| am_main | 500000000000 | 不设 |
| cpu_test | 64000 | 不设 |
| difftest | 640000003 | 10000000 |
| 独立 EMU | 不计周期 | 原 1000 步上限 |

DiffTest 先检查循环的尝试预算，再检查周期预算；等于上限便停止，已提交 ebreak 优先正常结束。
两个 Python 调度器的子进程超时均为 60 秒，只用于防挂死，不替代仿真预算。
SoC 仍沿用自己的 1e8 周期观察上限，本轮不改验收规则。

## 案例组与使用时机

具体工作目录和完整命令维护在阶段测试索引，下表列出现有目标。

| 案例或检查 | 数量与覆盖 | 适用时机 | 目标 |
|---|---|---|---|
| functional | 4；算术、字/字节访存、调用返回 | 改运行接口或基础功能后 | test-functional |
| boundary | 14；非法编码、寄存器边界、立即数、跳转、x0 | 改停止事件、轨迹或 EXPECT 后 | test-boundary |
| 普通回归 | 上述 18 项；默认随机及固定一拍 | 改单拍推进和计数后 | test-all、test-fixed |
| DiffTest 规模组 | 2；small、medium | 改比较与统计后 | difftest-scale |
| 完整手写 DiffTest | 4+14+2+3，共 23 项 | 改仿真或差分入口后 | difftest、difftest-fixed |
| acceptance | 3 程序 × NPC/EMU/DiffTest | 改输出协议或调度后 | test-acceptance |
| 通用库自测 | 含故意失败、零检查和多差异 | 改 check.h 时 | test-library |
| 波形 | add/lw/sb 的提交沿、写回与移位掩码 | 改推进顺序和完成事件后 | check-waves |
| 汇编器 | 编码、范围、标签和输入错误 | 改 mkprog 时 | test_mkprog.py 的 unittest |
| AM、RV32I | 完整 C 程序和整数指令回归 | 核心重构及最终构建验收 | 索引中 AM/ISA DiffTest 命令 |

regress 依次调用 lint、test-library、test-all、test-fixed、difftest、difftest-fixed、
test-acceptance、check-waves；使用递归配方确保顺序。它不包含完整 AM、RV32I、SoC 或 archbench。
test-library 中途的故意 FAILED 是自测输入，最终 report 和退出码决定该入口是否通过。
AM cpu-tests 的汇总过滤存在旧问题，验收要核对各案例，不能只看 make 返回 0。

## 手写案例与 EXPECT

programs/functional、boundary、difftest、acceptance 分别保存相应组。
首行注释简述程序检查的行为，随后保留 EXPECT/INJECT，源码与期望一起维护。

| EXPECT 项 | 含义 |
|---|---|
| instructions N | 成功退休数，含 ebreak、不含拒绝 |
| cycles N | 无条件精确周期 |
| cycles_fixed D N | 仅 NPC_MEM_DELAY=D 时检查 N |
| cycles_random N | 仅默认确定性随机配置检查 N |
| halt 地址 | ebreak 的 CPU 地址 |
| illegal 地址 编码 | 在指定位置拒绝指定编码 |
| reg 编号 值 | x1..x15 末态；x0 用真实指令读行为验证 |
| mem 地址 值 | 4 字节对齐，位于 [0x80000000,0x88000000) |
| trace 地址... | 完整提交或拒绝的 PC 序列 |

程序 CPU 地址以 0x80000000 为基址，INJECT 仍为 bin 内偏移；jalr 语法是 jalr rd, rs1, imm。
新增案例时，先选择组并写首行说明，再写汇编、EXPECT，最后运行对应组；
需要默认随机或固定延迟精确周期时分别声明，不用一种配置的数字代替另一种。
现有 23 项案例本轮保持原样，不改变 EXPECT 以迁就重构。

## 旧阶段与 SoC 边界

| 资产 | 维护状态 |
|---|---|
| E4 数字电路实验 | 本轮不迁移、不改；未发现其源码引用 E7 旧公开类型 |
| E4 npc 与旧源码 | E5/E6/E7 和 WSL 中的 npc/e4 已按用户要求删除；独立 E:\ysyx\e\e4 备份保留，npc/tb 旧源码另保留 |
| E5/E6 手写案例 | 已作为当前 23 项维护，本轮不改汇编和期望 |
| E6 npc_test.h、npc_diff.h | 不复活；观察与检查职责由 cpu_view.h/check.h 承担 |
| SoC | 仍用 VSimTop 和 RTL 控制器，本轮只验证构建，不代表 hello 已验收 |

## 重构不变量与维护

| 编号 | 保持的行为 |
|---|---|
| F1 | 原复位顺序、请求状态清零与 LFSR 置种；不计复位周期 |
| F2 | 低电平求值→采样→请求簿记→裸上升沿 eval→计数→写内存→回复→尾部求值 |
| F3 | 非法指令仍可能 commit=1；低电平拒绝，不产生上升沿 |
| F4 | ebreak 由提交门控并在上升沿 DPI 通知，计入退休 |
| F5 | cycles、retired、attempts 分别统计，不以墙钟替代 |
| F6 | !pending && reqValid 才接受；接受当拍自减，IFU 先于 LSU 推进 LFSR |
| F7 | 原内存、设备地址与 404 MHz 计时系数保持 |
| F8 | finish 后不开始新拍，当前拍完成尾部 |
| F9 | C++ 原预算保持，Python 超时统一为 60 秒 |
| F10 | pre 采样→NPC→EMU→条件设备读同步→17项与辅助比较→结束全内存比较 |
| F11 | EXPECT 检查项数量和顺序保持 |
| F12 | Python 改用 RESULT；子进程异常不终止余下后端 |
| F13 | 原 Makefile 与 AM run/diff 调用关系保持 |
| F14 | dut.final()→FST close/reset→dut/ctx 析构 |
| F15 | 原三个独立入口 CLI 保持，SoC CLI/逻辑保持 |

正常波形的生成与自动抽查分开报告，自动检查不代表本人亲自阅读。
当前 Verilator 5.050 的 FST isOpen() 只判断 writer 指针；不可写路径可能仍报告成功，这是沿用的工具限制。
本轮用临时故障注入验证初始化失败清理，没有把不可写路径探针算作通过，也没有修改第三方运行库。

职责和结果语义维护在本 README，完整命令以测试索引为准，实际运行结果只写学习记录。
入口变更时一起维护索引与设计说明；不另建平行验收台账。
