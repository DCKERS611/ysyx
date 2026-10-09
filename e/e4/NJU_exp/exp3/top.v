module top(
    input [3:0] a,
    input [3:0] b,
    input [2:0] sel,
    output [3:0] res,
    output carry,
    output of,
    output zero
);

    alu u_alu (
        .a(a),
        .b(b),
        .sel(sel),
        .res(res),
        .carry(carry),
        .of(of),
        .zero(zero)
    );
    endmodule
