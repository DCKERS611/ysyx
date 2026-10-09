module scancode_to_ascii(
    input  [7:0] scancode,
    input        shift_down,
    output [7:0] ascii,
    output       valid
);

    wire [8:0] lookup_result;
    wire [7:0] base_ascii;
    wire [7:0] shifted_digit;
    wire is_letter;

    MuxKeyWithDefault #(36, 8, 9) u_lookup(
        .out(lookup_result),
        .key(scancode),
        .default_out(9'b0),
        .lut({
            // 扫描码，{有效标志，ASCII}
            8'h1C, {1'b1, 8'h61}, // a
            8'h32, {1'b1, 8'h62}, // b
            8'h21, {1'b1, 8'h63}, // c
            8'h23, {1'b1, 8'h64}, // d
            8'h24, {1'b1, 8'h65}, // e
            8'h2B, {1'b1, 8'h66}, // f
            8'h34, {1'b1, 8'h67}, // g
            8'h33, {1'b1, 8'h68}, // h
            8'h43, {1'b1, 8'h69}, // i
            8'h3B, {1'b1, 8'h6A}, // j
            8'h42, {1'b1, 8'h6B}, // k
            8'h4B, {1'b1, 8'h6C}, // l
            8'h3A, {1'b1, 8'h6D}, // m
            8'h31, {1'b1, 8'h6E}, // n
            8'h44, {1'b1, 8'h6F}, // o
            8'h4D, {1'b1, 8'h70}, // p
            8'h15, {1'b1, 8'h71}, // q
            8'h2D, {1'b1, 8'h72}, // r
            8'h1B, {1'b1, 8'h73}, // s
            8'h2C, {1'b1, 8'h74}, // t
            8'h3C, {1'b1, 8'h75}, // u
            8'h2A, {1'b1, 8'h76}, // v
            8'h1D, {1'b1, 8'h77}, // w
            8'h22, {1'b1, 8'h78}, // x
            8'h35, {1'b1, 8'h79}, // y
            8'h1A, {1'b1, 8'h7A}, // z

            8'h45, {1'b1, 8'h30}, // 0
            8'h16, {1'b1, 8'h31}, // 1
            8'h1E, {1'b1, 8'h32}, // 2
            8'h26, {1'b1, 8'h33}, // 3
            8'h25, {1'b1, 8'h34}, // 4
            8'h2E, {1'b1, 8'h35}, // 5
            8'h36, {1'b1, 8'h36}, // 6
            8'h3D, {1'b1, 8'h37}, // 7
            8'h3E, {1'b1, 8'h38}, // 8
            8'h46, {1'b1, 8'h39}  // 9
        })
    );

    assign valid = lookup_result[8];
    assign base_ascii = lookup_result[7:0];

    MuxKeyWithDefault #(10, 8, 8) u_shift_digit(
        .out(shifted_digit),
        .key(base_ascii),
        .default_out(base_ascii),
        .lut({
            8'h30, 8'h29, // 0 → )
            8'h31, 8'h21, // 1 → !
            8'h32, 8'h40, // 2 → @
            8'h33, 8'h23, // 3 → #
            8'h34, 8'h24, // 4 → $
            8'h35, 8'h25, // 5 → %
            8'h36, 8'h5E, // 6 → ^
            8'h37, 8'h26, // 7 → &
            8'h38, 8'h2A, // 8 → *
            8'h39, 8'h28  // 9 → (
        })
    );

    assign is_letter = (base_ascii >= 8'h61) & (base_ascii <= 8'h7a);
    assign ascii = 
        shift_down ? 
            (is_letter ? base_ascii - 8'h20 : shifted_digit) :
            base_ascii;
endmodule
