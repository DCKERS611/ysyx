module gpr(
    input clk,
    input rst,

    input [1:0] waddr,
    input [7:0] wdata,

    input [1:0] raddr1,
    input [1:0] raddr2,

    input wen,

    output [7:0] rdata1,
    output [7:0] rdata2
);
    wire [7:0] regs [0:3];

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin: gen_reg
            wire w_en;
            assign w_en = wen & (waddr == i[1:0]);

            Reg #(8, 8'h00) u_reg (
                .clk(clk),
                .rst(rst),
                .din(wdata),
                .dout(regs[i]),
                .wen(w_en)
            );
        end
    endgenerate

    assign rdata1 = regs[raddr1];
    assign rdata2 = regs[raddr2];

    endmodule
