module top(
    input clk,
    input clrn,
    input ps2_data,
    input ps2_clk,
    output overflow,

    output pressed,
    output [7:0] keycode,
    output [7:0] press_cnt,

    output [7:0] ascii,
    output ascii_valid,
    output shift_down,
    output ctrl_down,

    output [7:0] seg0,
    output [7:0] seg1,
    output [7:0] seg2,
    output [7:0] seg3,
    output [7:0] seg4,
    output [7:0] seg5,
    output [7:0] seg6,
    output [7:0] seg7
);
    wire [7:0] scan_data;
    wire scan_ready;
    wire next_data_n;

    // Unused displays: active-low segments, all high means off.
    assign seg6 = 8'hFF;
    assign seg7 = 8'hFF;

    wire display_en;
    assign display_en = pressed & ascii_valid;
    
    wire [7:0] base_ascii;
    wire [7:0] shifted_digit;
    scancode_to_ascii u_ascii(.scancode(keycode), .shift_down(shift_down), .ascii(base_ascii), .valid(ascii_valid));
    // US keyboard Shift + digit symbols.
    MuxKeyWithDefault #(10, 8, 8) u_shift_digit(
        .out(shifted_digit), .key(base_ascii), .default_out(base_ascii),
        .lut({
            8'h30, 8'h29, 8'h31, 8'h21, 8'h32, 8'h40,
            8'h33, 8'h23, 8'h34, 8'h24, 8'h35, 8'h25,
            8'h36, 8'h5E, 8'h37, 8'h26, 8'h38, 8'h2A,
            8'h39, 8'h28
        })
    );
    wire is_letter = (base_ascii >= 8'h61) & (base_ascii <= 8'h7A);
    assign ascii = shift_down ? (is_letter ? base_ascii - 8'h20 : shifted_digit)
                              : base_ascii;

    // low 2 bit: scancode
    hex_to_seg u_seg0 (.hex(keycode[3:0]), .en(display_en), .seg(seg0));
    hex_to_seg u_seg1 (.hex(keycode[7:4]), .en(display_en), .seg(seg1));

    // mid 2 bit: ASCII
    hex_to_seg u_seg2 (.hex(ascii[3:0]), .en(display_en), .seg(seg2));
    hex_to_seg u_seg3 (.hex(ascii[7:4]), .en(display_en), .seg(seg3));
    
    // high 2 bit: acc(HEX)
    hex_to_seg u_seg4 (.hex(press_cnt[3:0]), .en(1'b1), .seg(seg4));
    hex_to_seg u_seg5 (.hex(press_cnt[7:4]), .en(1'b1), .seg(seg5));
    
    ps2_keyboard u_receiver(
        .clk(clk),
        .clrn(clrn),
        .ps2_clk(ps2_clk),
        .ps2_data(ps2_data),
        .next_data_n(next_data_n),
        .data(scan_data),
        .ready(scan_ready),
        .overflow(overflow)
    );

    key_handler u_handler(
        .clk(clk),
        .clrn(clrn),
        .data(scan_data),
        .ready(scan_ready),
        .next_data_n(next_data_n),
        .pressed(pressed),
        .keycode(keycode),
        .press_cnt(press_cnt),
        .shift_down(shift_down),
        .ctrl_down(ctrl_down)
    );
    endmodule
