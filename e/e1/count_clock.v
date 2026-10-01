// ============================================================================
// 12 小时时钟计数器（HDLBits: Count clock）
// ----------------------------------------------------------------------------
// 功能：在快速 clk 下工作，每当 ena 出现一个脉冲就前进 1 秒。
//   - reset        ：同步复位到 12:00 AM，优先级高于 ena
//   - pm           ：0=AM，1=PM
//   - hh / mm / ss ：各两位 BCD 码，hh 范围 01~12，mm / ss 范围 00~59
//
// 设计结构（模块化）：
//   1. bcd_counter   —— 通用 BCD 计数器（用于秒/分的个位和十位）
//   2. hour_counter  —— 12 小时计数器（01~12，复位到 12）
//   3. pm_flag       —— AM/PM 标志（11:59:59 -> 12:00:00 时翻转）
//   4. top_module    —— 顶层，用普通 assign 语句把各级使能链串起来（不使用 generate）
//
// 使能链（普通 assign，等价于 generate 展开后的结果）：
//   sec 个位使能 = ena
//   sec 十位使能 = ena & (sec 个位 == 9)
//   min 个位使能 = ena & (sec 个位 == 9) & (sec 十位 == 5)
//   min 十位使能 = ena & (sec 个位 == 9) & (sec 十位 == 5) & (min 个位 == 9)
//   hour     使能 = ena & ... & (min 十位 == 5)
//   pm       翻转 = hour 使能 & (hh == 11)   // 只在 11 -> 12 时翻转
// ============================================================================

// ----------------------------------------------------------------------------
// 1. 通用 BCD 计数器：复位为 0，从 0 计数到 MAX，然后回绕到 0
// ----------------------------------------------------------------------------
module bcd_counter #(
    parameter [3:0] MAX = 4'd9   // 计数的最大值（个位=9，十位=5）
)(
    input  wire       clk,
    input  wire       reset,     // 同步复位，优先级高于 enable
    input  wire       enable,    // 计数使能
    output reg  [3:0] q          // 一位 BCD 输出
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

// ----------------------------------------------------------------------------
// 2. 12 小时计数器：q 为 8 位 BCD，q[7:4]=十位，q[3:0]=个位
//    计数顺序：12 -> 01 -> 02 -> ... -> 09 -> 10 -> 11 -> 12
// ----------------------------------------------------------------------------
module hour_counter (
    input  wire       clk,
    input  wire       reset,     // 同步复位到 12（12:00）
    input  wire       enable,    // 计数使能
    output reg  [7:0] q          // BCD 小时，范围 01~12
);
    always @(posedge clk) begin
        if (reset)
            q <= 8'h12;              // 复位到 12
        else if (enable) begin
            if (q == 8'h12)
                q <= 8'h01;          // 12 -> 01
            else if (q[3:0] == 4'd9)
                q <= {q[7:4] + 4'd1, 4'd0};  // 09 -> 10
            else
                q <= q + 8'h01;      // 普通加 1
        end
    end
endmodule

// ----------------------------------------------------------------------------
// 3. AM/PM 标志：复位为 AM(0)，每次 toggle 为 1 时翻转
// ----------------------------------------------------------------------------
module pm_flag (
    input  wire clk,
    input  wire reset,     // 同步复位到 AM(0)
    input  wire toggle,    // 翻转使能
    output reg  pm         // 0=AM，1=PM
);
    always @(posedge clk) begin
        if (reset)
            pm <= 1'b0;
        else if (toggle)
            pm <= ~pm;
    end
endmodule

// ----------------------------------------------------------------------------
// 4. 顶层模块
// ----------------------------------------------------------------------------
module top_module(
    input  wire clk,
    input  wire reset,
    input  wire ena,
    output wire pm,
    output wire [7:0] hh,
    output wire [7:0] mm,
    output wire [7:0] ss
);
    // 各级使能信号（进位链）
    wire en_sec_tens;   // 秒十位使能
    wire en_min_ones;   // 分个位使能
    wire en_min_tens;   // 分十位使能
    wire en_hours;      // 小时使能
    wire en_pm;         // AM/PM 翻转使能

    // 使能信号链：全部使用普通 assign 语句，不使用 generate
    assign en_sec_tens = ena & (ss[3:0] == 4'd9);       // 秒个位满 9
    assign en_min_ones = en_sec_tens & (ss[7:4] == 4'd5); // 秒十位满 5
    assign en_min_tens = en_min_ones & (mm[3:0] == 4'd9); // 分个位满 9
    assign en_hours    = en_min_tens & (mm[7:4] == 4'd5); // 分十位满 5
    assign en_pm       = en_hours & (hh == 8'h11);        // 11 -> 12 时翻转

    // ---- 秒计数器（00~59）----
    bcd_counter #(.MAX(4'd9)) sec_ones (
        .clk   (clk),
        .reset (reset),
        .enable(ena),          // 秒个位每次 ena 都计数
        .q     (ss[3:0])
    );
    bcd_counter #(.MAX(4'd5)) sec_tens (
        .clk   (clk),
        .reset (reset),
        .enable(en_sec_tens),
        .q     (ss[7:4])
    );

    // ---- 分计数器（00~59）----
    bcd_counter #(.MAX(4'd9)) min_ones (
        .clk   (clk),
        .reset (reset),
        .enable(en_min_ones),
        .q     (mm[3:0])
    );
    bcd_counter #(.MAX(4'd5)) min_tens (
        .clk   (clk),
        .reset (reset),
        .enable(en_min_tens),
        .q     (mm[7:4])
    );

    // ---- 时计数器（01~12）----
    hour_counter hours (
        .clk   (clk),
        .reset (reset),
        .enable(en_hours),
        .q     (hh)
    );

    // ---- AM/PM 标志 ----
    pm_flag ampm (
        .clk   (clk),
        .reset (reset),
        .toggle(en_pm),
        .pm    (pm)
    );
endmodule
