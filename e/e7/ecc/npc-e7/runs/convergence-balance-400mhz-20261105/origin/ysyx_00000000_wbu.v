module ysyx_00000000_wbu(
    input [31:0] alu_out,
    input [31:0] load_data,
    input [31:0] imm,
    input [31:0] pc,
    input [2:0] wb_sel,
    input pc_sel,           // 1->跳转, 0->排查+
    input [31:0] csr_rdata,

    output [31:0] wdata,    // 送gpr  写口
    output [31:0] next_pc   // 送ifu 的pc 寄存器 din
);
    wire [31:0] pc_plus4 = pc + 32'd4;
    wire [31:0] jump_target = alu_out & ~32'd1;

    ysyx_00000000_MuxKey #(5, 3, 32) u_wb_mux (wdata, wb_sel, {
        3'b000, alu_out,     // add/addi
        3'b001, load_data,   // lw/lbu
        3'b010, imm,         // lui
        3'b011, pc_plus4,    // jalr
        3'b100, csr_rdata    // csr
    });

    assign next_pc = pc_sel ? jump_target : pc_plus4;

    endmodule
