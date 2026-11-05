module ysyx_00000000_lsu (
    input         clk,
    input         rst,
    input         start,
    input  [31:0] addr,
    input  [31:0] rs2_data,
    input         mem_read,
    input         mem_write,
    input         mem_byte,
    input  [31:0] mem_rdata,
    input         lsu_respValid,

    output reg [31:0] load_data,
    output        lsu_reqValid,
    output        done,
    output [31:0] mem_addr,
    output        mem_ren,
    output        mem_wen,
    output [31:0] mem_wdata,
    output [3:0] mem_wmask,
    
    output [1:0] mem_size
);

    // 数据请求的随机等待仅用于压力测试
    localparam RANDOM_REQ = 1'b0;

    // 一笔访存的有效标志、发送标志和任务字段
    wire task_valid;
    wire task_sent;
    wire [31:0] task_addr;
    wire [31:0] task_wdata;
    wire [3:0] task_wmask;
    wire task_write;
    wire task_byte;
    reg [7:0] req_lfsr;

    wire accept;
    wire task_valid_next;
    wire task_sent_next;
    wire [4:0] input_shift;
    wire [31:0] input_wdata;
    wire [3:0] input_wmask;
    wire active_write;
    wire [4:0] load_shift;

    // 只在空闲时接收一笔 load/store；同一上升沿可接收并发送
    assign accept = !rst && start && !task_valid && (mem_read || mem_write);
    assign done = !rst && task_valid && task_sent && lsu_respValid;
    assign task_valid_next = !done && (task_valid || accept);
    assign task_sent_next = !done && lsu_reqValid;

    // 写数据只在接收时移位一次，任务寄存器保存移位后的结果
    assign input_shift = {addr[1:0], 3'b000};
    assign input_wdata = mem_byte
        ? ((rs2_data & 32'h000000ff) << input_shift) : rs2_data;
    assign input_wmask = mem_byte ? (4'b0001 << addr[1:0]) : 4'b1111;

    // 首次接收当拍直通输入；若被随机推迟，则改用保存的任务字段
    assign mem_addr = task_valid ? task_addr : addr;
    assign mem_size = (task_valid ? task_byte : mem_byte) ? 2'b00 : 2'b10;
    assign mem_wdata = task_valid ? task_wdata : input_wdata;
    assign mem_wmask = task_valid ? task_wmask : input_wmask;
    assign active_write = task_valid ? task_write : mem_write;
    assign lsu_reqValid = !rst && !task_sent && !lsu_respValid &&
        (task_valid || accept) && (!RANDOM_REQ || req_lfsr[1]);
    assign mem_ren = lsu_reqValid && !active_write;
    assign mem_wen = lsu_reqValid && active_write;

    // 读回解释只使用本笔任务保存的访问类型和地址低位
    assign load_shift = {task_addr[1:0], 3'b000};
    always @(*) begin
        load_data = 32'b0;
        if (task_valid && !task_write) begin
            if (task_byte)
                load_data = (mem_rdata >> load_shift) & 32'h000000ff;
            else
                load_data = mem_rdata;
        end
    end

    ysyx_00000000_Reg #(1, 1'b0) u_task_valid (
        .clk(clk), .rst(rst), .din(task_valid_next), .dout(task_valid),
        .wen(accept || done)
    );
    ysyx_00000000_Reg #(1, 1'b0) u_task_sent (
        .clk(clk), .rst(rst), .din(task_sent_next), .dout(task_sent),
        .wen(lsu_reqValid || done)
    );
    ysyx_00000000_Reg #(32, 32'b0) u_task_addr (
        .clk(clk), .rst(rst), .din(addr), .dout(task_addr), .wen(accept)
    );
    ysyx_00000000_Reg #(32, 32'b0) u_task_wdata (
        .clk(clk), .rst(rst), .din(input_wdata), .dout(task_wdata), .wen(accept)
    );
    ysyx_00000000_Reg #(4, 4'b0) u_task_wmask (
        .clk(clk), .rst(rst), .din(input_wmask), .dout(task_wmask), .wen(accept)
    );
    ysyx_00000000_Reg #(1, 1'b0) u_task_write (
        .clk(clk), .rst(rst), .din(mem_write), .dout(task_write), .wen(accept)
    );
    ysyx_00000000_Reg #(1, 1'b0) u_task_byte (
        .clk(clk), .rst(rst), .din(mem_byte), .dout(task_byte), .wen(accept)
    );

    // 与 IFU 的压力序列同样每拍推进，不能依赖请求成功才更新
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
