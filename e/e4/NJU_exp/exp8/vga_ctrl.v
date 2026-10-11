module vga_ctrl(
    input pclk,     // 像素时钟
    input rst,

    output [9:0] h_addr,
    output [9:0] v_addr,
    output hsync,
    output vsync,
    output valid,

    output [9:0] x_cnt,
    output [9:0] y_cnt
);
    wire h_valid;
    wire v_valid;

    wire line_end = (x_cnt == 10'd800);

    wire [9:0] x_next = line_end ? 10'd1 : x_cnt + 10'd1;
    wire [9:0] y_next = (y_cnt == 10'd525) ? 10'd1 : y_cnt + 10'd1;

    Reg #(10, 10'd1) u_x_cnt (.clk(pclk), .rst(rst), .din(x_next), .dout(x_cnt), .wen(1'b1));
    Reg #(10, 10'd1) u_y_cnt (.clk(pclk), .rst(rst), .din(y_next), .dout(y_cnt), .wen(line_end));

    // 同步信号
    // 行: 1-96; 列: 1-2
    assign hsync = (x_cnt > 10'd96);
    assign vsync = (y_cnt > 10'd2);

    // 有效显示区: 640*480
    assign h_valid = (x_cnt >= 10'd145) && (x_cnt <= 10'd784);
    assign v_valid = (y_cnt >= 10'd36) && (y_cnt <= 10'd515);
    assign valid = h_valid && v_valid;

    // 有效区地址转换
    assign h_addr = h_valid ? x_cnt - 10'd145 : 10'd0;
    assign v_addr = v_valid ? y_cnt - 10'd36 : 10'd0;

    endmodule
