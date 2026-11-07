module ifu #(parameter RESET_PC = 32'h8000_0000) (
    input clk,
    input rst,
    input [31:0] next_pc,
    input [31:0] ifu_rdata,
    input is_load,
    output [31:0] pc,
    output reg [31:0] inst,
    output [31:0] ifu_raddr,
    output inst_valid,
    output commit,
    output load_req
);

    localparam IDLE = 2'b00;
    localparam WAIT = 2'b01;

    wire [1:0] state, next_state;
    assign next_state = (state == IDLE) ? WAIT 
                                        : (state == WAIT) ? IDLE
                                                          : IDLE;

    assign ifu_raddr = pc;
    assign inst_valid = !rst && (state == WAIT);

    assign commit = !rst && (state == WAIT);
    
    assign load_req = !rst && (state == WAIT) && is_load;

    Reg #(2, IDLE) u_state (
        .clk(clk),
        .rst(rst),
        .din(next_state),
        .dout(state),
        .wen(1'b1)
    );

    Reg #(32, RESET_PC) u_pc (
        .clk(clk),
        .rst(rst),
        .din(next_pc),
        .dout(pc),
        .wen(commit)
    );
    
    always @(*) begin
        if (rst)
            inst = 32'b0;
        else
            inst = ifu_rdata;
    end
endmodule
