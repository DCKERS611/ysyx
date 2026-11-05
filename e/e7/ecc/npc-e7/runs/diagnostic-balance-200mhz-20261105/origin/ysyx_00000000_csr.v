module ysyx_00000000_csr (
    input clock,
    input reset,
    input retire,
    input [11:0] csr_addr,
    output [31:0] csr_rdata
);
    reg [63:0] csr_mcycle;
    reg [63:0] csr_minstret;

    always @(posedge clock) begin
        if (reset)
            csr_mcycle <= 64'd0;
        else
            csr_mcycle <= csr_mcycle + 64'd1;
    end

    always @(posedge clock) begin
        if (reset)
            csr_minstret <= 64'd0;
        else if (retire)
            csr_minstret <= csr_minstret + 64'd1;
    end

    // 根据 CSR 地址，返回计数器的低或高 32 位
    assign csr_rdata =
        (csr_addr == 12'hB00) ? csr_mcycle[31:0]    :
        (csr_addr == 12'hB80) ? csr_mcycle[63:32]   :
        (csr_addr == 12'hB02) ? csr_minstret[31:0]  :
        (csr_addr == 12'hB82) ? csr_minstret[63:32] :
        (csr_addr == 12'hF11) ? 32'h79737978        :
        (csr_addr == 12'hF12) ? 32'd100023589       :
        32'b0;

endmodule
