module our;
    
    import "DPI-C" function int add(input int a, input int b);

    initial begin
        $display("1 + 2 = %0d", add(1, 2));
        $display("3 + 4 = %0d", add(3, 4));
    end
endmodule
