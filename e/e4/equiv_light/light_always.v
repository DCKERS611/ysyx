module light_always #(parameter CNT_MAX = 32'd5000000) (
    input             clk,
    input             rst,
    output reg [15:0] led,
    output reg [31:0] cnt
);
    always @(posedge clk) begin
        if (rst) begin
            led <= 16'h0001;
            cnt <= 32'b0;
        end else begin
            if (cnt == 0) led <= {led[14:0], led[15]};
            cnt <= (cnt >= CNT_MAX) ? 32'b0 : (cnt + 1);
        end
    end
endmodule
