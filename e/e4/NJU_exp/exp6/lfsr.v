module lfsr(
    input        clk,
    input        rst,
    input        en,          // 写使能：为 1 才更新
    output [7:0] q
);
    wire       fb  = q[4] ^ q[3] ^ q[2] ^ q[0];
    wire [7:0] nxt = (q == 8'b0) ? 8'h01 : {fb, q[7:1]};
    Reg #(8, 8'h01) u_q (.clk(clk), .rst(rst), .din(nxt), .dout(q), .wen(en));
endmodule
