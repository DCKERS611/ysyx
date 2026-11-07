module ysyx_00000000 #(parameter RESET_PC = 32'h8000_0000) (
    input clock,
    input reset,
    input [31:0] io_ifu_rdata,
    input [31:0] io_lsu_rdata,
    input io_ifu_respValid,
    input io_lsu_respValid,
    output [31:0] io_ifu_addr,
    output io_ifu_reqValid,
    output io_lsu_reqValid,
    output [31:0] io_lsu_addr,
    output [1:0] io_lsu_size,
    output io_lsu_wen,
    output [31:0] io_lsu_wdata,
    output [3:0] io_lsu_wmask
);
    // CPU 内部状态与调试信号
    wire [31:0] pc;
    wire [31:0] inst;
    wire inst_valid;
    wire commit;
    wire illegal;
    wire halt;

    wire [31:0] next_pc;
    wire mem_start;
    wire lsu_done;
    wire illegal_raw;
    wire decode_illegal;
    wire csr_access;
    wire csr_write;
    wire csr_illegal;
    wire [31:0] csr_source;
    wire halt_raw;
    wire [3:0] rd;
    wire [3:0] rs1;
    wire [3:0] rs2;
    wire [31:0] imm;
    wire wen;
    wire alu_src;
    wire [2:0] wb_sel;
    wire pc_sel;
    wire [31:0] csr_rdata;
    wire retire;

    `ifndef SYNTHESIS
    import "DPI-C" function void ebreak(input int pc);
    always @(posedge clock) begin
        if (!reset && halt && commit) ebreak(pc);
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
    wire unused_mem_ren;

    assign illegal_raw = decode_illegal || csr_illegal;
    assign illegal = illegal_raw && inst_valid;
    assign retire = commit;
    assign csr_source = inst[14] ? {27'b0, inst[19:15]} : rs1_data;
    assign halt = halt_raw && commit;

    ysyx_00000000_ifu #(.RESET_PC(RESET_PC)) u_ifu (
        .clk(clock),
        .rst(reset),
        .next_pc(next_pc),
        .pc(pc),
        .inst(inst),
        .ifu_rdata(io_ifu_rdata),
        .ifu_raddr(io_ifu_addr),
        .inst_valid(inst_valid),
        .is_load(mem_read),
        .is_store(mem_write),
        .reject(illegal),
        .commit(commit),
        .mem_start(mem_start),
        .ifu_respValid(io_ifu_respValid),
        .ifu_reqValid(io_ifu_reqValid),
        .lsu_done(lsu_done)
    );
    ysyx_00000000_idu u_idu (
        .inst(inst),
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2),
        .imm(imm),
        .wen(wen),
        .alu_src(alu_src),
        .wb_sel(wb_sel),
        .pc_sel(pc_sel),
        .illegal(decode_illegal),
        .halt(halt_raw),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_byte(mem_byte),
        .is_csr(csr_access),
        .csr_write(csr_write)
    );
    ysyx_00000000_RegisterFile #(4, 32) u_rf (
        .clk(clock),
        .wdata(wdata),
        .waddr(rd),
        .wen_in(wen && commit),
        .raddr1(rs1),
        .raddr2(rs2),
        .rdata1(rs1_data),
        .rdata2(rs2_data)
    );
    ysyx_00000000_exu u_exu (
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .imm(imm),
        .alu_src(alu_src),
        .alu_out(alu_out)
    );
    ysyx_00000000_wbu u_wbu (
        .alu_out(alu_out),
        .load_data(load_data),  // lw/lbu
        .imm(imm),
        .pc(pc),
        .wb_sel(wb_sel),
        .pc_sel(pc_sel),
        .wdata(wdata),
        .next_pc(next_pc),
        .csr_rdata(csr_rdata)
    );
    ysyx_00000000_lsu u_lsu (
        .clk(clock),
        .rst(reset),
        .start(mem_start),
        .addr(alu_out),
        .rs2_data(rs2_data),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_byte(mem_byte),
        .mem_rdata(io_lsu_rdata),
        .lsu_respValid(io_lsu_respValid),
        .lsu_reqValid(io_lsu_reqValid),
        .done(lsu_done),
        .load_data(load_data),
        .mem_addr(io_lsu_addr),
        .mem_size(io_lsu_size),
        .mem_ren(unused_mem_ren),
        .mem_wen(io_lsu_wen),
        .mem_wdata(io_lsu_wdata),
        .mem_wmask(io_lsu_wmask)
    );
    
    ysyx_00000000_csr u_csr (
        .clock(clock),
        .reset(reset),
        .retire(retire),
        .csr_access(csr_access),
        .csr_commit(commit && csr_access),
        .csr_write(csr_write),
        .csr_cmd(inst[13:12]),
        .csr_source(csr_source),
        .csr_addr(inst[31:20]),
        .csr_rdata(csr_rdata),
        .csr_illegal(csr_illegal)
    );
endmodule
