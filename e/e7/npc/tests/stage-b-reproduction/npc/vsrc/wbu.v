module wbu(
    input [31:0] alu_out,
    input [31:0] load_data,
    input [31:0] imm,
    input [31:0] pc,
    input [1:0] wb_sel,
    input pc_sel,           // 1->跳转, 0->排查+

    output [31:0] wdata,    // 送gpr  写口
    output [31:0] next_pc   // 送ifu 的pc 寄存器 din
);
    wire [31:0] pc_plus4 = pc + 32'd4;
    wire [31:0] jump_target = alu_out & ~32'd1;

    MuxKey #(4, 2, 32) u_wb_mux (wdata, wb_sel, {
        2'b00, alu_out,     // add/addi
        2'b01, load_data,   // lw/lbu
        2'b10, imm,         // lui
        2'b11, pc_plus4     // jalr
    });

    assign next_pc = pc_sel ? jump_target : pc_plus4;

    endmodule
