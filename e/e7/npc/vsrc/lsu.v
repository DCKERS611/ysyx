module lsu(
    input rst,
    input [31:0] addr,
    input [31:0] rs2_data,
    input mem_read,         // 0->不读, 1->读:q:
    input mem_write,        // 0->不写, 1->写
    input mem_byte,

    input [31:0] mem_rdata,
    input read_req,

    output reg [31:0] load_data,
    output [31:0] mem_addr,
    output mem_ren,
    output mem_wen,
    output [31:0] mem_wdata,
    output [3:0] mem_wmask
);

    wire [4:0] byte_shift = {addr[1:0], 3'b000};

    // 组合逻辑访存请求
    assign mem_addr = addr;
    assign mem_ren = !rst && read_req;
    assign mem_wen = !rst && mem_write;

    // sb / sw
    assign mem_wdata = mem_byte ? ((rs2_data & 32'h000000ff) << byte_shift)
                                : rs2_data;

    assign mem_wmask = mem_byte ? (4'b0001 << addr[1:0])
                                : 4'b1111;

    // 外部返回字, 判断取字/取字节
    always @(*) begin
        load_data = 32'b0;
        if (mem_read) begin
            if (mem_byte)
                load_data =  (mem_rdata >> byte_shift) & 32'h000000ff;
            else 
                load_data = mem_rdata;
        end
    end
endmodule

