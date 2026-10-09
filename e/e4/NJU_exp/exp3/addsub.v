module addsub(
    input [3:0]     a,
    input [3:0]     b,
    input           sub,
    output [3:0]    res,
    output          carry,
    output          of,
    output          zero
);

    wire [3:0] t_b = b ^ {4{sub}};

    add4 u_add (
        .a(a),
        .b(t_b),
        .cin(sub),
        .s(res),
        .cout(carry)
    );
    
    assign of = (a[3] == t_b[3]) && (res[3] != a[3]);
    assign zero = ~(| res);
    endmodule
