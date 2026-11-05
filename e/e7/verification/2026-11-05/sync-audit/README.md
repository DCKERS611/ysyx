# E7 原路径同步审计与修正（2026-11-05）

源：Ubuntu-22.04 `/home/ysyx/ysyx-workbench`；目标：`E:/ysyx/e/e7`。本报告记录维护审计，不属于学习记录，也不代表重新执行功能测试。

## 已核实并修正的问题

| 问题 | 原状与修正 |
|---|---|
| ECC 目录被重新命名 | 先前把部分配置放到 `synthesis/ecc-npc*`。现保留 `ecc/light`、`ecc/npc`、`ecc/npc-e7` 原始工程及完整 runs；5份错位副本逐一核对哈希后移到 `previous-wrong-layout` 留档。 |
| 诊断运行只留附加证据 | `diagnostic-balance-200mhz-20261105` 的63文件原先未在规范目录同步；现位于 `ecc/npc-e7/runs/diagnostic-balance-200mhz-20261105/`。verification 中原有选取报告继续作为附加副本。 |
| Git 忽略规则被覆盖 | WSL 根 `.gitignore` 的默认拒绝规则覆盖了 Windows 发布策略，隐藏大量新增目录。已恢复 E7 发布规则，不再笼统忽略 ecc、build、log、FST；依赖内部的忽略规则通过明确的文件清单收录处理。 |
| 子集核验被说成完整同步 | 1176/1184等数字是当时按扩展名选取的子集。八目录与根文件完整审计共1362个普通文件，其中1360个原已一致；实际只漏了 `hello.c.bak`，另一个差异是有意独立维护的根README。191个未纳入旧筛选的文件多数本来就存在，不能虚称它们全丢失。 |
| 链接被展开 | 6个原有文件链接被复制成普通文件。已恢复原生符号链接；新增纳入的NEMU目录链接也保留链接类型，共7个。 |
| 测试证据只选日志或全排 build | 现按原路径保留报告、波形、JSON、EXPECT、测试源码、输入镜像、反汇编等；排除obj_dir、对象/库文件、临时ELF可执行文件和缓存；上游跟踪的debug/bin/RTOSDemo*.axf预置镜像作为测试输入保留，具体逐项列入清单。 |
| Git执行权限未单独核验 | 本次暂存内容与源逐一比较，校正292项执行位；所有300个源可执行文件均按100755收录，其余普通文件按100644、链接按120000收录。 |
| 当前导航仍指错位快照 | README、计划、测试索引已改指 `ecc/...`。同步约定写入E7 AGENTS，旧学习与验收记录不改写成新测试结果。 |

## 本次边界与核验

- 共6010个普通文件，568836882字节；7个符号链接；1626个目录，包括本地保留的空目录。Git不存空目录，目录清单用于说明原结构。
- 其中1579个文件位于build相关目录，按文件性质保留，并非整包上传编译输出。
- NEMU、FCEUX、ECC smoke等也按工作台原相对路径保存；保存历史工程不等于本轮新增E7验收。
- `ecc/ecc`、`ecc/_internal`、安装压缩包、PDK、嵌套Git元数据、缓存与编译程序明确排除。所有选取文件均逐一SHA-256核对；第二次只读同步审计差异为0。
- Windows根README和.gitignore分别是学习导航和发布规则，两项明确例外。WSL原件在 `wsl-workbench-root` 保留原始字节；不是让WSL覆盖Windows文档。
- 原始文件字节由 `.gitattributes` 保持；源Unix可执行位另核对Git索引，原生链接按Git链接类型收录。
- 不更改WSL源码、不迁移或删除源目录；Windows独有资料与历史备份保留。E5、根AGENTS和根backups的未提交改动不属于本次范围。
- 本次没有编译、仿真、DiffTest或P&R。正式综合成绩仍是BALANCE 3、100MHz约束、综合估计141MHz；200MHz约束下254MHz仅为已有诊断结果。

## 证据与重复操作

- `before-source.json`：修正前完整源码清单、差异、链接及构建证据分类。
- `before-ecc.json`：修正前ECC工程文件哈希与错位路径。
- `before-history.json`：Git历史、忽略规则及文档导航问题。
- `before-additional-projects.json`：其他工作台项目的原始清单统计。
- `removed-mapping-proof.json`：错位副本与原路径内容相同的核对证据；文件已归档，没有丢弃。
- `sync-manifest.json`：完整源/目标路径、SHA-256、源可执行位、链接、目录及排除清单。

在Windows PowerShell中执行 `E:/ysyx/e/e7/tools/sync_wsl_snapshot.ps1` 默认只审计；加 `-Apply` 才同步，并在Windows侧创建原生链接、返回WSL复核。不再创建或使用扩展名白名单，也不把verification当作源目录替代品。发布版本以包含本文件的Git提交为准。
