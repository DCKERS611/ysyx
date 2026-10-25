module scpu(
    input clk,
    input rst,
    
    output [7:0] pc,
    output [7:0] inst,
    
    output [7:0] led
);
    wire [7:0] next_pc;
	wire [1:0] opcode;
    wire [1:0] rd;
    wire [1:0] shift_sel;
    wire [1:0] imm;
    wire [1:0] res1;
    wire [1:0] res2;

    wire is_li;
    wire is_add;
    wire is_bner;
    wire is_io;
    wire io_dir;
    wire [2:0] io_idx;

    wire [7:0] rdata1;
    wire [7:0] rdata2;
    wire [1:0] raddr1;
    wire [1:0] raddr2;
    wire       w_reg;
    wire [7:0] wdata;

    wire [7:0] li_data;
    wire [7:0] add_res;
    wire [7:0] offset_ex;
    wire [7:0] branch_target;
    wire       branch_taken;

    wire w_led;

    // 当前指令地址
    Reg #(8, 8'h00) u_pc (
        .clk(clk),
        .rst(rst),
        .din(next_pc),
        .dout(pc),
        .wen(1'b1)
    );

    // pc移位受到bner循环模块控制
    assign next_pc = branch_taken ? branch_target : (pc + 8'd1);

    // rom存指
	inst_rom u_rom (
		.addr(pc),
		.inst(inst)
	);

    // li
    /*
        inst    7 6     5 4     3 2     1 0
                op      rd      sel     data
    */
    assign opcode           = inst[7:6];
    assign rd               = inst[5:4];
    assign shift_sel        = inst[3:2];
    assign imm              = inst[1:0];

    assign is_li = (opcode == 2'b10);

    // enhanced_li
    MuxKey #(4, 2, 8) u_li_imm (
        .out(li_data), .key(shift_sel),
        .lut({
            2'd0, {6'b0, imm},
            2'd1, {4'b0, imm, 2'b0},
            2'd2, {2'b0, imm, 4'b0},
            2'd3, {imm, 6'b0}
        })
    );

    // gpr
    gpr u_gpr (
        .clk(clk),
        .rst(rst),
        .wdata(wdata),
        .waddr(rd),
        .wen(w_reg),

        .raddr1(raddr1),
        .raddr2(raddr2),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );

    // add
    assign res1 = inst[3:2];
    assign res2 = inst[1:0];
    assign is_add = (opcode == 2'b00);
    assign add_res = rdata1 + rdata2;

    assign w_reg = is_li | is_add;
    assign wdata = is_li ? li_data : add_res;

    // bner0
    assign is_bner = (opcode == 2'b11);
    assign raddr1 = is_bner ? 2'd0 : res1;
    // io 输出使用 rd 指定源寄存器，其他指令使用 rs2
    assign raddr2 = is_io ? rd : res2;
    assign branch_taken = is_bner & (rdata1 != rdata2);
    assign offset_ex = {{4{inst[5]}}, inst[5:2]};
    assign branch_target = pc + offset_ex;

    // io
    assign is_io          = (opcode == 2'b01);
    assign io_dir         = inst[3];
    assign io_idx   = inst[2:0];

    assign w_led = is_io & io_dir & (io_idx == 3'd0);

    // led
    Reg #(8, 8'h00) u_led (
        .clk(clk),
        .rst(rst),
        .din(rdata2),
        .dout(led),
        .wen(w_led)
    );


endmodule
