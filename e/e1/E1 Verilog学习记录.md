# E1 Verilog学习记录

最近更新：2026-09-06。

**当前进度**：计数器专题已阶段性完成；随后学习了移位寄存器、Galois LFSR、Rule 110、生命游戏、串行接收、奇偶校验、Moore/Mealy FSM、独热方程、带数据通路的定时器，以及根据仿真波形反推组合/时序电路。用户已确认 Lemmings 1 和生命游戏后发的平衡加法树版本通过；其余近期练习主要记录为“已讨论或已定位错误”，没有把未展示的平台结果写成已通过。

早期进度与验证状态见第23节，2026-08-28之后的学习总结与当前接续点见第24～30节。下一轮对话先阅读同目录的 [E1 工作交接书](E1%20工作交接书.md)，再从本文末尾的最新接续点继续。

## 1. Verilog 的核心认识

### 1.1 Verilog 描述的是硬件，不是程序执行步骤

**核心理解**：代码长短不等于硬件规模，`always` 的数量也不等于触发器数量。

```verilog
assign z = (x ^ y) & x;
```

这一句话会综合出对应的组合逻辑电路。

```verilog
always @(posedge clk) begin
    q0 <= d0;
    q1 <= d1;
    q2 <= d2;
end
```

虽然只有一个 `always`，但会生成 3 个 D 触发器，因为有 3 个寄存器在时钟沿更新。

**关键点**：

- `assign`：描述连续工作的组合逻辑。
- `always @(*)`：描述组合逻辑过程。
- `always @(posedge clk)`：描述上升沿触发的时序逻辑。
- 时序块中有多少位状态被赋值，通常就会生成多少位寄存器。

---

## 2. 组合逻辑

### 2.1 `assign` 与 `always @(*)`

简单表达式优先使用 `assign`：

```verilog
assign out = a & b;
assign min = (a < b) ? a : b;
```

多分支逻辑使用 `always @(*)`：

```verilog
always @(*) begin
    case (sel)
        2'b00: out = in0;
        2'b01: out = in1;
        2'b10: out = in2;
        2'b11: out = in3;
    endcase
end
```

### 2.2 锁存器问题

**核心问题**：组合逻辑中，如果输出没有在所有路径下赋值，会推断锁存器。

错误示例：

```verilog
always @(*) begin
    if (enable)
        out = in;
end
```

修复方法：

```verilog
always @(*) begin
    out = 1'b0;
    if (enable)
        out = in;
end
```

**例外**：如果题目本来就要求锁存器，不完整赋值是有意保存状态。

---

## 3. 向量与运算符

### 3.1 位运算与逻辑运算

```verilog
~a       // 按位取反
a & b    // 按位与
a | b    // 按位或
a ^ b    // 按位异或
a ~^ b   // 按位同或
```

逻辑运算：

```verilog
!a
a && b
a || b
```

**区别**：位运算分别处理向量中的每一位；逻辑运算把整个向量当作真假值。

边沿检测等逐位操作必须使用位运算：

```verilog
prev_in & ~in
```

不能写成：

```verilog
prev_in && !in
```

### 3.2 缩减运算

```verilog
&in     // 所有位相与，结果1位
|in     // 所有位相或，结果1位
^in     // 所有位异或，结果1位
```

偶校验位：

```verilog
assign parity = ^in;
```

### 3.3 向量相等

错误理解：

```verilog
assign z = ~(A ^ B);
```

如果 `A`、`B` 是 2 位，这个表达式也会产生 2 位结果，而 `z` 只有 1 位，会发生截断。

正确写法：

```verilog
assign z = (A == B);
```

或者：

```verilog
assign z = &(A ~^ B);
```

**关键理解**：先逐位同或，再把所有比较结果相与。

### 3.4 拼接与复制

```verilog
{a, b, c}       // 拼接
{32{sub}}       // 将sub复制32次
```

可控反相：

```verilog
assign b_xor = b ^ {32{sub}};
```

```text
sub=0：b与全0异或，b保持不变
sub=1：b与全1异或，b逐位取反
```

因此：

```text
sub=0 → a+b
sub=1 → a+~b+1 = a-b
```

### 3.5 动态部分选择

```verilog
vector[base +: width]
vector[base -: width]
```

例如：

```verilog
a[i*4 +: 4]
```

```text
i=0 → a[3:0]
i=1 → a[7:4]
i=2 → a[11:8]
```

---

## 4. 模块与层次化设计

### 4.1 模块类型与实例名

```verilog
my_dff dff1 (...);
```

```text
my_dff：模块类型，必须与定义完全一致
dff1：实例名，可以自定义，但不能重名
```

### 4.2 按名称连接

```verilog
mod_a u_mod_a (
    .in1(a),
    .in2(b),
    .out(out)
);
```

语法：

```text
.子模块端口名(当前模块信号名)
```

左边必须是子模块真实存在的端口名。

### 4.3 按位置连接

```verilog
mod_a u_mod_a (out1, out2, a, b, c, d);
```

必须严格按照子模块声明顺序连接。

**规则**：一个实例中不要混用名称连接和位置连接。

### 4.4 题目是否要求自己写子模块

- `provided`：题目已经提供，只需要实例化。
- `not provided`：需要自己编写。
- 子模块定义写在 `top_module` 外部，不能嵌套。

### 4.5 结构化写法与 RTL 写法

结构化写法：

```verilog
dff dff0 (...);
dff dff1 (...);
dff dff2 (...);
```

RTL 写法：

```verilog
always @(posedge clk) begin
    q0 <= d0;
    q1 <= d1;
    q2 <= d2;
end
```

两种写法可以实现相同硬件。题目明确要求实例化时使用结构化写法；普通 `Build this circuit` 通常可以直接写 RTL。

---

## 5. 多路选择器

### 5.1 通用 2:1 MUX

```verilog
assign out = sel ? in1 : in0;
```

```text
sel=0 → out=in0
sel=1 → out=in1
```

### 5.2 MUX 与卡诺图

如果规定 `a、b` 作为 4:1 MUX 的选择信号，那么：

```text
ab=00 → 选择mux_in[0]
ab=01 → 选择mux_in[1]
ab=10 → 选择mux_in[2]
ab=11 → 选择mux_in[3]
```

固定 `ab` 后，卡诺图的一列就变成只关于 `c、d` 的函数。

例如某题得到：

```verilog
mux_in[0] = c | d;
mux_in[1] = 1'b0;
mux_in[2] = ~d;
mux_in[3] = c & d;
```

`c、d` 并不是被“扩展”为 4 位，而是同时送入 4 个不同的组合函数，产生 4 根候选数据线。

这不是 2-4 译码器。2-4 译码器通常产生 one-hot 输出；这里的 4 位是任意的 4 个布尔函数。

**易错点**：卡诺图列顺序通常为：

```text
00、01、11、10
```

MUX 编号顺序为：

```text
00、01、10、11
```

最后两列需要交换后再连接到 `mux_in[2]`、`mux_in[3]`。

---

## 6. 优先编码器

`if/else if` 的书写顺序决定优先级：

```verilog
if (in[0])
    pos = 0;
else if (in[1])
    pos = 1;
```

这里 `in[0]` 的优先级高于 `in[1]`。

**关键理解**：优先方向不是 Verilog 固定规定的，必须根据题目示例判断。

例如输入中 `in[7]` 和 `in[4]` 都为 1，但题目输出 4，说明题目从低下标向高下标寻找。

---

## 7. 加法器与减法器

### 7.1 半加器

```verilog
assign sum  = a ^ b;
assign cout = a & b;
```

### 7.2 全加器

```verilog
assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (a & cin) | (b & cin);
```

使用算术表达式时应注意位宽。安全写法：

```verilog
assign {cout, sum} = {1'b0, a} + {1'b0, b} + cin;
```

### 7.3 串行进位加法器

```text
第0级cout → 第1级cin
第1级cout → 第2级cin
……
```

两个 `add16` 拼成 32 位加法器：

```text
低16位cin=0
低16位cout连接高16位cin
```

不能让两个 `add16` 的 `cin` 都接 0，否则低位进位无法传递到高位。

### 7.4 进位选择加法器

高 16 位提前计算两种结果：

```text
high_sum0：假设cin=0
high_sum1：假设cin=1
```

再由低位真实进位选择：

```verilog
assign sum[31:16] = carry_low ? high_sum1 : high_sum0;
```

### 7.5 有符号溢出

**判断规则**：两个同号数相加，结果却变号。

```verilog
assign s = a + b;
assign overflow = ~(a[7] ^ b[7]) & (a[7] ^ s[7]);
```

等价写法：

```verilog
assign overflow = (a[7] ^ s[7]) & (b[7] ^ s[7]);
```

最终进位 `cout` 不等于有符号溢出。

---

## 8. `generate` 与重复结构

### 8.1 `generate` 的本质

**核心定义**：`generate` 是精化阶段（elaboration time）的代码生成结构，不是一个硬件元件。

```text
编译时根据参数和genvar展开代码
              ↓
等价于手动复制模块实例或assign语句
              ↓
展开后的硬件并行工作
```

**关键理解**：

- `generate` 不会在硬件运行时循环。
- `generate` 本身不是组合电路，也不是时序电路。
- 它只决定最终生成哪些代码、生成多少份。
- 循环次数和生成条件必须在编译时确定。

### 8.2 循环生成 `for`

```verilog
genvar i;
generate
    for (i = 0; i < 100; i = i + 1) begin : gen_bcd
        bcd_fadd u_bcd (
            .a   (a[i*4 +: 4]),
            .b   (b[i*4 +: 4]),
            .cin (carry[i]),
            .cout(carry[i+1]),
            .sum (sum[i*4 +: 4])
        );
    end
endgenerate
```

其中：

```text
genvar i       ：生成循环变量
100            ：编译时确定的循环次数
begin : gen_bcd：生成块名称
```

展开后的层次类似：

```text
gen_bcd[0].u_bcd
gen_bcd[1].u_bcd
...
gen_bcd[99].u_bcd
```

每个 `u_bcd` 位于不同的生成块作用域中，因此实例名不会冲突。

### 8.3 条件生成 `if`

```verilog
parameter USE_FAST = 1;

generate
    if (USE_FAST) begin : gen_fast
        fast_counter u_counter (...);
    end else begin : gen_slow
        slow_counter u_counter (...);
    end
endgenerate
```

`USE_FAST` 必须是编译时常量或参数：

```text
USE_FAST=1 → 只生成fast_counter
USE_FAST=0 → 只生成slow_counter
```

这不是运行时 MUX；未选中的分支不会成为最终硬件。

### 8.4 `generate case`

```verilog
parameter MODE = 1;

generate
    case (MODE)
        0: begin : gen_add
            assign out = a + b;
        end
        1: begin : gen_sub
            assign out = a - b;
        end
        default: begin : gen_zero
            assign out = 0;
        end
    endcase
endgenerate
```

| 对比项 | 普通 `case` | `generate case` |
|---|---|---|
| 判断对象 | 运行时输入 | 编译时常量或参数 |
| 作用 | 运行时选择 | 选择生成哪种结构 |
| 典型结果 | 组合选择逻辑/MUX | 只保留选中的分支 |

### 8.5 `generate for` 与 `always for`

`generate for`：

```verilog
genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin : gen_inv
        assign out[i] = ~in[i];
    end
endgenerate
```

`always` 中的 `for`：

```verilog
integer i;
always @(*) begin
    for (i = 0; i < 8; i = i + 1)
        out[i] = ~in[i];
end
```

| 对比项 | `generate for` | `always for` |
|---|---|---|
| 循环变量 | `genvar` | `integer` |
| 描述层次 | 结构级 | 过程/行为级 |
| 常见内容 | 模块实例、`assign` | 过程赋值和计算 |
| 使用位置 | 过程块外部 | `always` 内部 |

两者综合后可能得到相同硬件，但表达意图不同。

### 8.6 索引部分选择

```verilog
q[i*4 +: 4]
```

展开后：

```text
i=0 → q[3:0]
i=1 → q[7:4]
i=2 → q[11:8]
i=3 → q[15:12]
```

基本形式：

```verilog
vector[base +: width]  // 从base向高位取width位
vector[base -: width]  // 从base向低位取width位
```

`base` 可以是表达式，`width` 必须在编译时确定。

### 8.7 四位 BCD 计数器实例

个位连接特殊，单独实例化：

```verilog
bcd_counter ones_counter (
    .clk   (clk),
    .reset (reset),
    .enable(1'b1),
    .q     (q[3:0])
);
```

十位、百位、千位使用循环生成：

```verilog
genvar i;
generate
    for (i = 1; i < 4; i = i + 1) begin : gen_counter
        bcd_counter u_counter (
            .clk   (clk),
            .reset (reset),
            .enable(ena[i]),
            .q     (q[i*4 +: 4])
        );
    end
endgenerate
```

```text
i=1 → 十位 → q[7:4]
i=2 → 百位 → q[11:8]
i=3 → 千位 → q[15:12]
```

使能信号也可以递归生成：

```verilog
assign ena[1] = (q[3:0] == 4'd9);

generate
    for (i = 2; i < 4; i = i + 1) begin : gen_enable
        assign ena[i] =
            ena[i-1] &
            (q[(i-1)*4 +: 4] == 4'd9);
    end
endgenerate
```

展开后：

```verilog
ena[1] = (q[3:0]  == 9);
ena[2] = ena[1] & (q[7:4]  == 9);
ena[3] = ena[2] & (q[11:8] == 9);
```

### 8.8 进位链的边界处理

错误写法：

```verilog
for (i = 0; i < N; i = i + 1) begin : ripple
    full_adder u_fa (
        .cin(carry[i-1])  // i=0时出现carry[-1]
    );
end
```

解决方法一：最低位单独实例化，循环从 1 开始。

解决方法二：使用比级数多一位的进位向量：

```verilog
wire [N:0] carry;
assign carry[0] = cin;
assign cout = carry[N];
```

循环中统一连接：

```verilog
.cin (carry[i]),
.cout(carry[i+1])
```

### 8.9 常见错误

1. `generate for` 使用 `integer`，而不是 `genvar`。
2. `always` 循环使用 `genvar`。
3. 循环次数依赖运行时输入信号。
4. 所有循环实例同时驱动同一根普通信号。
5. 忽略 `i=0`，产生 `carry[-1]` 等负索引。
6. 不给生成块命名，导致仿真层次难以识别。

多重驱动错误：

```verilog
generate
    for (i = 0; i < 4; i = i + 1) begin : gen_bad
        assign out = in[i];
    end
endgenerate
```

这里 `out` 被4个 `assign` 同时驱动。通常应分别驱动：

```verilog
assign out[i] = in[i];
```

### 8.10 当前使用原则

- 简单重复模块：使用 `generate for`。
- 参数决定不同结构：使用生成 `if/case`。
- 过程块内部的重复计算：使用普通 `for`。
- 最低位或最高位连接特殊：单独处理边界。
- 块名使用功能名称，如 `gen_counter`、`ripple`、`gen_dff`。

---

## 9. 卡诺图

### 9.1 分组规则

- 行列使用格雷码：`00、01、11、10`。
- 只允许上下、左右相邻，不允许对角相邻。
- 上下边界相邻，左右边界相邻。
- 分组大小必须是 `1、2、4、8……`。
- SOP 对 1 分组，POS 对 0 分组。
- `d` 是无关项，可以按需要当作 0 或 1。
- 组内变化的变量消去，不变的变量留下。

### 9.2 棋盘格规律

卡诺图呈棋盘格时，通常对应奇偶校验：

```verilog
assign out = a ^ b ^ c ^ d;
```

### 9.3 德摩根定律

```verilog
~(a & b & c)
```

等价于：

```verilog
~a | ~b | ~c
```

不等于：

```verilog
~a & ~b & ~c
```

检查卡诺图表达式时，可以找一个图中为 0 的输入组合代入。如果表达式输出 1，说明某个乘积项覆盖了不该覆盖的 0。

---

## 10. 时序逻辑与电路图分析

### 10.1 D 触发器

```verilog
always @(posedge clk) begin
    q <= d;
end
```

时序逻辑使用非阻塞赋值 `<=`。

### 10.2 从电路图写 Verilog 的固定步骤

1. 找出所有 D 触发器，给每个 `Q` 命名。
2. 从每个触发器的 `D` 端向左追线。
3. 写出每个下一状态方程 `D=f(输入, 当前Q)`。
4. 把相同时钟的状态更新写入 `always @(posedge clk)`。
5. 单独写输出组合逻辑。
6. 检查复位、使能和优先级。

核心关系：

```text
Q：当前状态
D：下一状态
组合逻辑：计算D
时钟沿：把D保存到Q
```

### 10.3 MUX + DFF

```verilog
always @(posedge clk) begin
    Q <= L ? R : (E ? w : Q);
end
```

功能：

```text
L=1        → Q_next=R，装载
L=0,E=1    → Q_next=w，移位
L=0,E=0    → Q_next=Q，保持
```

“并行装载”是整个多位电路的功能：所有级在同一时钟沿分别装入自己的 `R[i]`。

### 10.4 一个 `always` 描述多个 DFF

```verilog
always @(posedge clk) begin
    q_top <= x ^ q_top;
    q_mid <= x & ~q_mid;
    q_bot <= x | ~q_bot;
end
```

右侧使用的是时钟沿前的旧状态，三个左侧寄存器在时钟沿后同时更新。

纯组合输出应单独写：

```verilog
assign z = ~(q_top | q_mid | q_bot);
```

如果把 `z` 也放进时钟块，会额外生成一级寄存器，改变电路行为。

---

## 11. 复位

### 11.1 同步复位

```verilog
always @(posedge clk) begin
    if (reset)
        q <= 0;
    else
        q <= d;
end
```

只有时钟上升沿到来时才检查 `reset`。

### 11.2 异步复位

```verilog
always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 0;
    else
        q <= d;
end
```

`reset` 上升后立即复位，不需要等待时钟。

### 11.3 对 reset 波形的理解

对于高电平有效同步复位：

```text
reset上升：进入复位请求
clk上升沿且reset=1：寄存器真正清零
reset下降：解除复位，不是执行复位
```

---

## 12. 边沿检测与捕获保持

### 12.1 检测边沿

```verilog
reg [31:0] prev_in;
```

```verilog
(~prev_in) & in   // 上升沿：0→1
prev_in & ~in     // 下降沿：1→0
prev_in ^ in      // 任意变化
```

### 12.2 检测与捕获的区别

```verilog
out <= prev_in & ~in;
```

只能产生一个周期的下降沿脉冲。

题目若要求捕获后一直保持为 1：

```verilog
always @(posedge clk) begin
    prev_in <= in;

    if (reset)
        out <= 32'b0;
    else
        out <= out | (prev_in & ~in);
end
```

```text
prev_in & ~in：检测本周期是否发生下降沿
out | pulse：保存以前已经捕获的事件
reset：清除所有捕获结果
```

由于使用非阻塞赋值，检测表达式中的 `prev_in` 是上一周期的值。

---

## 13. `wire` 与 `reg`

Verilog-2001 中：

- `assign` 驱动的信号通常声明为 `wire`。
- `always` 中被赋值的信号必须声明为 `reg`。

```verilog
output reg [31:0] out;
```

如果题目给出：

```verilog
output [31:0] out;
```

可以改成 `output reg`，接口方向和位宽没有变化。

也可以保留原声明，使用内部寄存器：

```verilog
reg [31:0] out_reg;
assign out = out_reg;
```

**注意**：`reg` 表示可以在过程块中赋值，不代表一定会综合成寄存器；是否需要存储由代码行为决定。

---

## 14. 高频错误记录

1. 模块名拼错，例如 `my_dff` 写成 `my_diff`。
2. `.端口(信号)` 左侧写成顶层信号名，而不是子模块端口名。
3. 混用位置连接和名称连接。
4. 题目提供的模块被重复定义，或题目要求实现的模块被漏写。
5. 把 32 位端口声明成 1 位后再访问 `[31:16]`。
6. 向量同或后直接赋给 1 位输出，忘记缩减与。
7. 把 `~(a & b)` 误写或误解成 `~a & ~b`。
8. 忽略卡诺图格雷码顺序。
9. 不看题目示例就自行决定优先编码器方向。
10. 移位寄存器的每一级都接原始 `d`，导致并联而不是串联。
11. 低位加法器的进位没有连接到高位加法器。
12. 把无符号最终进位当成有符号溢出。
13. 在 `always` 中赋值的输出忘记声明为 `reg`。
14. 时序逻辑使用阻塞赋值 `=`。
15. 组合逻辑分支不完整，无意推断锁存器。
16. 只检测边沿，没有实现捕获保持。
17. 把同步复位误认为由 `reset` 的下降沿触发。

---

## 15. 计数器专题里程碑：Count clock

### 15.1 题目目标

完成一个 12 小时制数字时钟：

```text
hh：01～12
mm：00～59
ss：00～59
pm：0表示AM，1表示PM
```

控制规则：

```text
ena=1   → 时间增加1秒
ena=0   → 所有状态保持
reset=1 → 在时钟上升沿复位到12:00:00 AM
```

关键翻转：

```text
11:59:59 AM → 12:00:00 PM
12:59:59 PM → 01:00:00 PM
```

`pm` 只在小时从 `11` 变成 `12` 时翻转，不在 `12` 变成 `01` 时翻转。

### 15.2 模块划分

最终采用层次化设计：

```text
top_module
├── bcd_counter：秒个位，0～9
├── bcd_counter：秒十位，0～5
├── bcd_counter：分个位，0～9
├── bcd_counter：分十位，0～5
└── hour_counter：小时01～12，并管理pm
```

设计取舍：

- 秒和分钟的4个数字结构相同，使用参数化 `bcd_counter` 复用。
- 小时不是普通 `00～99` BCD 计数，单独使用 `hour_counter`。
- `pm` 与 `11→12` 是同一个状态转移，放在 `hour_counter` 中更不容易失配。
- 也可以把 `pm` 单独写成翻转模块，但会把同一个状态转移拆到两个模块中。

### 15.3 参数化 BCD 数字计数器

```verilog
module bcd_counter #(
    parameter [3:0] MAX = 4'd9
)(
    input            clk,
    input            reset,
    input            enable,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 4'd0;
        else if (enable) begin
            if (q == MAX)
                q <= 4'd0;
            else
                q <= q + 4'd1;
        end
    end

endmodule
```

参数覆盖：

```verilog
bcd_counter #(.MAX(4'd9)) sec_ones (...);
bcd_counter #(.MAX(4'd5)) sec_tens (...);
```

其中 `#(...)` 在编译/精化阶段配置参数，不是运行时输入，也不是延时。

### 15.4 使能链

```verilog
assign en_sec_tens = ena & (ss[3:0] == 4'd9);
assign en_min_ones = en_sec_tens & (ss[7:4] == 4'd5);
assign en_min_tens = en_min_ones & (mm[3:0] == 4'd9);
assign en_hours    = en_min_tens & (mm[7:4] == 4'd5);
```

含义：

```text
ena=1                         → 秒个位增加
ena=1且秒个位=9              → 秒十位增加
ena=1且秒=59                 → 分个位增加
ena=1且秒=59且分个位=9       → 分十位增加
ena=1且秒=59且分钟=59        → 小时增加
```

使能必须在进位发生前的状态拉高。例如 `ss=59` 时，高位使能已经为1；在下一个时钟沿，秒清零与分钟增加同时发生。

### 15.5 小时与 AM/PM

```verilog
module hour_counter (
    input            clk,
    input            reset,
    input            enable,
    output reg [7:0] hh,
    output reg       pm
);

    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12;
            pm <= 1'b0;
        end
        else if (enable) begin
            if (hh == 8'h11) begin
                hh <= 8'h12;
                pm <= ~pm;
            end
            else if (hh == 8'h12) begin
                hh <= 8'h01;
            end
            else if (hh == 8'h09) begin
                hh <= 8'h10;
            end
            else begin
                hh <= hh + 8'h01;
            end
        end
    end

endmodule
```

小时状态变化：

```text
01～08 → 普通加1
09     → 10
10     → 11
11     → 12，同时pm翻转
12     → 01，pm保持
```

### 15.6 完整顶层

```verilog
module top_module (
    input        clk,
    input        reset,
    input        ena,
    output       pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);

    wire en_sec_tens;
    wire en_min_ones;
    wire en_min_tens;
    wire en_hours;

    assign en_sec_tens = ena & (ss[3:0] == 4'd9);
    assign en_min_ones = en_sec_tens & (ss[7:4] == 4'd5);
    assign en_min_tens = en_min_ones & (mm[3:0] == 4'd9);
    assign en_hours    = en_min_tens & (mm[7:4] == 4'd5);

    bcd_counter #(.MAX(4'd9)) sec_ones (
        .clk(clk), .reset(reset), .enable(ena),
        .q(ss[3:0])
    );

    bcd_counter #(.MAX(4'd5)) sec_tens (
        .clk(clk), .reset(reset), .enable(en_sec_tens),
        .q(ss[7:4])
    );

    bcd_counter #(.MAX(4'd9)) min_ones (
        .clk(clk), .reset(reset), .enable(en_min_ones),
        .q(mm[3:0])
    );

    bcd_counter #(.MAX(4'd5)) min_tens (
        .clk(clk), .reset(reset), .enable(en_min_tens),
        .q(mm[7:4])
    );

    hour_counter hours (
        .clk(clk), .reset(reset), .enable(en_hours),
        .hh(hh), .pm(pm)
    );

endmodule
```

所有计数器直接使用同一个 `clk`。低位到高位只通过 `enable` 传递进位，不能把低位计数器的输出当作高位时钟。

### 15.7 为什么 BCD 常量使用十六进制

```verilog
8'h12 = 8'b0001_0010  // BCD 12
8'h59 = 8'b0101_1001  // BCD 59
```

一个十六进制数字刚好对应4 bit，一个 BCD 数字也占4 bit，因此十六进制写法能直接显示每个十进制位。

```verilog
8'd12 = 8'b0000_1100  // 不是BCD 12
8'd59 = 8'b0011_1011  // 不是BCD 59
```

单个0～9数字使用 `4'd9` 或 `4'h9` 都可以，因为位模式相同。

### 15.8 阶段成果

完成 Count clock 后，计数器专题已经覆盖：

1. 普通二进制计数器。
2. 模 N 计数器和终值回绕。
3. BCD 十进制计数器。
4. 参数化计数器与 `#(...)` 参数覆盖。
5. 同步复位、使能和优先级。
6. 多级使能链与同步进位。
7. 1 Hz 单周期使能脉冲。
8. 多位 BCD 计数器。
9. 12小时制特殊状态序列。
10. AM/PM 状态翻转。
11. 子模块实例化与层次化设计。
12. 所有寄存器共用同一时钟、避免派生时钟。

**小里程碑**：计数器部分学习完成。当前已经不只是会写 `q <= q + 1`，而是能够根据计数范围、进位条件、复位值和特殊状态设计完整的同步计数系统。

### 15.9 后续追问：为什么小时没有 `en_hour_tens`

**核心问题**：小时、分钟、秒为什么采用不同的模块拆法？

- `bcd_counter` 管理一个4位BCD数位，范围由 `MAX` 决定。
- 秒和分钟各由两个独立数位组成，所以需要个位向十位传递使能。
- `hour_counter` 一次管理整个 `hh[7:0]`，内部处理 `09→10`、`11→12`、`12→01`。十位如何变化已经包含在模块内部，不需要外部再提供 `en_hour_tens`。
- 可以再封装一个 `counter_00_59`，给秒、分钟各实例化一次。这是模块层级的选择，不是语言限制。

`counter_00_59` 对外可以提供：

```verilog
assign carry = enable && (q == 8'h59);
```

这个组合信号表示“本次允许计数，且即将从59回到00”，用来使能下一级；它不是另一个时钟。

**AM/PM追问**：不需要分开判断当前是AM还是PM，因为 `pm <= ~pm` 同时完成 `0→1` 和 `1→0`。两种情况下小时都遵循同一条 `01～12` 序列。

---

## 16. 读时序电路图：先找状态，再找连线

### 16.1 为什么一个 `always` 可以描述多个触发器

**曾经的疑问**：“图里有4个D触发器，为什么不能直接写 `out <= in`？”

```verilog
always @(posedge clk)
    out <= in;
```

这里只保存了一位 `out`，描述的是一级采样，不会自动产生图中的中间三级存储。

四级串联必须描述四级状态：

```verilog
reg [3:0] q;

always @(posedge clk) begin
    if (!resetn)
        q <= 4'b0000;
    else begin
        q[0] <= in;
        q[1] <= q[0];
        q[2] <= q[1];
        q[3] <= q[2];
    end
end

assign out = q[3];
```

正常移位部分可简写为：

```verilog
q <= {q[2:0], in};
```

所有 `<=` 的右侧读取更新前的状态，左侧在同一仿真时间步的非阻塞赋值更新阶段改变；不是第一行更新后，第二行立即读取新值。

复位后只输入一次1，之后输入0：

| 采样沿 | 本次输入 | 更新后 `q[3:0]` | `out` |
|---|---:|---|---:|
| 第1个 | 1 | `0001` | 0 |
| 第2个 | 0 | `0010` | 0 |
| 第3个 | 0 | `0100` | 0 |
| 第4个 | 0 | `1000` | 1 |

**结论**：触发器数量取决于需要保存多少位独立状态，不取决于 `always` 的数量。实际综合还可能优化冗余或未使用的状态位。

### 16.2 看复位要分别判断两个维度

```text
高/低电平有效：什么时候提出复位要求？
同步/异步：是否必须等时钟沿才能执行复位？
```

低有效不等于异步。图中 `resetn` 的小圆圈表示低有效，但题目注明同步复位时，应写：

```verilog
always @(posedge clk) begin
    if (!resetn)
        q <= 4'b0000;
    else
        q <= {q[2:0], in};
end
```

不要擅自加入 `negedge resetn`。

### 16.3 变量命名与画图顺序

先给每个触发器输出命名，例如 `q0/q1/q2`，再逐个找它的D输入。组合输入可命名为 `d_next`，整组状态可命名为 `q`。

位下标不自带物理左右方向。例如某题可以选择第一级为 `q[0]`，另一个题目则明确第一级是 `Q[n-1]`。必须根据图上的标注连接，不能机械套同一个拼接。

---

## 17. `generate`：复制模块，不会自动串联模块

### 17.1 MUXDFF的三个功能

单级电路包括两个MUX和一个D触发器：

```verilog
module MUXDFF (
    input clk,
    input w, R, E, L,
    output reg Q
);
    always @(posedge clk) begin
        if (L)
            Q <= R;
        else if (E)
            Q <= w;
    end
endmodule
```

```text
L=1：并行装载R，优先级最高
L=0且E=1：移入w
L=0且E=0：保持Q
```

时序块不执行赋值时触发器保持原值，可以省略 `else Q <= Q`。

### 17.2 曾经的错误：所有实例都连接同一个 `w`

```verilog
.w(KEY[3])
```

如果在4次实例化中都这样连接，移位时4个触发器会同时采样同一位，不会串联。

题目要求的连线是：

```text
KEY[3] → Q3 → Q2 → Q1 → Q0
```

为每一级整理输入：

```verilog
wire [3:0] shift_in;
assign shift_in = {KEY[3], LEDR[3:1]};
```

| 级 | 串行输入 |
|---|---|
| Q3 | `KEY[3]` |
| Q2 | `LEDR[3]` |
| Q1 | `LEDR[2]` |
| Q0 | `LEDR[1]` |

再实例化：

```verilog
genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin : gen_muxdff
        MUXDFF u_muxdff (
            .clk(KEY[0]),
            .w(shift_in[i]),
            .R(SW[i]),
            .E(KEY[1]),
            .L(KEY[2]),
            .Q(LEDR[i])
        );
    end
endgenerate
```

使用 `3-i` 反向编号也可以，只要 `shift_in`、`SW`、`LEDR` 三者下标一致。生成次序不等于硬件中的数据流方向，数据流由端口连线决定。

### 17.3 三位装载与反馈寄存器

`SW[2:0]` 本来就是三根信号：`SW[0]` 对应 `r0`，依此类推，不需要额外的“拆分模块”。

曾做过的三位反馈电路，连接关系是：

```verilog
always @(posedge KEY[0]) begin
    if (KEY[1])
        LEDR <= SW;
    else begin
        LEDR[0] <= LEDR[2];
        LEDR[1] <= LEDR[0];
        LEDR[2] <= LEDR[1] ^ LEDR[2];
    end
end
```

此写法要求 `LEDR` 声明为 `reg [2:0]`。若题目要求实例化子模块，可把每一级封装成MUX+DFF，再显式整理各级普通输入。

---

## 18. Galois LFSR：移位与异或反馈

### 18.1 “为什么看 `q[0]`，为什么右移”

LFSR是线性反馈移位寄存器。Galois结构把反馈位送到多个指定位置，与该位置原本要接收的移位数据异或。

本题连线方向为高下标流向低下标，因此使用右移；即将移出的 `q[0]` 被接回抽头，所以反馈值是旧 `q[0]`。

这不是所有LFSR都必须用 `q[0]`。方向和反馈来源由具体电路决定，换成左移结构时也必须相应改变抽头。

### 18.2 五位LFSR

抽头位置从1开始编号。位置5、3对应下标4、2。

```verilog
always @(posedge clk) begin
    if (reset)
        q <= 5'b00001;
    else begin
        q[4] <= q[0];
        q[3] <= q[4];
        q[2] <= q[3] ^ q[0];
        q[1] <= q[2];
        q[0] <= q[1];
    end
end
```

等价拼接：

```verilog
q <= {q[0], q[4], q[3] ^ q[0], q[2:1]};
```

**真实错误**：最后一项写成 `q[0]`，导致最低位没有接收旧 `q[1]`。另一个写法 `0 ^ q[0]` 没有必要，直接写 `q[0]`；不要在拼接中引入未定宽常量导致位宽或工具兼容性问题。

参考起始序列：`00001 → 10100 → 01010 → 00101`。

### 18.3 三十二位LFSR与抽头掩码

抽头位置32、22、2、1，对应新状态的位31、21、1、0。把这些位置置1得到掩码 `32'h8020_0003`。

```verilog
module top_module (
    input clk,
    input reset,
    output reg [31:0] q
);
    localparam [31:0] TAP_MASK = 32'h8020_0003;

    always @(posedge clk) begin
        if (reset)
            q <= 32'h0000_0001;
        else
            q <= (q >> 1) ^ (q[0] ? TAP_MASK : 32'h0);
    end
endmodule
```

**关键理解**：

- `q >> 1` 完成普通移位，高位补0。
- 反馈位为0：与0异或，移位结果不变。
- 反馈位为1：掩码中为1的位置翻转。
- 最高位也包含在掩码中，因此它得到 `0 ^ 旧q[0]`。
- 掩码只是把抽头连线编码成常量，不是额外的存储器。

对于题目给出的最大长度结构，非零初态会遍历非零状态；全零状态会锁住，所以复位值取1而不是0。不是随便选择一组抽头都能得到最大长度。

---

## 19. 元胞自动机：Rule 110与生命游戏

### 19.1 共同结构

```text
q：这一代的细胞状态，保存在触发器中
next_state：根据同一份旧q计算出的下一代，属于组合逻辑
load：在下一个时钟上升沿优先加载初态data
```

```verilog
always @(posedge clk) begin
    if (load)
        q <= data;
    else
        q <= next_state;
end
```

所有细胞同时更新，不是先修改一个细胞，再让邻居读取修改后的新值。

### 19.2 Rule 110：左右方向写反的错误

题目按照高下标在左、低下标在右排列：

```text
q[i+1]   q[i]   q[i-1]
 左邻居   当前    右邻居
```

左邻居应取 `q[i+1]`，右邻居应取 `q[i-1]`；不是数组天然具有空间左右，而是本题这样定义。

规则中输出1的邻域为 `110、101、011、010、001`，可以写为：

```verilog
assign next_state[i] = (~left & center) | (center ^ right);
```

两端补0，避免越界位选择：

```verilog
wire [513:0] padded_q;
assign padded_q = {1'b0, q, 1'b0};

genvar i;
generate
    for (i = 0; i < 512; i = i + 1) begin : gen_cell
        wire left;
        wire center;
        wire right;
        assign left   = padded_q[i+2];
        assign center = padded_q[i+1];
        assign right  = padded_q[i];
        assign next_state[i] = (~left & center) | (center ^ right);
    end
endgenerate
```

上面是模块内部片段，需配合512位的 `q`、`data`、`next_state` 和时序块。

**波形证据**：从 `q=1` 开始，参考为 `1→3→7→d…`，错误代码一直保持1。原因是对 `q[1]` 读出的邻域被颠倒：正确应是 `001→1`，错误读成 `100→0`。

### 19.3 生命游戏：坐标展开与环绕

采用坐标约定：原点在左上角，`row` 向下增加，`col` 向右增加。二维网格映射到向量：

```verilog
INDEX = row * 16 + col;
```

```text
(0,0)→q[0]，(0,15)→q[15]
(1,0)→q[16]，(15,15)→q[255]
```

向量的书写方向不强制棋盘的视觉方向；这里按上述坐标约定连接即可。

```verilog
localparam integer INDEX = row * 16 + col;
localparam integer UP    = (row == 0)  ? 15 : row - 1;
localparam integer DOWN  = (row == 15) ? 0  : row + 1;
localparam integer LEFT  = (col == 0)  ? 15 : col - 1;
localparam integer RIGHT = (col == 15) ? 0  : col + 1;
```

这些声明放在两层 `generate for` 内，`row`、`col` 是 `genvar`。每个元胞的坐标在展开时已经确定，不是运行时不断执行乘法、判断边界。

以 `(0,0)` 为例，上方绕到第15行，左方绕到第15列；八邻域为：

```text
(15,15) (15,0) (15,1)
( 0,15) 当前格  ( 0,1)
( 1,15) ( 1,0) ( 1,1)
```

### 19.4 为什么邻居数用4位，为什么补三个0

**反复追问的核心**：`neighbor_count[3:0]` 不是代表4个邻居，而是共同表示一个数量。

```text
neighbor_count[3:0]的位权：8、4、2、1
最多8个存活邻居：8 = 4'b1000
3位最大只能表示7，因此准确计数0～8需要4位
```

每个邻居 `q[index]` 本身只有一位：

```verilog
{3'b000, q[index]}
```

只是把它零扩展为4位：死亡贡献 `0000`，存活贡献 `0001`。高三位不是其他邻居，也不改变数值。若错误地写成 `{q[index], 3'b000}`，存活细胞就会贡献8而不是1。

**关于位宽的准确说法**：显式补0可以让操作数宽度清楚，但不能把它讲成“不补0就一定按1位相加并丢进位”。Verilog加法表达式会受到赋值上下文位宽影响；直接赋给4位结果与置于自决定位宽的拼接内部，不能混为一谈。判断是否截断要看整个表达式的规则。

### 19.5 从邻居数量计算下一代

```verilog
wire [3:0] neighbor_count;

assign neighbor_count =
    {3'b000, q[UP   * 16 + LEFT ]} +
    {3'b000, q[UP   * 16 + col  ]} +
    {3'b000, q[UP   * 16 + RIGHT]} +
    {3'b000, q[row  * 16 + LEFT ]} +
    {3'b000, q[row  * 16 + RIGHT]} +
    {3'b000, q[DOWN * 16 + LEFT ]} +
    {3'b000, q[DOWN * 16 + col  ]} +
    {3'b000, q[DOWN * 16 + RIGHT]};

assign next_state[INDEX] =
    (neighbor_count == 4'd3) ||
    ((neighbor_count == 4'd2) && q[INDEX]);
```

中间的当前细胞不参与邻居计数。规则是：3个邻居则活；2个邻居则保持；其余则死。变量名 `neighbor_count` 与 `neighbour_count` 是两个不同名字，不能混用。

运行过程：加载 `data` → 组合计算下一代 → 时钟沿统一写入 `q` → 根据新 `q` 再计算下一代。

例子：远离边界的三个竖直活细胞会变成三个水平活细胞，下一代又变回竖直。这是每拍基于旧棋盘同时计算的结果。

### 19.6 Quartus内存错误：记录事实，不把猜测当结论

本题实际遇到：

```text
Error (114016): Out of memory in module quartus_map
2147 megabytes used
```

这是综合/映射失败，不是功能波形不匹配。对话中提出过平衡加法树方案：8个1位数两两相加为4个2位数，再合并为2个3位数，最后得到4位计数。

**用户确认结果（2026-08-28）**：改成对话中后发的平衡加法树版本后，生命游戏已通过HDLBits；初版仍然会内存不足。这是用户提供的实际提交结果，不是本次编辑时重新运行的结果。

**原因与结果分开记录**：本例改写后通过，不等于已经证明初版内存耗尽的内部原因，也不能把“约2GB”直接当作已确认的32位地址空间限制。不要把这个经验推广成“所有多项加法都必须手工平衡，否则必然内存不足”。

### 19.7 生命游戏：后发并获用户确认通过的版本

该版本把8个邻居相加明确拆成三层：2位配对和、3位半组和、4位总和。

```verilog
module top_module (
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);
    wire [255:0] next_state;
    genvar row, col;

    generate
        for (row = 0; row < 16; row = row + 1) begin : gen_row
            for (col = 0; col < 16; col = col + 1) begin : gen_col
                localparam integer INDEX = row * 16 + col;
                localparam integer UP    = (row == 0)  ? 15 : row - 1;
                localparam integer DOWN  = (row == 15) ? 0  : row + 1;
                localparam integer LEFT  = (col == 0)  ? 15 : col - 1;
                localparam integer RIGHT = (col == 15) ? 0  : col + 1;

                wire n0, n1, n2, n3, n4, n5, n6, n7;
                wire [1:0] pair0, pair1, pair2, pair3;
                wire [2:0] half0, half1;
                wire [3:0] neighbor_count;

                assign n0 = q[UP   * 16 + LEFT ];
                assign n1 = q[UP   * 16 + col  ];
                assign n2 = q[UP   * 16 + RIGHT];
                assign n3 = q[row  * 16 + LEFT ];
                assign n4 = q[row  * 16 + RIGHT];
                assign n5 = q[DOWN * 16 + LEFT ];
                assign n6 = q[DOWN * 16 + col  ];
                assign n7 = q[DOWN * 16 + RIGHT];

                assign pair0 = {1'b0, n0} + {1'b0, n1};
                assign pair1 = {1'b0, n2} + {1'b0, n3};
                assign pair2 = {1'b0, n4} + {1'b0, n5};
                assign pair3 = {1'b0, n6} + {1'b0, n7};

                assign half0 = {1'b0, pair0} + {1'b0, pair1};
                assign half1 = {1'b0, pair2} + {1'b0, pair3};
                assign neighbor_count = {1'b0, half0} + {1'b0, half1};

                assign next_state[INDEX] =
                    (neighbor_count == 4'd3) |
                    ((neighbor_count == 4'd2) & q[INDEX]);
            end
        end
    endgenerate

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            q <= next_state;
    end
endmodule
```

---

## 20. FSM基础：当前状态、下一状态与输出

### 20.1 三段式不等于必须写三个 `always`

```text
第一段：状态寄存器，保存present_state
第二段：组合逻辑，计算next_state
第三段：输出逻辑，计算out
```

第三段简单时可用 `assign`。题目若直接提供 `input state` 且没有时钟，只要求组合部分，不需要自己增加状态寄存器。

### 20.2 最重要的硬件对应

```text
next_state = 状态D触发器的D输入
present_state = 状态D触发器的Q输出
```

```verilog
// 组合逻辑中的默认保持：D=Q
next_state = present_state;

// 时钟沿保存D：Q采样D
present_state <= next_state;

// 复位直接作用于状态寄存器Q
present_state <= RESET_STATE;
```

**曾经的错误**：在组合块写 `state = next_state`，并在复位分支写 `next_state <= OFF`。这样两个变量都可能被多个块驱动，出现 `multiple constant drivers`。

固定分工：`present_state` 只在状态寄存器块赋值；`next_state` 只在组合块赋值；输出由独立输出逻辑驱动。

### 20.3 完整三段式例子：ON/OFF

```verilog
module top_module (
    input clk,
    input areset,
    input j,
    input k,
    output reg out
);
    localparam OFF = 1'b0;
    localparam ON  = 1'b1;
    reg present_state;
    reg next_state;

    // 状态寄存器
    always @(posedge clk or posedge areset) begin
        if (areset)
            present_state <= OFF;
        else
            present_state <= next_state;
    end

    // 下一状态组合逻辑
    always @(*) begin
        next_state = present_state;
        case (present_state)
            OFF: if (j) next_state = ON;
            ON:  if (k) next_state = OFF;
            default: next_state = OFF;
        endcase
    end

    // Moore输出组合逻辑
    always @(*) begin
        case (present_state)
            OFF: out = 1'b0;
            ON:  out = 1'b1;
            default: out = 1'b0;
        endcase
    end
endmodule
```

同步复位版本只把第一段敏感列表改为 `@(posedge clk)`，仍在块内判断高有效复位。

### 20.4 `default` 与默认赋值

```verilog
next_state = present_state;
```

保证没有发生转移时保持状态，组合块不会因为遗漏赋值而锁存。它不是 `next_state = next_state`。

```verilog
default: next_state = RESET_STATE;
```

处理 `case` 没匹配到的状态编码。两者用途不同，常一起使用。两个1位状态已经覆盖所有确定的二进制编码，此时普通 `case` 的 `default` 主要还涉及仿真中的X/Z；不能据此声称电路一定具备完整的故障恢复能力。

输出的默认值应按设计规定选择，不是一律填0或填复位状态输出。

### 20.5 Moore与Mealy

| 类型 | 输出依赖 | 状态图中的输出标注 |
|---|---|---|
| Moore | 当前状态 | 状态圆圈内 |
| Mealy | 当前状态和当前输入 | 通常在箭头上写输入/输出 |

**曾经的误解**：“Moore机是不是要求输出都一样？”

正确理解是：同一个状态下输出固定，不同状态可以有不同输出。Mealy机则可能在状态不变时，因输入改变而改变输出。

Moore的输出依赖规则不等于物理上绝不会有组合译码毛刺，不要把抽象状态机规则与门级时序混为一谈。

### 20.6 状态编码、位下标、输出信号是三种不同概念

普通二进制编码：

```verilog
localparam [2:0] LOW = 3'd0;
```

`3'd0` 与 `3'b000` 数值和位宽相同。`d` 是书写进制，不表示硬件按十进制存储。6个状态二进制编码至少3位，独热码则使用6位。

独热码采用位下标时：

```verilog
localparam A = 0, B = 1, C = 2, D = 3;
```

这里 `D=3` 是下标，`state[D]` 是 `state[3]`。D状态的整向量却是 `4'b1000`，不能写 `state == D` 来判断D状态，否则比较的是数值3，即 `0011`。

```verilog
assign out = state[D];
```

直接检查D位。`state == state[D]` 则错误地拿整个向量与其中一位比较。

也可以把完整编码单独命名：

```verilog
localparam [3:0] STATE_A = 4'b0001;
localparam integer A_BIT = 0;
```

复位整个向量用 `present_state <= STATE_A`，访问A位用 `present_state[A_BIT]`。

**适用范围提醒**：`state[D]` 与 `(state == 4'b1000)` 只在合法独热输入下等价。对 `state=4'b1100`，前者为1，后者为0。独热组合逻辑题明确会测试非独热输入，应提交题目要求的逐位逻辑方程，不要替换成整向量相等比较。

### 20.7 四状态独热方程

原状态表：

| 当前状态 | in=0 | in=1 | out |
|---|---|---|---:|
| A | A | B | 0 |
| B | C | B | 0 |
| C | A | D | 0 |
| D | C | B | 1 |

**真实错误**：把D在 `in=0` 时写成去A，波形参考应为C。重点从首次错误处检查对应状态表行。

推导独热方程时，改问“谁能进入这个状态”，再把所有入边条件相或：

```verilog
assign next_state[A] = ~in & (state[A] | state[C]);
assign next_state[B] =  in & (state[A] | state[B] | state[D]);
assign next_state[C] = ~in & (state[B] | state[D]);
assign next_state[D] =  in & state[C];
assign out = state[D];
```

只实现组合部分时，`state` 是输入，`next_state` 是被 `assign` 驱动的输出。实现完整状态机时，增加4位状态寄存器，并在同步复位分支赋 `4'b0001`。

若把上述逐位方程放在 `always @(*)` 中，使用 `reg [3:0] next_state` 和阻塞赋值。开头可写 `next_state = 4'b0000`，之后各位都被方程覆盖；这不是让FSM在时钟间先进入全零状态。若四位已经无条件全部赋值，这句清零是冗余的，不是必须。

### 20.8 `parameter`、`localparam` 与 `reg`、`wire`

**工程区分**：

- `parameter`：让模块使用者在实例化时配置，例如计数上限、数据宽度。
- `localparam`：模块内部常量，不能由实例化参数覆盖，例如内部状态编码。
- 两者在值、类型不变时不会仅因关键字不同而改变本题功能；教材使用 `parameter` 定义状态不是语法错误。
- `localparam` 可以由其他参数推导，所以“不能直接覆盖”不代表它绝不随外部参数间接改变。

参考：[lowRISC参数使用规范](https://github.com/lowRISC/style-guides/blob/master/VerilogCodingStyle.md#parameterized-objects-modules-etc)。本轮检查的一生一芯E1入口没有规定必须选择其中某一个，不应把推荐习惯说成课程硬性要求。

Verilog-2001下，本轮用到的规则：

```text
always中被过程赋值的位向量 → reg
assign或子模块输出驱动的连接 → 通常wire
```

`next_state` 用 `reg` 还是 `wire`，取决于写在 `always` 还是 `assign`，不取决于名称。完整赋值的组合 `always` 中的 `reg` 不会仅因声明而变成触发器。题目若把 `state` 当输入提供，它通常是输入连线；自己在时钟块保存 `present_state` 时才是内部状态寄存器。

### 20.9 单时钟块模板的注意事项

早期题目给过在同一个时钟块内计算 `next_state`、执行 `present_state = next_state`、再根据它计算输出的模板。

不能只把其中一处 `=` 改成 `<=` 而保持其余代码不变，否则后续语句仍读旧状态，输出可能多延迟一拍。工程中应连同数据依赖一起重构；本轮后续统一使用清晰的三段式，不把教材特定的阻塞赋值模板当成通用推荐。

---

## 21. 蓄水池Moore状态机与波形调试里程碑

### 21.1 先分清输入顺序与合法读数

```verilog
input [3:1] s;
```

表示 `s={S3,S2,S1}`，不是 `{S1,S2,S3}`。

| s | 水位区间 |
|---|---|
| `000` | 低于S1 |
| `001` | S1～S2 |
| `011` | S2～S3 |
| `111` | 高于S3 |

`100` 表示只有最高传感器触发、下面两个没触发，不符合本题正常水位模型。不要把“最高水位”误写成只设置最高位。

### 21.2 为什么需要6个状态

同一中间区间，若最近从下方升入，`dfr=0`；若最近从上方降入，`dfr=1`。读数不变时保留这段历史，而不是每拍把相同读数当作“无变化所以关闭dfr”。

`dfr` 控制补充进水，不是放水。比较的是最近一次传感器读数变化前后的水位区间，不是“上次放水的位置”。

统一输出拼接顺序为 `{fr3,fr2,fr1,dfr}`：

| 状态 | 含义 | 输出 |
|---|---|---|
| low | 低于S1 | `1111` |
| m1_u | 从下方升入S1～S2 | `0110` |
| m1_d | 从上方降入S1～S2 | `0111` |
| m2_u | 从下方升入S2～S3 | `0010` |
| m2_d | 从上方降入S2～S3 | `0011` |
| high | 高于S3 | `0000` |

这里每个状态都有固定输出，因此仍是Moore机，不是要求所有状态输出相同。

### 21.3 完整转移表与同步复位

| 当前状态 | s=000 | s=001 | s=011 | s=111 |
|---|---|---|---|---|
| low | low | m1_u | m2_u | high |
| m1_u | low | m1_u | m2_u | high |
| m1_d | low | m1_d | m2_u | high |
| m2_u | low | m1_d | m2_u | high |
| m2_d | low | m1_d | m2_d | high |
| high | low | m1_d | m2_d | high |

```verilog
always @(posedge clk) begin
    if (reset)
        present_state <= low;
    else
        present_state <= next_state;
end
```

复位相当于长时间低水位，四个输出全部为1。

**为什么允许low直接转high？** 控制器采样可能跳过中间读数。水位物理上仍经过各区间，但两次采样可能从 `000` 直接变成 `111`；此时应直接关闭进水，而不是强制多等几个周期依次访问中间状态。

**为什么某些case省略000或默认项？** 开头 `next_state = present_state` 已经提供保持。对low而言，合法输入000应保持；对100等异常传感器组合，保持是所选策略，不是题目规定。外层状态 `default` 和内层传感器输入 `default` 处理不同问题。

### 21.4 真实错误一：拼接顺序与常量反了

错误：

```verilog
m1_u: {fr3, fr2, fr1, dfr} = 4'b1100;
```

这个常量原本对应另一种顺序 `{fr1,fr2,fr3,dfr}`。改了左侧顺序却不改常量，导致fr1/fr3错位。

修正后的完整输出块：

```verilog
always @(*) begin
    case (present_state)
        low:     {fr3, fr2, fr1, dfr} = 4'b1111;
        m1_u:    {fr3, fr2, fr1, dfr} = 4'b0110;
        m2_u:    {fr3, fr2, fr1, dfr} = 4'b0010;
        high:    {fr3, fr2, fr1, dfr} = 4'b0000;
        m2_d:    {fr3, fr2, fr1, dfr} = 4'b0011;
        m1_d:    {fr3, fr2, fr1, dfr} = 4'b0111;
        default: {fr3, fr2, fr1, dfr} = 4'b1111;
    endcase
end
```

端口声明顺序不会替你解释拼接，拼接始终从左到右逐位对应右侧常量。

### 21.5 真实错误二：把 `111→high` 写成 `100→high`

用户最初表示“对于波形图的错误完全无法有效debug”。这次通过首个错误时刻完成了具体定位。

统一读取顺序为 `{fr3,fr2,fr1,dfr}`：

| 波形时刻 | 参考行为 | 实际输出 | 推断 |
|---|---|---|---|
| 140 | 采样到s=7，即111，进入high，输出0000 | 0010 | 很像仍处于m2_u |
| 160 | s=3，即011，high下降到m2_d，输出0011 | 0010 | 若此前未进入high，就会保留m2_u |
| 180 | s=1，即001，进入m1_d，输出0111 | 0111 | 两条路径重新汇合 |

先根据输出推断，再查代码，用户确认写成了：

```verilog
3'b100: next_state = high; // 错误
```

正确应为：

```verilog
3'b111: next_state = high;
```

**关键收获**：160时刻的dfr错误不一定是另一个独立问题，它可能是140时刻漏转移的后果。先修第一个分歧，再重新仿真。

用户已经能够总结自己的方法：“先看mismatch，然后看ref和yours哪里不对，然后看看当前和先前状态。”这是本轮比单纯得到参考代码更重要的进步。

### 21.6 波形调试固定步骤

1. 找 `Mismatch` 第一次变成1的时刻，不从整张图同时找问题。
2. 找到对应有效时钟沿，读该沿之前的输入、复位以及可见的旧状态。
3. 根据题目推导应该进入的状态和输出。
4. 按固定输出顺序读出Ref与Yours，明确究竟哪一位不同。
5. 若能看内部波形：先看沿前next_state，再看沿后present_state，最后看输出。
6. 定位一处修改后重新运行，确认首个分歧是否消失，不凭推测宣布全部测试通过。

```text
沿前next_state已错误 → 查下一状态组合逻辑
next_state正确，沿后state错误 → 查时钟、复位、状态寄存器和多驱动
state正确，输出错误 → 查输出译码、拼接次序、编码位宽
```

只有输出可见时，可以利用状态输出表推测内部状态，但要保留“输出译码自身有错”的另一种可能，不能把推断当作直接观测。

---

## 22. 最新完成练习：Lemmings 1

### 22.1 题意与状态转移

两个状态：向左走、向右走。只对当前前进方向上的碰撞作出反应；两侧同时碰撞时也翻转方向。

```text
LEFT且bump_left=1 → RIGHT
RIGHT且bump_right=1 → LEFT
否则保持当前方向
areset高有效异步复位 → LEFT
```

### 22.2 最新错误：把输出当成复位状态编码

用户写成：

```verilog
if (areset)
    state <= walk_left;
```

但：

```text
bump_left：输入，左侧是否撞到障碍
LEFT：状态编码常量，当前定义为0
walk_left：输出，当前是否处于LEFT
```

当 `state=LEFT=0` 时，`walk_left=(state==LEFT)=1`。把 `walk_left` 写回state反而对应RIGHT编码；更一般地，复位值依赖旧状态译码，不能保证固定复位行为。

正确是：

```verilog
state <= LEFT;
```

用户随后口误说“walk_left是输入”，已再次澄清它是输出。这个“常量 / 当前状态 / 输入 / 输出”的角色区分还需要在后续题目中巩固。

### 22.3 正确参考代码

```verilog
module top_module (
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right
);
    localparam LEFT = 1'b0;
    localparam RIGHT = 1'b1;
    reg state;
    reg next_state;

    always @(*) begin
        next_state = state;
        case (state)
            LEFT:  if (bump_left)  next_state = RIGHT;
            RIGHT: if (bump_right) next_state = LEFT;
            default: next_state = LEFT;
        endcase
    end

    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
endmodule
```

**用户确认结果（2026-08-28）**：Lemmings 1已经通过HDLBits。复位对象的错误已经修正，不再列为待完成事项；本次编辑未另外运行本地仿真。

---

## 23. 当前学习进度与下一步（2026-08-28）

| 专题 | 当前学习进度 | 证据与边界 |
|---|---|---|
| 基础组合逻辑、模块、算术、卡诺图 | 已学习，见第1～14节 | 不重新把已学内容当成零基础，但仍结合实际错误解释 |
| 计数器与Count clock | 阶段性完成，用户明确视作小里程碑 | 本轮补充了模块拆分、参数化和AM/PM追问 |
| 移位寄存器、MUXDFF、generate | 已练习串联、装载、保持、逐位映射 | 已定位所有实例接同一输入的错误 |
| Galois LFSR | 已学习5位、32位、抽头与掩码 | 已纠正移位来源和位宽写法；未逐题收集通过记录 |
| Rule 110 | 已学习组合下一代与同步更新 | 已从q=1不扩展的波形定位左右邻居反接 |
| 生命游戏 | 已学习二维映射、环绕、计数及演化，并通过 | 用户确认后发平衡加法树版本通过；初版仍会内存不足 |
| 基础FSM与独热码 | 已学习三段式、默认赋值、同步/异步复位 | 当前/下一状态、位下标/编码仍是需要巩固的概念 |
| 蓄水池FSM | 已写代码并定位两类真实错误 | 用户确认 `100→high` 误写；未展示最终全测试通过结果 |
| Lemmings 1 | 当前最新完成练习 | 用户已明确确认通过；复位常量与输出信号的区别仍需巩固 |

**下一轮优先事项**：从Lemmings 1已通过的位置继续。可接续Lemmings 2或用户下一道题，不再重复询问Lemmings 1是否通过，也不预先假定后续题已完成。

**值得保留的学习方法**：先读端口，列状态/输入/输出角色，再按状态图写代码；出错时抓首个波形分歧，而不是盲目更换整份代码。

本次更新未运行HDL编译或仿真。学习理解、参考实现、用户确认的错误定位、平台实际通过结果应分别记录。

---

## 24. 串行协议与“状态机 + 数据通路”专题（2026-08-28之后）

这一阶段的主要变化是：题目不再只要求“识别到了哪个状态”，而是要求状态机同时控制移位寄存器、计数器、输出寄存器和校验器。最需要巩固的不是再增加状态数量，而是分清三类信号：

```text
状态：现在进行到协议的哪一步
控制：当前步骤允许哪个数据通路工作
数据：真正保存的字节、计数值、奇偶校验结果
```

### 24.1 PS/2三字节报文：连续输入如何划分

题目中的 `in[7:0]` 每个时钟周期提供一个完整字节。所谓“连续字节流”，不是一次把所有字节送进模块，而是每拍送一个字节，FSM用状态记住当前字节的位置：

```text
SEARCH：丢弃不满足in[3]=1的字节，寻找byte1
BYTE2：已经收到byte1，当前接收byte2
BYTE3：已经收到byte2，当前接收byte3
DONE：三个字节已经完整接收，发出完成信号
```

用户追问“DONE状态检查下一拍的 `in[3]`，是不是重叠识别”。关键区别是：

```text
旧报文的第三个字节：在进入DONE之前已经消费完毕
DONE期间看到的输入：数据流中的下一个新字节
```

所以在DONE期间把当前输入当作下一份报文的候选byte1，不是让同一个字节同时充当旧报文byte3和新报文byte1。禁止重叠指的是不能复用已经消费过的字节。

### 24.2 三字节数据通路：为什么保留低16位

使用移位寄存器：

```verilog
out_bytes <= {out_bytes[15:0], in};
```

右侧拼接结果的对应关系是：

```text
新out_bytes[23:8] = 旧out_bytes[15:0]
新out_bytes[7:0]  = 当前in
```

假设依次输入 `A1、B2、C3`：

```text
第一次：0000A1
第二次：00A1B2
第三次：A1B2C3
```

截取旧低16位，是因为它们保存最近收到的两个字节，需要整体向高位移动，为新字节腾出最低8位。旧最高8位是更早的数据，应被丢弃。不能截取旧高16位，否则会保留更旧的数据并丢掉刚收到的数据。

### 24.3 串行接收器：起始位、8位数据、停止位和WAIT

串行线空闲时为1，一个合法帧为：

```text
起始位0 → 8个数据位 → 停止位1
```

若预期的停止位不是1，FSM不能立刻把这个0当作下一帧的起始位，而要进入WAIT状态：

```text
WAIT且in=0：继续丢弃错误帧之后的数据
WAIT且in=1：线路重新回到空闲，返回等待起始位的状态
```

WAIT不需要额外“清除错误字节”的操作。只要不产生 `done`、不把其中的数据当作新帧，它们在逻辑意义上就已经被丢弃。

协议规定最低有效位先发送，因此八个数据状态按下面方式写入：

```verilog
D0: out_byte[0] <= in;
D1: out_byte[1] <= in;
...
D7: out_byte[7] <= in;
```

这里的D0～D7是“当前正在接收第几位”的控制状态，`out_byte`才是保存数据的数据通路。

### 24.4 `generate for` 与时序块中的 `for`

用户曾要求把八个逐位赋值改成generate，并进一步追问“generate循环和直接循环到底有什么区别”。结论是：

```text
generate for：精化时复制模块、连续赋值或always块，循环变量是genvar
always中的for：描述一次过程对多个元素执行同类赋值，循环变量通常是integer
```

两者常常能综合出相同的八个寄存器，但表达层级不同。若只是同一个时钟块中根据状态写入 `out_byte[i]`，普通过程 `for` 更直接：

```verilog
integer i;
always @(posedge clk) begin
    if (reset)
        out_byte <= 8'b0;
    else begin
        for (i = 0; i < 8; i = i + 1)
            if (state == D0 + i)
                out_byte[i] <= in;
    end
end
```

若在generate生成的每个独立always块里复位 `out_byte[i]`，就只能逐位写复位；在一个统一时序块中则可以直接：

```verilog
out_byte <= 8'b0;
```

### 24.5 奇校验：校验的是数据位加校验位

奇校验的条件是：8个数据位和1个校验位合计9位中，1的总数为奇数。它不要求“前8位必须有偶数个1且校验位固定为1”。校验位取什么值取决于数据位中已有多少个1：

```text
数据位中1为偶数个 → parity位应为1
数据位中1为奇数个 → parity位应为0
```

提供的 `parity` 模块本质是一个T触发器：每收到一个1就翻转 `odd`，收到0则保持。应在一帧开始前清零，让它统计D0～D7和PARITY共9位。若只把D0～D7送入模块，就漏掉了校验位。

用户追问“为什么不用top_module原有的in和reset”。`parity_in`、`parity_reset`不是新增的外部输入，而是顶层内部控制线，用来决定：

```text
什么时候把顶层in送给校验器
什么时候仅清零奇偶累计值，而不是复位整个top_module
```

可以直接连接 `in`，但仍需要一个按帧边界产生的内部复位条件。外部 `reset` 只能表达整个电路复位，不能替代“开始统计下一帧”这一内部事件。

### 24.6 HDLC连续1计数

HDLC framing练习的着手点是记录“当前连续看到了几个1”，而不是记住整个历史串：

```text
5个连续1后出现0：这个0是填充位，disc=1
6个连续1后出现0：识别到帧边界，flag=1
7个或更多连续1：err=1
普通0：连续1计数清零
```

状态可以直接表示已经连续看到0、1、2……个1。`disc`、`flag`、`err`由当前计数状态与输入共同决定，因此很适合用Mealy输出。

### 24.7 Mealy型“101”识别

Moore与Mealy最实用的区分：

```text
Moore：进入某个状态之后，输出才由该状态拉高
Mealy：当前状态加当前输入已经足够时，可以当拍拉高输出
```

识别可重叠的101，只需要三个状态：没有匹配、已看到1、已看到10。处于“已看到10”且当前 `x=1` 时，组合输出 `z=1`；同时这个1又可以作为下一次101的开头，所以转回“已看到1”。

### 24.8 串行二进制补码器：真正的等价算法

这一题最关键的理解转折是：二进制补码“全部取反再加一”，在从LSB向MSB串行扫描时等价于：

> 从LSB开始，直到遇到第一个1为止都原样输出（包括这个1）；第一个1之后的所有位全部取反。

例如输入数位从MSB看是 `0101`，按LSB先传输的顺序是：

```text
输入流：1 0 1 0
输出流：1 1 0 1
```

FSM只需要记住一件事：“是否已经遇到第一个1”。在此之前 `z=x`，之后 `z=~x`。所谓“进位”只是推导该等价算法的数学过程，实际状态机不必输出或保留最终溢出进位。

---

## 25. FSM计数、状态窗口与数据通路连接

### 25.1 三拍内恰好两个w为1

用户计划只使用A、B两个主状态，并用 `clkCount`、`wCount` 记录B状态中的三个采样周期。这种设计是可行的：FSM负责是否已经进入长期检测阶段，计数器负责三拍分组。

曾出现的直接状态错误是：

```verilog
A: if (s) next_state = A;  // 错误
```

题意要求A中看到 `s=1` 后进入B，应为：

```verilog
A: if (s) next_state = B;
```

第三拍判断必须把“当前这拍的w”包含进去。因为非阻塞赋值右侧读取旧值：

```verilog
wCount <= wCount + w;
```

不会让同一时钟块下面的判断立即看到新 `wCount`。因此第三拍应判断：

```verilog
if (wCount + {1'b0, w} == 2'd2)
    z <= 1'b1;
```

`{1'b0,w}`只是把1位 `w`明确扩展成2位数值0或1，不是把两份数据拼成新的含义。计数应放在“未到第三拍”的分支；到了第三拍就用旧累计值加当前 `w`作最终判断，然后清零开始下一组三拍。

### 25.2 `y0`、`Y2`等名称的含义

若题目给当前状态 `y[2:0]`，要求输出 `Y0`，通常：

```text
y[0]：当前状态编码的最低位
Y0：下一状态编码的最低位
```

它不是名为“y0”的某个状态。推导 `Y2` 就只看状态表中“下一状态最高位为1”的所有当前状态和输入条件。

### 25.3 Moore仲裁器：授权在状态中产生

仲裁器状态图写成 `B/g1=1`、`C/g2=1`、`D/g3=1`，说明它是Moore输出：

```verilog
assign g[1] = (state == B);
assign g[2] = (state == C);
assign g[3] = (state == D);
```

在A中根据请求决定 `next_state`，不应同时在A的组合分支提前拉高 `g`，否则输出会变成依赖当前请求的Mealy行为，并比状态图早一个周期。优先级由：

```verilog
if (r[1]) ...
else if (r[2]) ...
else if (r[3]) ...
```

决定。获得授权后，只要对应请求仍为1就留在该授权状态；请求撤销才返回A重新仲裁。

### 25.4 电机FSM：检查窗口不是“先攒够两个y=1”

检测到 `x=101` 后，`g`拉高并检查未来至多两个周期的 `y`：

```text
G_CHECK_1：第一个检查周期
G_CHECK_2：仅在第一周期y=0时进入的第二个检查周期
G_H：已经成功，g永久为1
G_L：两次都失败，g永久为0
```

因此正确转移是：

```verilog
G_CHECK_1: next_state = y ? G_H : G_CHECK_2;
G_CHECK_2: next_state = y ? G_H : G_L;
```

用户曾认为第一周期 `y=1` 应进入 `G_CHECK_2`。那会把G_CHECK_2误解成“成功后的下一步”；实际上G_CHECK_2表示“第一次没等到，还剩最后一次机会”。第一周期已经看到1就应直接进入永久成功状态。

另外，题目规定直到 `f=1` 的周期结束后才开始监测x，所以 `F_CYCLE`之后应进入“尚未匹配任何x”的状态，不能默认已经看到了第一个1。

### 25.5 完整定时器：状态机如何连接SHIFT和COUNT

1101定时器包含三块：

```text
控制FSM：搜索1101、接收4位、计时、等待ack
delay移位/递减寄存器：保存4位延时值并逐段减1
count_cnt：每段计满1000拍
```

控制关系：

```text
state==SHIFT → 每拍 delay <= {delay[2:0],data}
shift_cnt==3 → 第四位在该时钟沿写入，同时下一状态进入COUNT
state==COUNT → counting=1，count_cnt从0数到999
delay==0且count_cnt==999 → 下一状态进入DONE
state==DONE → done=1，ack=1后回到搜索状态
```

`delay=0`也必须计满1000拍，所以完成条件不能只写 `delay==0`，必须同时要求最后一组1000拍结束。

真实波形错误：参考在约10130把 `count` 从1降为0，实际一直为1。原因是COUNT分支只处理了 `count_cnt==999`，却没有在小于999时递增：

```verilog
COUNT: begin
    if (count_cnt == 10'd999) begin
        count_cnt <= 10'd0;
        if (delay != 4'd0)
            delay <= delay - 1'b1;
    end else begin
        count_cnt <= count_cnt + 1'b1;
    end
end
```

原代码把 `count_cnt <= count_cnt + 1` 写在“已经等于999且delay为0”的分支中。那不是正常逐拍计数，而是从旧值999算成1000；同时0～998根本没有变化，所以计数器永远卡在0。

---

## 26. 独热状态方程：`X_next`看的是指向X的箭头

十状态独热题使用：

```verilog
parameter S=0, S1=1, S11=2, S110=3,
          B0=4, B1=5, B2=6, B3=7,
          Count=8, Wait=9;
```

这些常量是 `state` 的位下标：

```text
state[B3]    = state[7]，当前是否包含B3状态
state[Count] = state[8]，当前是否包含Count状态
```

它们不是普通FSM中可以直接赋给下一状态的一位布尔值。错误写法：

```verilog
assign Wait_next = ack ? S : Wait;
```

这里实际是在一位输出上选择数字0或9。数字9最低位为1，因此会产生看似莫名其妙的高电平。

推导方法始终是：

> 写 `X_next` 时，找状态图中所有指向X的箭头，把“来源状态位 与 箭头条件”全部相或。

例如B2无条件进入B3：

```verilog
assign B3_next = state[B2];
```

这句话不是“B3下一状态是B2”，而是：

```text
当前state[B2]=1
→ 组合逻辑得到B3_next=1
→ 下个时钟沿state[B3]被置1
→ 完成B2到B3的转移
```

该题的关键方程：

```verilog
assign B3_next = state[B2];

assign S_next =
       (state[S]    && !d) ||
       (state[S1]   && !d) ||
       (state[S110] && !d) ||
       (state[Wait] && ack);

assign S1_next = state[S] && d;

assign Count_next =
       state[B3] ||
       (state[Count] && !done_counting);

assign Wait_next =
       (state[Count] && done_counting) ||
       (state[Wait] && !ack);

assign done      = state[Wait];
assign counting  = state[Count];
assign shift_ena = state[B0] | state[B1] | state[B2] | state[B3];
```

测试平台会主动提供非独热输入，因此要保持这种逐位布尔方程；不能偷换成“当前向量等于某个完整独热编码”后写普通case。

---

## 27. 找Bug题：语法能写不等于电路含义正确

### 27.1 用5输入AND实现3输入NAND

提供模块端口顺序为：

```verilog
module andgate(output out, input a, input b, input c, input d, input e);
```

三输入NAND需要：

```verilog
wire and_out;
andgate u_and(and_out, a, b, c, 1'b1, 1'b1);
assign out = ~and_out;
```

多出的AND输入接1，因为 `x&1=x`；接0会让结果永远为0。原实例少接端口，而且按位置连接时把第一个输入 `a`错误地接到了子模块输出端口。

### 27.2 三个2:1 MUX组成4:1 MUX

中间信号必须是8位：

```verilog
wire [7:0] mux0_out, mux1_out;
mux2 m0(sel[0], a, b, mux0_out);
mux2 m1(sel[0], c, d, mux1_out);
mux2 m2(sel[1], mux0_out, mux1_out, out);
```

两个第一层MUX同时计算，不需要先“选中哪一个实例”：

```text
sel[0]：每组内部选左还是右，即a/b和c/d
sel[1]：最后选择ab组还是cd组
```

例如 `sel=10`：m0候选a、m1候选c，最后m2选择第二组，因此输出c。

### 27.3 加减器的零标志

错误判断：

```verilog
if (out[6:0] ^ out[6:0])
```

任何值和自身异或都为0，而且还漏掉了最高位 `out[7]`。同时没有else会让 `result_is_zero`在某些路径保持旧值。正确写法：

```verilog
result_is_zero = (out == 8'b0);
```

或使用归约或：

```verilog
result_is_zero = ~|out;
```

### 27.4 Verilog不能写数学式连续比较

错误：

```verilog
if (4'd4 <= c <= 4'd8)
```

Verilog从左向右计算：

```text
(4<=c)的结果只能是0或1
随后计算0<=8或1<=8
两种都为真
```

所以输出一直为 `4'hf`。范围判断必须拆开：

```verilog
if ((c >= 4'd4) && (c <= 4'd8))
```

若0～3分别查表、其他输入全部输出f，直接给默认值再写case更清楚。过程块中赋值的中间信号必须声明为 `reg`，并覆盖所有路径避免无意锁存。

---

## 28. 根据波形反推组合逻辑

### 28.1 先识别测试输入是不是二进制枚举

多张组合波形中，输入变化频率为：

```text
d每格翻转
c每两格翻转
b每四格翻转
a每八格翻转
```

这意味着测试台正在依次枚举：

```text
0000、0001、0010、0011……1111
```

因此波形本身就是一张按时间展开的真值表。先按每个时间格记录输入和输出，再寻找共同特征，不必立刻画卡诺图。

### 28.2 偶校验波形

`q=1`的输入为：

```text
0000、0011、0101、0110、1001、1010、1100、1111
```

共同点是1的数量为偶数，因此：

```verilog
assign q = ~^{a,b,c,d};
```

这类函数在卡诺图上呈棋盘格，几乎不能用普通相邻块大幅合并。看到棋盘格或“每改变一位输出就反相”的规律，应优先考虑XOR/XNOR。画卡诺图仍然是正确方法，只是识别奇偶规律更快。

### 28.3 分组条件波形

另一题的输出条件为：a、b中至少有一个1，并且c、d中至少有一个1：

```verilog
assign q = (a | b) & (c | d);
```

着手方法是先观察周期性低谷：当 `cd=00` 时总为0，说明需要 `c|d`；再看前半段即使c或d为1，a、b全0时仍为0，说明还需要 `a|b`。

### 28.4 排除无关输入

还有一题中，d不断快速翻转而q不随它变化；a翻转前后的规律完全重复，因此先排除a、d。只比较b、c得到：

```text
00→0，01→1，10→1，11→1
```

所以：

```verilog
assign q = b | c;
```

波形反推时，“哪个输入变化了但输出没反应”与“哪个输入组合一出现输出必变化”同样重要。

### 28.5 无需化简的查找表

输入 `a[2:0]` 已经把0～7全部枚举，输出分别固定为：

```text
0→1232  1→aee0  2→27d4  3→5a0e
4→2066  5→64ce  6→c526  7→2f19
```

没有必要强行寻找门级规律，直接用组合 `case` 实现8项查找表即可。这也是小型ROM/LUT的行为描述。

---

## 29. 根据波形反推时序逻辑

### 29.1 `posedge/negedge`不是if条件

错误代码尝试：

```verilog
if (posedge clock)
if (posedge a || negedge a)
```

`posedge`、`negedge`是事件描述符，只能用于敏感列表，例如：

```verilog
always @(posedge clock)
always @(negedge clock)
```

它们不是运行时返回0或1的布尔函数，所以不能放入if表达式。若不同信号承担不同存储行为，应拆成不同的always块，而不是在一个多事件块中再试图判断“刚才发生的是哪种边沿”。

### 29.2 高电平透明锁存器与下降沿采样

波形中 `p`在 `clock=1`期间跟随a，在 `clock=0`期间保持，因此是高电平透明锁存器：

```verilog
always @(*) begin
    if (clock)
        p = a;
end
```

这里没有else是有意推断锁存器，不是遗漏。

`q`只在clock下降沿更新，并保存当时的数据：

```verilog
always @(negedge clock)
    q <= a;
```

用户提出 `q<=~q`，因为图中两个下降沿恰好看到q从0到1、再从1到0。单看这两个点确实可能误判为翻转，但两种硬件不同：

```text
q<=a：下降沿采样数据；连续两次a=1，q会保持1
q<=~q：每个下降沿无条件翻转，完全忽略a
```

而且题目没有复位，`q<=~q`从未知初值X开始时仍可能一直是X。这是“波形局部巧合”不能替代信号关系验证的例子。

### 29.3 一个可见状态位加组合逻辑

最新讨论的波形题明确说明只有一个触发器，并把其输出作为 `state`公开。固定解题顺序：

1. 暂时遮住q，只看state在哪些有效时钟沿变化。
2. 读取变化沿之前的a、b和旧state，建立状态更新表。
3. 分别固定 `state=0`、`state=1`，观察q与a、b的组合关系。

由波形得到：

| a | b | state下一拍 |
|---:|---:|---|
| 0 | 0 | 0 |
| 0 | 1 | 保持 |
| 1 | 0 | 保持 |
| 1 | 1 | 1 |

因此：

```verilog
always @(posedge clk) begin
    if (a && b)
        state <= 1'b1;
    else if (!a && !b)
        state <= 1'b0;
end
```

当 `state=0` 时，波形显示 `q=a^b`；当 `state=1` 时结果反相，因此统一为：

```verilog
assign q = a ^ b ^ state;
```

这一题的重点不是一次猜出整个表达式，而是利用题目已经暴露的状态位，把时序更新和组合输出分成两个小问题。

---

## 30. 当前学习情况与接续点（2026-09-06）

### 30.1 已形成的能力

- 能使用三段式FSM区分状态寄存器、下一状态组合逻辑和输出逻辑。
- 开始能把协议控制和数据通路分开，理解状态负责产生SHIFT、COUNT、DONE等阶段性使能。
- 能根据首个Mismatch反查旧状态、输入、参考输出和实际输出，完整定时器中成功定位到计数器未递增这一类局部错误。
- 对非阻塞赋值“同一时钟沿读取旧值”有了具体使用经验，知道第三拍统计时要把当前输入单独计入。
- 能识别独热参数是位下标，并开始用“所有指向目标状态的入边”推导 `_next`方程。
- 能从组合波形识别二进制枚举、奇偶校验、无关输入、分组或逻辑和查找表。
- 能从时序波形先研究可见状态，再研究组合输出；知道锁存器是电平敏感，触发器是边沿敏感。

### 30.2 仍需重点巩固

- 看到 `X_next` 时仍容易按“X要去哪里”理解；应固定改问“谁能进入X”。
- 容易把状态编码、独热位下标、输入、输出和内部使能混成同一类值；写代码前应在纸上标注每个信号角色。
- 复杂时序题中容易漏写计数器普通递增的else分支，或把边界处理当成完整计数过程。
- 观察短波形时容易把“恰好翻转”当成T触发器，应继续用反例检查候选规律。
- 组合always仍需主动检查默认赋值、所有分支覆盖以及过程赋值信号是否声明为reg。

### 30.3 近期题目验证边界

| 内容 | 当前记录状态 |
|---|---|
| Lemmings 1 | 用户已明确确认通过 |
| 生命游戏平衡加法树版本 | 用户已明确确认通过 |
| PS/2、串行接收、奇校验、HDLC、Mealy、串行补码 | 已学习和讨论；本次整理未取得逐题平台通过证据 |
| 三拍w统计、电机FSM、完整定时器 | 已分析代码和波形错误；完整定时器已定位首个Mismatch，未收到最终通过确认 |
| 独热十状态方程 | 已根据波形纠正位下标与入边方程；未收到最终通过确认 |
| Bug修复和波形反推系列 | 已逐题给出推导或修正；用户已继续到后续题，但不据此自动记为平台通过 |

### 30.4 下一次继续时的固定流程

```text
先读题目：组合、时序、完整FSM还是只要组合方程
再分角色：输入、当前状态、下一状态、输出、数据寄存器、计数器
先手算一个具体时钟沿或一组输入
再写最小代码
失败后只看第一个Mismatch
修一处后重新提交，不把推导正确写成平台已通过
```

截至2026-09-06，最新讨论位置是“根据一个可见state位和a、b、q波形反推时序电路”。后续可从下一道HDLBits题继续，无需回到Lemmings 1重新开始。
