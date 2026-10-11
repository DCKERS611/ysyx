module ball(
    input clk,
    input rst,
    input en,
    output [9:0] ball_x,
    output [9:0] ball_y,
    output dir_x,   // 0: right, 1: left
    output dir_y    // 0: down,  1: up
);

    localparam [9:0] vx = 10'd4, vy = 10'd3;
    localparam left_wall = 10'd0, right_wall = 10'd540;
    localparam ceil_wall = 10'd0, down_wall = 10'd380;

    // direction: x
    wire hit_right = (dir_x == 1'b0) && (ball_x + vx > right_wall);
    wire hit_left  = (dir_x == 1'b1) && (ball_x < vx);
    wire hit_x  = hit_right || hit_left;
    wire [9:0] next_ball_x = hit_right ? right_wall :
                             hit_left  ? left_wall :
                             (dir_x ? ball_x - vx : ball_x + vx);
    wire next_dir_x = hit_x ? ~dir_x : dir_x;

    Reg #(10, 270) u_ball_x (
        .clk(clk),
        .rst(rst),
        .din(next_ball_x),
        .dout(ball_x),
        .wen(en)
    );
    Reg #(1, 0) u_dir_x (
        .clk(clk),
        .rst(rst),
        .din(next_dir_x),
        .dout(dir_x),
        .wen(en)
    );
    
    // direction: y
	wire hit_ceil = (dir_y == 1'b1) && (ball_y < vy);
    wire hit_down = (dir_y == 1'b0) && (ball_y + vy  > down_wall);
    wire hit_y  = hit_ceil || hit_down;
    wire [9:0] next_ball_y = hit_down ? down_wall :
                             hit_ceil ? ceil_wall :
                             (dir_y ? ball_y - vy : ball_y + vy);
    wire next_dir_y = hit_y ? ~dir_y : dir_y;

    Reg #(10, 190) u_ball_y (
        .clk(clk),
        .rst(rst),
        .din(next_ball_y),
        .dout(ball_y),
        .wen(en)
    );
    Reg #(1, 0) u_dir_y (
        .clk(clk),
        .rst(rst),
        .din(next_dir_y),
        .dout(dir_y),
        .wen(en)
    );
    endmodule
