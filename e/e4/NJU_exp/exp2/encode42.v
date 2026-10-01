module encode42(
    input [3:0]     x,
    output [1:0]    y,
    input           en
);
    wire [1:0] enc;
    MuxKeyWithDefault #(4,4,2) i_enc (
        enc , x , 2'b00 , {
        4'b0001,2'b00,
        4'b0010,2'b01,
        4'b0100,2'b10,
        4'b1000,2'b11
        }
    );
    assign y = en ? enc : 2'b00;
    endmodule
