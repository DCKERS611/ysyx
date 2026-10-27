module top #(parameter RESET_PC = 32'h8000_0000) (
    input clk,
    input rst,
    input [31:0] ifu_rdata,
    input [31:0] mem_rdata,

    output [31:0] pc,
    output [31:0] inst,
    output [31:0] ifu_raddr,
    output inst_valid,
    output commit,
    output illegal,
    output halt,

    output [31:0] mem_addr,
    output mem_ren,
    output mem_wen,
    output [31:0] mem_wdata,
    output [3:0] mem_wmask
);
    wire [31:0] next_pc;
    wire load_req;
    wire illegal_raw;
    wire halt_raw;

    wire [3:0] rd;
    wire [3:0] rs1;
    wire [3:0] rs2;
    wire [31:0] imm;
    wire wen;
    wire alu_src;
    wire [1:0] wb_sel;
    wire pc_sel;

    `ifndef SYNTHESIS
    import "DPI-C" function void ebreak(input int pc);
    always @(posedge clk) begin
        if (!rst && halt && commit) ebreak(pc);
    end
    `endif

    wire [31:0] alu_out;
    wire [31:0] wdata;

    wire [31:0] rs1_data;
    wire [31:0] rs2_data;

    wire mem_read;
    wire mem_write;
    wire mem_byte;
    wire [31:0] load_data;

    assign illegal = illegal_raw && inst_valid;
    assign halt = halt_raw && commit;

    ifu #(.RESET_PC(RESET_PC)) u_ifu (
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc(pc),
        .inst(inst),
        .ifu_rdata(ifu_rdata),
        .ifu_raddr(ifu_raddr),
        .inst_valid(inst_valid),
        .is_load(mem_read),
        .commit(commit),
        .load_req(load_req)
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
        .illegal(illegal_raw),
        .halt(halt_raw),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_byte(mem_byte)
    );

    RegisterFile #(4, 32) u_rf (
        .clk(clk),
        .wdata(wdata),
        .waddr(rd),
        .wen_in(wen && commit),
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
        .rst(rst),
        .addr(alu_out),
        .rs2_data(rs2_data),
        .mem_read(mem_read && inst_valid),
        .read_req(load_req),
        .mem_write(mem_write && commit),
        .mem_byte(mem_byte),
        .mem_rdata(mem_rdata),

        .load_data(load_data),
        .mem_addr(mem_addr),
        .mem_ren(mem_ren),
        .mem_wen(mem_wen),
        .mem_wdata(mem_wdata),
        .mem_wmask(mem_wmask)
    );

endmodule
