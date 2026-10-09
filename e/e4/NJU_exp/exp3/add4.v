module add4(
    input [3:0]     a,
    input [3:0]     b,
    input           cin,
    output [3:0]    s,
    output          cout
);

    wire [4:0] carry;
    assign carry[0] = cin;
    
    genvar i;
    generate
        for (i = 0; i < 4 ; i = i + 1) begin : gen_adder
            full_adder u (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .s(s[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
    
    assign cout = carry[4];
    endmodule
