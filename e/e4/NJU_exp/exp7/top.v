// 实验七-1 仿真顶层：包住 fsm，使 Makefile 的 TOPNAME=top 直接可用
module top(
    input        clk,
    input        rst,
    input        in,
    output       out,
    output [8:0] state
);
    fsm u_fsm (.clk(clk), .rst(rst), .in(in), .out(out), .state(state));
endmodule
