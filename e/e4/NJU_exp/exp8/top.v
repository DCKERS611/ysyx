module top(
    input clk,
    input rst,
    output [7:0] vga_r,
    output [7:0] vga_g,
    output [7:0] vga_b,
    output vga_hsync,
    output vga_vsync,
    output vga_blank_n,
    
    output [9:0] x_cnt,
    output [9:0] y_cnt,
    output [9:0] h_addr,
    output [9:0] v_addr,

    output [18:0] addr,
    output [11:0] color
);
    /* test
    wire border;
    wire [23:0] color;

    assign border = (h_addr == 10'd0) || (h_addr == 10'd639) || (v_addr == 10'd0) || (v_addr == 10'd479);
    assign color = (valid && border) ? 24'hffffff : 24'h000000;
    */

    wire valid;
    wire hsync, vsync;
    vga_ctrl u_vga_ctrl (
        .pclk(clk),
        .rst(rst),
        .h_addr(h_addr),
        .v_addr(v_addr),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .x_cnt(x_cnt),
        .y_cnt(y_cnt)
    );

    // 拼接地址 实例化rom
    assign addr = {h_addr, v_addr[8:0]};
    Rom u_rom (.clk(clk), .addr(addr), .dout(color));

    // 同步/消隐延迟一拍
    wire hsync_d, vsync_d, valid_d;
    Reg #(1,1'b0) u_hs_d (.clk(clk), .rst(rst), .din(hsync), .dout(hsync_d), .wen(1'b1));
    Reg #(1,1'b0) u_vs_d (.clk(clk), .rst(rst), .din(vsync), .dout(vsync_d), .wen(1'b1));
    Reg #(1,1'b0) u_vd_d (.clk(clk), .rst(rst), .din(valid), .dout(valid_d), .wen(1'b1));

    // 输出使用延迟版
    assign vga_blank_n = valid_d;
    assign vga_hsync = hsync_d;
    assign vga_vsync = vsync_d;

    assign vga_r = valid_d ? {color[11:8], color[11:8]} : 8'h00;
    assign vga_g = valid_d ? {color[7:4], color[7:4]} : 8'h00;
    assign vga_b = valid_d ? {color[3:0], color[3:0]} : 8'h00;

//    assign vga_r = color[23:16];
//    assign vga_g = color[15:8];
//    assign vga_b = color[7:0];
    endmodule
