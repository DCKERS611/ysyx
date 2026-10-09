module key_handler(
    input clk,
    input clrn,
    input [7:0] data,
    input ready,
    output next_data_n,
    output pressed,
    output [7:0] keycode,
    output [7:0] press_cnt,

    output shift_down,  // 两个shift or
    output ctrl_down    // 两个ctrl or
);
    wire break_pending;
    
    //  区分拓展
    wire extended_pending;
    
    // H r_ctrl l_ctrl r_shift l_shift L
    wire [3:0] modifiers;
    wire [7:0] unused_incoming_ascii;
    
    // 当前ascii是否为支持的数字/字母
    wire incoming_valid;

    // 判断是否接受新字符
    scancode_to_ascii u_filter(
        .scancode(data), .shift_down(1'b0), .ascii(unused_incoming_ascii), .valid(incoming_valid)
    );
    assign shift_down = |modifiers[1:0];
    assign ctrl_down = |modifiers[3:2];
    
    // 数据 -> 每一个posedge处理一字节,同时确认取走
    wire consume = ready & clrn;
    assign next_data_n = ~consume;

    // 收到f0的下一个字节,是松开的键码
    wire extended_prefix = consume & (data == 8'hE0);
    wire release_event = consume & break_pending & ~extended_prefix;
    wire prefix_event  = consume & ~break_pending & (data == 8'hf0);

    // 把f0之外的字节都当作普通键码
    wire make_event = consume & ~break_pending & (data != 8'hf0)
                        & ~extended_prefix;
    wire key_event = make_event | release_event;

    // 没有key按住时 , 收到通码才算一次新的按下
    wire new_press = make_event & ~extended_pending & incoming_valid & ~pressed;

    // 松开的key必须与当前保存的key一致
    wire release_curr = release_event & ~extended_pending & pressed & (data == keycode);

    wire next_extended = extended_prefix ? 1'b1 :
                         key_event ? 1'b0 : extended_pending;

    Reg #(1, 1'b0) u_extended(clk, ~clrn, next_extended,
                            extended_pending, consume);

    // 生成四个组合键寄存器(左右ctrl 左右shift)
    genvar mi;
    generate
        for (mi = 0; mi < 4; mi = mi + 1) begin: gen_modifier
            wire match_modifier;
            assign match_modifier = (mi == 0) ? (~extended_pending & (data == 8'h12)) :
                                    (mi == 1) ? (~extended_pending & (data == 8'h59)) :
                                    (mi == 2) ? (~extended_pending & (data == 8'h14)) :
                                                (extended_pending & (data == 8'h14));
            Reg #(1, 1'b0) u_modifier(clk, ~clrn, ~break_pending,
                modifiers[mi], key_event & match_modifier);
        end
    endgenerate

    wire next_break_pending = release_event ? 1'b0 : 
                                prefix_event ? 1'b1 :
                                    break_pending;
    wire next_pressed = release_curr ? 1'b0 :
                            new_press ? 1'b1 :
                                pressed;
    
    Reg #(1,1'b0) u_break (clk , ~clrn ,
                            next_break_pending , break_pending , consume);
    Reg #(1,1'b0) u_pressed (clk , ~clrn,
                            next_pressed , pressed , consume);
    Reg #(8,8'd0) u_keycode (clk , ~clrn,
                            data , keycode , new_press);
    Reg #(8,8'd0) u_cnt (clk , ~clrn,
                        press_cnt + 8'd1 , press_cnt , new_press);

                    endmodule
