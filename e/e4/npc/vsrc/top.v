module top(
    input clk,
    input rst,

    output [7:0] led
);

    scpu u_scpu(
        .clk(clk),
        .rst(rst),
        .pc(),
        .inst(),
        .led(led)
    );
    endmodule
