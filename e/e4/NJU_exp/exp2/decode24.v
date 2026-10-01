module decode24(
    input  [1:0] x,
    input        en,
    output [3:0] y
);
    wire [3:0] dec;
    MuxKey #(4, 2, 4) i_dec (
        dec, x, {
            2'b00, 4'b0001,
            2'b01, 4'b0010,
            2'b10, 4'b0100,
            2'b11, 4'b1000
        }
    );
    assign y = en ? dec : 4'b0000;
endmodule
