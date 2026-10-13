module tmp (
    input a,
    input b,
    input sel,
    output y
);

    MuxKey #(2,1,1) mux2_1 (
        y , sel ,{
            1'd0, a,
            1'd1, b
        }
    );
endmodule
