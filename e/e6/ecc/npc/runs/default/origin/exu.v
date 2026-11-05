module exu(
    input [31:0] rs1_data,
    input [31:0] rs2_data,
    input [31:0] imm,
    input alu_src,
    output [31:0] alu_out
);
    wire [31:0] alu_b = alu_src ? imm : rs2_data;

    assign alu_out = rs1_data + alu_b;

    endmodule
