module idu(
    input [31:0] inst,
    
    output [3:0] rd,
    output [3:0] rs1,
    output [3:0] rs2,
    output [31:0] imm,

    output wen,
    output alu_src,
    output [1:0] wb_sel,
    output pc_sel,
    output illegal,
    output halt,

    output mem_read,
    output mem_write,
    output mem_byte
);

    wire [6:0] opcode = inst[6:0];
    wire [2:0] funct3 = inst[14:12];
    wire [6:0] funct7 = inst[31:25];

    assign rd = inst[10:7];
    assign rs1 = inst[18:15];
    assign rs2 = inst[23:20];
    
    // imm_extend
    wire [31:0] imm_i = {{20{inst[31]}}, inst[31:20]};
    wire [31:0] imm_s = {{20{inst[31]}}, inst[31:25], inst[11:7]};
    wire [31:0] imm_u = {inst[31:12], 12'b0};
    assign imm = is_lui   ? imm_u :
                            is_store ? imm_s :
                                       imm_i;

    // inst
    wire is_addi = (opcode == 7'b0010011) && (funct3 == 3'b000);
    wire is_jalr = (opcode == 7'b1100111) && (funct3 == 3'b000);
    wire is_ebreak = (inst == 32'h00100073);
    wire is_add = (opcode == 7'b0110011) && (funct3 == 3'b000) && (funct7 == 7'b0000000);
    wire is_lui = (opcode == 7'b0110111);
    wire is_lw = (opcode == 7'b0000011) && (funct3 == 3'b010);
    wire is_lbu = (opcode == 7'b0000011) && (funct3 == 3'b100);
    wire is_sw = (opcode == 7'b0100011) && (funct3 == 3'b010);
    wire is_sb = (opcode == 7'b0100011) && (funct3 == 3'b000);

    wire is_load = is_lw || is_lbu;
    wire is_store = is_sw ||is_sb;

    wire supported = is_addi || is_jalr  || is_ebreak ||
                     is_add  || is_store || is_load   ||
                     is_lui;

    wire reg_illegal = (uses_rd  && inst[11]) || 
                       (uses_rs1 && inst[19]) || 
                       (uses_rs2 && inst[24]);
    wire uses_rd   = is_add || is_jalr || is_addi ||
                     is_lui || is_load;             // 检查rd
    wire uses_rs1  = is_add || is_addi || is_jalr || is_load || is_store;
    wire uses_rs2  = is_add || is_store;

    assign illegal = !supported || reg_illegal;     // rd[4] || rs1[4]

    assign wen = !illegal && uses_rd;               // write GPR: store 和 ebreak 不写
    assign alu_src = !is_add;                       // 使用rs2, 其余需要加法的指令使用imm
    assign wb_sel  = is_jalr ? 2'b11                // wbu
                             : is_lui ? 2'b10
                                      : is_load ? 2'b01
                                                : 2'b00;
    assign pc_sel  = is_jalr && !illegal;           // order execute
    
    assign mem_read  = is_load  && !illegal;
    assign mem_write = is_store && !illegal;
    assign mem_byte  = is_lbu || is_sb;

    assign halt    = is_ebreak;

endmodule

