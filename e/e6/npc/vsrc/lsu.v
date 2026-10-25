module lsu(
    input clk,
    input rst,
    input [31:0] addr,
    input [31:0] rs2_data,
    input mem_read,         // 0->不读, 1->读:q:
    input mem_write,        // 0->不写, 1->写
    input mem_byte,
    output reg [31:0] load_data
);

    import "DPI-C" function int pmem_read(input int raddr);

    import "DPI-C" function void pmem_write(
        input int waddr,
        input int wdata,
        input byte wmask
    );

    reg [31:0] read_word;
    wire [4:0] byte_shift = {addr[1:0], 3'b000};
    
    always @(*) begin
        read_word = 32'b0;
        load_data = 32'b0;

        if (!rst && mem_read) begin
            read_word = pmem_read(addr);

            if (mem_byte)
                load_data = (read_word >> byte_shift) & 32'h000000ff;
            else 
                load_data = read_word;
        end
    end

    wire [31:0] store_data = mem_byte ? ((rs2_data & 32'h000000ff) << byte_shift)
                                      : rs2_data;

    wire [7:0] store_mask = mem_byte ? (8'h01 << addr[1:0]) 
                                     : 8'h0f;

    always @(posedge clk) begin
        if (!rst && mem_write)
            pmem_write(addr, store_data, store_mask);
    end

endmodule

