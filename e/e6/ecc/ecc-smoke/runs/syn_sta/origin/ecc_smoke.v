module ecc_smoke(input wire clk, input wire rst, output reg [7:0] count);
    always @(posedge clk) begin
        if (rst) count <= 8'b0;
        else count <= count + 8'b1;
    end
endmodule
