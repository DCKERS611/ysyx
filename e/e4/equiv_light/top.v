module top(
    input             clk,
    input             rst,
    output     [15:0] led_reg,
    output     [15:0] led_always,
    output     [31:0] cnt_reg,
    output     [31:0] cnt_always
);
    light_reg    #(.CNT_MAX(32'd4)) u_reg    (.clk(clk), .rst(rst), .led(led_reg),    .cnt(cnt_reg));
    light_always #(.CNT_MAX(32'd4)) u_always (.clk(clk), .rst(rst), .led(led_always), .cnt(cnt_always));
endmodule
