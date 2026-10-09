module hex_to_seg(
    input [3:0] hex,
    input en,
    output [7:0] seg
);

    wire [7:0] seg_on;

    MuxKey #(16, 4, 8) u_dec(
        .out(seg_on), .key(hex), .lut({
            4'h0, 8'hFC,
            4'h1, 8'h60,
            4'h2, 8'hDA,
            4'h3, 8'hF2,
            4'h4, 8'h66,
            4'h5, 8'hB6,
            4'h6, 8'hBE,
            4'h7, 8'hE0,
            4'h8, 8'hFE,
            4'h9, 8'hF6,
            4'hA, 8'hEE,
            4'hB, 8'h3E, // 显示为 b
            4'hC, 8'h9C,
            4'hD, 8'h7A, // 显示为 d
            4'hE, 8'h9E,
            4'hF, 8'h8E
        }));

        assign seg = en ? ~seg_on : 8'hff;
        endmodule
