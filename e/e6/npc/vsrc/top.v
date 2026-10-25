module top(
    input clk,
    input rst,
    output [31:0] pc,
    output [31:0] inst,

    output illegal
);
    wire [31:0] next_pc;

    wire [3:0] rd;
    wire [3:0] rs1;
    wire [3:0] rs2;
    wire [31:0] imm;
    wire wen;
    wire alu_src;
    wire [1:0] wb_sel;
    wire pc_sel;

    wire halt;
    import "DPI-C" function void ebreak(input int pc);
    always @(posedge clk) begin
        if (!rst && halt) ebreak(pc);
    end

    wire [31:0] alu_out;
    wire [31:0] wdata;

    wire [31:0] rs1_data;
    wire [31:0] rs2_data;

    wire mem_read;
    wire mem_write;
    wire mem_byte;
    wire [31:0] load_data;

    ifu u_ifu (
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc(pc),
        .inst(inst)
    );

    idu u_idu (
        .inst(inst),
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2),
        .imm(imm),
        .wen(wen),
        .alu_src(alu_src),
        .wb_sel(wb_sel),
        .pc_sel(pc_sel),
        .illegal(illegal),
        .halt(halt),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_byte(mem_byte)
    );

    RegisterFile #(4, 32) u_rf (
        .clk(clk),
        .wdata(wdata),
        .waddr(rd),
        .wen_in(wen),
        .raddr1(rs1),
        .raddr2(rs2),
        .rdata1(rs1_data),
        .rdata2(rs2_data)
    );

    exu u_exu (
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .imm(imm),
        .alu_src(alu_src),
        .alu_out(alu_out)
    );

    wbu u_wbu (
        .alu_out(alu_out),
        .load_data(load_data),  // lw/lbu
        .imm(imm),
        .pc(pc),
        .wb_sel(wb_sel),
        .pc_sel(pc_sel),
        .wdata(wdata),
        .next_pc(next_pc)
    );

    lsu u_lsu (
        .clk(clk),
        .rst(rst),
        .addr(alu_out),
        .rs2_data(rs2_data),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .mem_byte(mem_byte),
        .load_data(load_data)
    );

endmodule
