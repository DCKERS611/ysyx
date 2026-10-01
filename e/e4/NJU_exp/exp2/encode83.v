module encode83(
    input  [7:0] x,
    output [2:0] y,
    output       valid
);
    assign y = x[7] ? 3'd7 :
               x[6] ? 3'd6 :
               x[5] ? 3'd5 :
               x[4] ? 3'd4 :
               x[3] ? 3'd3 :
               x[2] ? 3'd2 :
               x[1] ? 3'd1 :
               x[0] ? 3'd0 : 3'd0;

    assign valid = |x;
endmodule
