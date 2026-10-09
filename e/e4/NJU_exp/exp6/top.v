module top(
    input        clk,
    input        rst,
    input        btn,         // 步进按钮 BTNC
    output [7:0] seg0,        // 低位 4 位（q[3:0]）
    output [7:0] seg1         // 高位 4 位（q[7:4]）
);
    // 按钮上升沿检测（同步一拍），避免直接拿按钮当时钟
    wire btn_d;
    Reg #(1, 1'b0) u_sync (.clk(clk), .rst(rst), .din(btn), .dout(btn_d), .wen(1'b1));
    wire step = btn & ~btn_d;

    wire [7:0] q;
    lfsr u_lfsr (.clk(clk), .rst(rst), .en(step), .q(q));

    hex7seg u_lo (.hex(q[3:0]), .seg(seg0));
    hex7seg u_hi (.hex(q[7:4]), .seg(seg1));
endmodule
