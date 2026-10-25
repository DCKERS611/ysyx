module inst_rom(
    input [7:0] addr,
    output [7:0] inst
);
	MuxKeyWithDefault #(11, 8, 8) u_rom (
        .out(inst), .key(addr), .default_out(8'h00),
        .lut({
            8'd0, 8'h86,
            8'd1, 8'h92,
            8'd2, 8'h01,
            8'd3, 8'h90,
            8'd4, 8'ha0,
            8'd5, 8'hb1,
            8'd6, 8'h17,
            8'd7, 8'h29,
            8'd8, 8'hf9,
            8'd9, 8'h68,
            8'd10, 8'hc3
            })
    );

endmodule
