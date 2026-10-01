# lcthw：双向链表与链表算法练习

这是我学习《笨办法学 C》练习 32～33 时整理的 C 数据结构库。它以教材示例为起点，包含我的实现、扩展和测试；不是从零原创的通用数据结构框架。

## 内容

- `src/lcthw/list.h`、`list.c`：双向链表、头尾插入和移除、复制、连接与拆分。
- `src/lcthw/list_algos.h`、`list_algos.c`：冒泡排序、归并排序和有序插入。
- `tests/`：链表及算法的单元测试。
- `Makefile`：构建静态库、动态库并运行测试。

## 构建与测试

在 Linux 中进入本目录后运行：

```sh
make all
```

`all` 会先生成 `build/liblcthw.a` 和 `build/liblcthw.so`，再构建并运行测试。首次构建不要只运行 `make tests`，因为这个目标本身没有声明对静态库的依赖。构建产物不提交到仓库。

## 来源

本项目是对 Zed A. Shaw 的 *Learn C the Hard Way* 相关练习和示例代码的学习与扩展。教材作者公开的[示例代码](https://github.com/zedshaw/learn-c-the-hard-way-lectures)采用 MIT 许可；本项目保留原作者声明，个人实现与改动也采用 MIT 许可，详见 [`LICENSE`](LICENSE)。
