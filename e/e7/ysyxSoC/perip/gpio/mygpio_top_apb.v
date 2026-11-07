module mygpio_top_apb(
  input         clock,
  input         reset,
  input  [31:0] in_paddr,
  input         in_psel,
  input         in_penable,
  input  [2:0]  in_pprot,
  input         in_pwrite,
  input  [31:0] in_pwdata,
  input  [3:0]  in_pstrb,
  output        in_pready,
  output [31:0] in_prdata,
  output        in_pslverr,

  output [15:0] gpio_out,
  input  [15:0] gpio_in,
  output [7:0]  gpio_seg_0,
  output [7:0]  gpio_seg_1,
  output [7:0]  gpio_seg_2,
  output [7:0]  gpio_seg_3,
  output [7:0]  gpio_seg_4,
  output [7:0]  gpio_seg_5,
  output [7:0]  gpio_seg_6,
  output [7:0]  gpio_seg_7
);
    reg [15:0] reg_led;
    reg [31:0] reg_seg;
    
    wire led_we;
    wire seg_we;

    assign led_we = in_psel & in_penable & in_pready 
                    & in_pwrite & (in_paddr[3:2] == 2'b00);
    assign seg_we = in_psel & in_penable & in_pready 
                    & in_pwrite & (in_paddr[3:2] == 2'b10);
    assign in_prdata = (in_paddr[3:2] == 2'b00) 
                       ? {16'b0, reg_led} 
                       : (in_paddr[3:2] == 2'b01) 
                       ? {16'b0, gpio_in}
                       : (in_paddr[3:2] == 2'b10)
                       ? reg_seg
                       : 32'b0;
    assign in_pready = in_psel & in_penable;
    assign in_pslverr = 1'b0;
    assign gpio_out = reg_led;
    
    always @(posedge clock) begin
        if (reset) 
            reg_led <= 16'b0;
        else if (led_we) begin
            // LED只实现低16位；PSTRB未选中的字节保持原值。
            if (in_pstrb[0]) reg_led[7:0] <= in_pwdata[7:0];
            if (in_pstrb[1]) reg_led[15:8] <= in_pwdata[15:8];
        end
    end
        
    always @(posedge clock) begin
        if (reset)
            reg_seg <= 32'b0;
        else if (seg_we) begin
            // 数码管寄存器支持四个字节独立写入，0x8读回保存的原始数值。
            if (in_pstrb[0]) reg_seg[7:0] <= in_pwdata[7:0];
            if (in_pstrb[1]) reg_seg[15:8] <= in_pwdata[15:8];
            if (in_pstrb[2]) reg_seg[23:16] <= in_pwdata[23:16];
            if (in_pstrb[3]) reg_seg[31:24] <= in_pwdata[31:24];
        end
    end


    // 段位顺序为 ABCDEFG 和小数点；低电平点亮，小数点保持熄灭。
    function [7:0] seg_decode;
        input [3:0] digit;
        begin
            case (digit)
                4'h0: seg_decode = 8'h03;
                4'h1: seg_decode = 8'h9f;
                4'h2: seg_decode = 8'h25;
                4'h3: seg_decode = 8'h0d;
                4'h4: seg_decode = 8'h99;
                4'h5: seg_decode = 8'h49;
                4'h6: seg_decode = 8'h41;
                4'h7: seg_decode = 8'h1f;
                4'h8: seg_decode = 8'h01;
                4'h9: seg_decode = 8'h09;
                4'ha: seg_decode = 8'h11;
                4'hb: seg_decode = 8'hc1;
                4'hc: seg_decode = 8'h63;
                4'hd: seg_decode = 8'h85;
                4'he: seg_decode = 8'h61;
                4'hf: seg_decode = 8'h71;
                default: seg_decode = 8'hff;
            endcase
        end
    endfunction

    // 最低四位对应最右侧的第 0 个数码管。
    assign gpio_seg_0 = seg_decode(reg_seg[3:0]);
    assign gpio_seg_1 = seg_decode(reg_seg[7:4]);
    assign gpio_seg_2 = seg_decode(reg_seg[11:8]);
    assign gpio_seg_3 = seg_decode(reg_seg[15:12]);
    assign gpio_seg_4 = seg_decode(reg_seg[19:16]);
    assign gpio_seg_5 = seg_decode(reg_seg[23:20]);
    assign gpio_seg_6 = seg_decode(reg_seg[27:24]);
    assign gpio_seg_7 = seg_decode(reg_seg[31:28]);

endmodule
