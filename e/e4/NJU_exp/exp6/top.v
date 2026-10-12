module top(
    input clk,
	input rst,
	input btn,
    output [7:0] seg0,
	output [7:0] seg1
);
    wire btn_d;
    Reg #(1, 1'b0) u_sync (.clk(clk), .rst(rst), .din(btn), .dout(btn_d), .wen(1'b1));
    wire step = btn & ~btn_d;
    wire [7:0] q;
    lfsr    u_lfsr (.clk(clk), .rst(rst), .en(step), .q(q));
    decoder u_lo   (.hex(q[3:0]),  .seg(seg0));
    decoder u_hi   (.hex(q[7:4]),  .seg(seg1));
endmodule
