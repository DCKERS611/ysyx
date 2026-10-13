module light_reg #(parameter CNT_MAX = 32'd5000000) (
    input clk,
    input rst,
    output [15:0] led,
    output [31:0] cnt
);
    wire [31:0] next_cnt;
    wire [15:0] next_led;

    Reg #(.WIDTH(32) , .RESET_VAL(32'b0)) cnt_reg (
        .clk(clk),
        .rst(rst),
        .din(next_cnt),
        .dout(cnt),
        .wen(1'b1)
    );

    Reg #(.WIDTH(16) , .RESET_VAL(16'h0001)) led_reg (
        .clk(clk),
        .rst(rst),
        .din(next_led),
        .dout(led),
        .wen(1'b1)
    );

    assign next_cnt = (cnt >= CNT_MAX) ? 32'b0 : (cnt + 1);
    assign next_led = (cnt == 0) ? {led[14:0], led[15]} : led;
endmodule
