module decoder(
    input [3:0] hex,
    output [7:0] seg
);

    wire [7:0] code;
    MuxKey #(16 , 4 , 8) u (
        code, hex, {
            4'h0, 8'hfc,
            4'h1, 8'h60,
            4'h2, 8'hda,
            4'h3, 8'hf2,
            4'h4, 8'h66,
            4'h5, 8'hb6,
            4'h6, 8'hbe,
            4'h7, 8'hE0,
            4'h8, 8'hFE,
            4'h9, 8'hF6,
            4'hA, 8'hEE,
            4'hB, 8'h3E,
            4'hC, 8'h9C,
            4'hD, 8'h7A,
            4'hE, 8'h9E,
            4'hF, 8'h8E
    });

    assign seg = ~code;

    endmodule
