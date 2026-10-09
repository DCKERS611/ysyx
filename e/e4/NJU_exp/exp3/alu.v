module alu(
    input [3:0]     a,
    input [3:0]     b,
    input [2:0]     sel,
    output [3:0]    res,
    output          carry,
    output          of,
    output          zero
);

    // 加减法
    wire sub = (sel == 3'b001) || (sel == 3'b110) || (sel == 3'b111);
    wire [3:0] t_b = b ^ {4{sub}};
    wire [3:0] r_addsub;
    wire       c_addsub;

    add4 u_add (.a(a) , .b(t_b) , .cin(sub) , .s(r_addsub) , .cout(c_addsub));

    wire of_addsub = (a[3] == t_b[3]) && (r_addsub[3] != a[3]);

    // 逻辑运算
    wire [3:0] r_not = ~a;
    wire [3:0] r_and = a & b;
    wire [3:0] r_or  = a | b;
    wire [3:0] r_xor = a ^ b;

    // 比较
    wire min_s  = r_addsub[3] ^ of_addsub;
    wire eq     = ~(| r_addsub);
    wire [3:0] r_lt = {3'b0 , min_s};
    wire [3:0] r_eq = {3'b0 , eq};

    // alu功能选择
    MuxKey #(8 , 3 ,4) res_mux (res , sel , {
        3'd0, r_addsub,
        3'd1, r_addsub,
        3'd2, r_not,
        3'd3, r_and,
        3'd4, r_or,
        3'd5, r_xor,
        3'd6, r_lt,
        3'd7, r_eq
        });

    assign carry = c_addsub;
    assign of = of_addsub;
    assign zero = ~(| res);
    endmodule
