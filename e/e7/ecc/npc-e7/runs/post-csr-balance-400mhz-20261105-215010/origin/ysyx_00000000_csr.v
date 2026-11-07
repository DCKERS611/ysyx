module ysyx_00000000_csr (
    input clock,
    input reset,
    input retire,
    input csr_access,
    input csr_commit,
    input csr_write,
    input [1:0] csr_cmd,
    input [31:0] csr_source,
    input [11:0] csr_addr,
    output [31:0] csr_rdata,
    output csr_illegal
);
    reg [63:0] csr_mcycle;
    reg [63:0] csr_minstret;

    wire select_cycle = (csr_addr == 12'hB00) || (csr_addr == 12'hB80);
    wire select_instret = (csr_addr == 12'hB02) || (csr_addr == 12'hB82);
    wire select_id = (csr_addr == 12'hF11) || (csr_addr == 12'hF12);
    wire address_valid = select_cycle || select_instret || select_id;

    // 先判断写意图，再检查只读权限；非x0寄存器值为0也属于写访问。
    assign csr_illegal = csr_access &&
        (!address_valid || (csr_cmd == 2'b00) || (csr_write && select_id));

    assign csr_rdata =
        (csr_addr == 12'hB00) ? csr_mcycle[31:0]    :
        (csr_addr == 12'hB80) ? csr_mcycle[63:32]   :
        (csr_addr == 12'hB02) ? csr_minstret[31:0]  :
        (csr_addr == 12'hB82) ? csr_minstret[63:32] :
        (csr_addr == 12'hF11) ? 32'h79737978        :
        (csr_addr == 12'hF12) ? 32'd100023589       :
        32'b0;

    // 写入、置位、清位均使用指令执行前的旧值，GPR也读回这个旧值。
    wire [31:0] write_value =
        (csr_cmd == 2'b01) ? csr_source :
        (csr_cmd == 2'b10) ? (csr_rdata | csr_source) :
                            (csr_rdata & ~csr_source);
    wire do_write = csr_commit && csr_write && !csr_illegal;

    // 显式写整个64位计数器的任一半部时，优先于本拍自动递增。
    always @(posedge clock) begin
        if (reset)
            csr_mcycle <= 64'd0;
        else if (do_write && select_cycle)
            csr_mcycle <= csr_addr[7] ? {write_value, csr_mcycle[31:0]}
                                     : {csr_mcycle[63:32], write_value};
        else
            csr_mcycle <= csr_mcycle + 64'd1;
    end

    always @(posedge clock) begin
        if (reset)
            csr_minstret <= 64'd0;
        else if (do_write && select_instret)
            csr_minstret <= csr_addr[7] ? {write_value, csr_minstret[31:0]}
                                      : {csr_minstret[63:32], write_value};
        else if (retire)
            csr_minstret <= csr_minstret + 64'd1;
    end
endmodule
