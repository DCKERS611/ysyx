module barrel_shift(
    input [7:0] din,
    input [2:0] shamt,
    input lr,
    input al,
    output [7:0] dout
);
    wire rfill = (al && !lr) ? din[7] : 1'b0;

    wire [7:0] s0 = shamt[0] ? (lr ? {din[6:0],1'b0} : {rfill,din[7:1]}) : din;
    wire [7:0] s1 = shamt[1] ? (lr ? {s0[5:0],{2{1'b0}}} : {{2{rfill}},s0[7:2]}) : s0;
    wire [7:0] s2 = shamt[2] ? (lr ? {s1[3:0],{4{1'b0}}} : {{4{rfill}},s1[7:4]}) : s1;

    assign dout = s2;
    endmodule


    
