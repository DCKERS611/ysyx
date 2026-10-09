module fsm(
    input clk,
    input in,
    input rst,
    output out,
	output [8:0] state
);

    parameter [8:0] S0 = 9'b0_0000_0001,
					S1 = 9'b0_0000_0010,
                    S2 = 9'b0_0000_0100,
                    S3 = 9'b0_0000_1000,
                    S4 = 9'b0_0001_0000,
                    S5 = 9'b0_0010_0000,
                    S6 = 9'b0_0100_0000,
                    S7 = 9'b0_1000_0000,
                    S8 = 9'b1_0000_0000;
	wire [8:0] next_state;

	Reg #(9, S0) u_reg (
        .clk(clk),
        .rst(rst),
        .din(next_state),
        .dout(state),
        .wen(1'b1)
    );

    assign out = state[4] | state[8];

    MuxKeyWithDefault #(9, 9 ,9) u_mux (
        .out(next_state), .key(state), .default_out(S0),
        .lut({
        S0, in ? S5 : S1,
        S1, in ? S5 : S2,
        S2, in ? S5 : S3,
        S3, in ? S5 : S4,
        S4, in ? S5 : S4,
        S5, in ? S6 : S1,
        S6, in ? S7 : S1,
        S7, in ? S8 : S1,
        S8, in ? S8 : S1
        }));
        endmodule
