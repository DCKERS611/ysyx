module ysyx_00000000_ifu #(parameter RESET_PC = 32'h8000_0000) (
    input         clk,
    input         rst,
    input  [31:0] next_pc,
    input  [31:0] ifu_rdata,
    input         is_load,
    input         is_store,
    input         ifu_respValid,
    input         lsu_done,

    output [31:0] pc,
    output [31:0] inst,
    output [31:0] ifu_raddr,
    output        inst_valid,
    output        commit,
    output        mem_start,
    output        ifu_reqValid
);

    // 取指请求的随机等待仅用于压力测试
    localparam RANDOM_REQ = 1'b0;
    localparam IDLE      = 2'b00;
    localparam WAIT      = 2'b01;
    localparam MEM_WAIT  = 2'b10;

    wire [1:0] state;
    reg  [1:0] next_state;
    reg  [7:0] req_lfsr;
    wire [31:0] inst_saved;
    wire fetch_done;
    wire is_mem;
    wire normal_done;
    wire mem_done;

    // 回复当拍直接译码，同时保存指令供后续访存等待使用
    assign fetch_done = !rst && (state == WAIT) && ifu_respValid;
    assign inst = rst ? 32'b0 : (fetch_done ? ifu_rdata : inst_saved);
    assign ifu_raddr = pc;
    assign ifu_reqValid =
        !rst && (state == IDLE) && (!RANDOM_REQ || req_lfsr[0]);

    // 仅在拿到访存指令时交付一次任务，具体请求和回复由 LSU 管理
    assign is_mem = is_load || is_store;
    assign mem_start = fetch_done && is_mem;
    assign inst_valid = !rst && (fetch_done || (state == MEM_WAIT));
    assign normal_done = fetch_done && !is_mem;
    assign mem_done = (state == MEM_WAIT) && lsu_done;
    assign commit = !rst && (normal_done || mem_done);

    // IFU 只跟踪取指及本条指令是否完成，不再保存 LSU 发送标志
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (ifu_reqValid)
                    next_state = WAIT;
            end
            WAIT: begin
                if (ifu_respValid)
                    next_state = is_mem ? MEM_WAIT : IDLE;
            end
            MEM_WAIT: begin
                if (lsu_done)
                    next_state = IDLE;
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

    ysyx_00000000_Reg #(2, IDLE) u_state (
        .clk(clk), .rst(rst), .din(next_state), .dout(state), .wen(1'b1)
    );

    ysyx_00000000_Reg #(32, 32'b0) u_inst (
        .clk(clk), .rst(rst), .din(ifu_rdata), .dout(inst_saved), .wen(fetch_done)
    );

    ysyx_00000000_Reg #(32, RESET_PC) u_pc (
        .clk(clk), .rst(rst), .din(next_pc), .dout(pc), .wen(commit)
    );

    // 每拍推进，避免禁止发送时停止在同一个随机值
    always @(posedge clk) begin
        if (rst)
            req_lfsr <= 8'h01;
        else
            req_lfsr <= {
                req_lfsr[6:0],
                req_lfsr[7] ^ req_lfsr[5] ^ req_lfsr[4] ^ req_lfsr[3]
            };
    end
endmodule
