module shift_reg(
    input       clk,
    input       rst,
    input [2:0] ctrl,
    input [7:0] din,
    input       sin,
    output [7:0] q
);
    wire [7:0] n_clr = 8'b0;
    wire [7:0] n_load = din;
    wire [7:0] n_lsr = {1'b0  ,q[7:1]};
    wire [7:0] n_lsl = {q[6:0],  1'b0};
    wire [7:0] n_asr = {q[7]  ,q[7:1]};
    wire [7:0] n_sin = {sin   ,q[7:1]};
    wire [7:0] n_ror = {q[0]  ,q[7:1]};
    wire [7:0] n_rol = {q[6:0],  q[7]};

    wire [7:0] next;
    MuxKey #(8 , 3 , 8) next_mux (next , ctrl ,{
        3'd0, n_clr,
        3'd1, n_load,
        3'd2, n_lsr,
        3'd3, n_lsl,
        3'd4, n_asr,
        3'd5, n_sin,
        3'd6, n_ror,
        3'd7, n_rol
        });

    Reg #(8 , 8'h00) u_reg (
        .clk(clk),
        .rst(rst),
        .din(next),
        .dout(q),
        .wen(1'b1)
    );
    endmodule
