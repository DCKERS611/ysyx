module decode38(
    input [2:0]     x,
    input           en,
    output [7:0]    y
);
    assign y = en ? (8'b00000001 << x) : 8'b00000000;
    endmodule
