module top(
    input  [7:0] sw,
    output [2:0] led,
    output       led_valid,
    output [7:0] seg
);
    wire [2:0] enc;
    wire       vld;

    encode83 u_enc (
        .x(sw),
        .y(enc),
        .valid(vld)
    );

    assign led       = enc;
    assign led_valid = vld;

    bcd u_seg (
        .bcd({1'b0, enc}),
        .en(vld),
        .seg(seg)
    );
endmodule
