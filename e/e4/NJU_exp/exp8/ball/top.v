module top(
    input clk,
    input rst,
	output [7:0] vga_r,
    output [7:0] vga_g,
    output [7:0] vga_b,
    output vga_hsync,
    output vga_vsync,
    output vga_blank_n,

	output [9:0] ball_x,
	output [9:0] ball_y,
	output dir_x,
	output dir_y
    
);

    wire [9:0] h_addr, v_addr, x_cnt, y_cnt;
    wire hsync, vsync, valid;
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

	assign vga_hsync   = hsync;
	assign vga_vsync   = vsync;
	assign vga_blank_n = valid;


	// 球内=红，球外=黑，消隐=黑
	assign vga_r = (valid && in_ball) ? 8'hFF : 8'h00;
	assign vga_g = 8'h00;
	assign vga_b = 8'h00;

    // 帧节拍
    wire frame_tick = (x_cnt == 10'd1) && (y_cnt == 10'd1);
    // 判断像素在不在球内
    wire in_ball = (h_addr >= ball_x) && (h_addr < ball_x + 10'd100) &&
                    (v_addr >= ball_y) && (v_addr < ball_y + 10'd100);
	ball u_ball(
        .clk(clk),
        .rst(rst),
        .en(frame_tick),
        .ball_x(ball_x),
        .ball_y(ball_y),
        .dir_x(dir_x),
        .dir_y(dir_y)
    );


endmodule
