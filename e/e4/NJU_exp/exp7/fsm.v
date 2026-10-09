// 实验七-1：Moore 状态机（连续 4 个 0 / 4 个 1 检测器）—— 独热码版
// 对应南大 Listing 21 的 FSM_bin：状态编码由二进制改为 one-hot，
// 并改用 ysyx 的 Reg / MuxKeyWithDefault 做结构化建模（无 always）。
module fsm(
    input        clk,
    input        rst,        // 高电平有效同步复位（上板时对 SW0 取反即可）
    input        in,         // 输入 w
    output       out,        // 输出 z
    output [8:0] state       // 当前状态（独热码），引出给测试检查
);
    // 9 个状态的独热编码：S0..S8 对应 Table 8 的 A..I（y0..y8）
    localparam [8:0] S0 = 9'b0_0000_0001,
                     S1 = 9'b0_0000_0010,
                     S2 = 9'b0_0000_0100,
                     S3 = 9'b0_0000_1000,
                     S4 = 9'b0_0001_0000,
                     S5 = 9'b0_0010_0000,
                     S6 = 9'b0_0100_0000,
                     S7 = 9'b0_1000_0000,
                     S8 = 9'b1_0000_0000;

    wire [8:0] state_din;

    // 状态寄存器：复位到 S0
    Reg #(9, S0) u_state (
        .clk(clk), .rst(rst), .din(state_din), .dout(state), .wen(1'b1)
    );

    // 输出逻辑：独热码下 S4(=E) 与 S8(=I) 时 out=1，直接按位取即可，无需查表
    assign out = state[4] | state[8];

    // 次态逻辑：键 = 当前状态，数据 = 下一状态
    // 迁移关系与 Listing 21 完全相同，只是把状态名换成了 9 位独热码
    MuxKeyWithDefault #(9, 9, 9) u_stateMux (
        .out(state_din), .key(state), .default_out(S0),
        .lut({
            S0, in ? S5 : S1,
            S1, in ? S5 : S2,
            S2, in ? S5 : S3,
            S3, in ? S5 : S4,
            S4, in ? S5 : S4,
            S5, in ? S6 : S1,
            S6, in ? S7 : S1,
            S7, in ? S8 : S1,
            S8, in ? S8 : S1
        })
    );
endmodule
