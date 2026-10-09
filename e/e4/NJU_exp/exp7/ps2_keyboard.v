module ps2_keyboard(clk , clrn , ps2_clk , ps2_data , data,
                    ready , next_data_n , overflow);
    input clk , clrn , ps2_clk , ps2_data;
    input next_data_n;
    output [7:0] data;
    output ready;
    output overflow;

    wire [2:0]  ps2_clk_sync;
    wire        sampling;
    wire [3:0]  cnt;
    wire [9:0]  buffer;
    wire [7:0]  fifo [0:7];
    wire [2:0]  w_ptr , r_ptr;
    
    // ps2_clk 检测negedge
    Reg #(3, 3'b000) u_sync (.clk(clk), .rst(~clrn), 
        .din({ps2_clk_sync[1:0], ps2_clk}), 
        .dout(ps2_clk_sync), 
        .wen(1'b1));
    assign sampling = ps2_clk_sync[2] & ~ps2_clk_sync[1];

    // 移动接收11位
    // 位号  b0         b1 - b8             b9          b10
    // 内容 起始位0     8个数据位(lsb)      奇校验位    停止位1
    
    // 记录接收的位数
    Reg #(4, 4'd0) u_cnt (.clk(clk), .rst(~clrn), 
        .din((cnt == 4'd10) ? 4'd0 : cnt + 1'd1), 
        .dout(cnt), 
        .wen(sampling));

    // 接收缓冲
    genvar bi;
    generate
        for (bi = 0 ; bi < 10 ; bi ++) begin: gen_buffer
            Reg #(1 , 1'b0) u_buffer (.clk(clk), .rst(~clrn),
                .din(ps2_data),
                .dout(buffer[bi]),
                .wen(sampling & (cnt == bi)));
        end
    endgenerate

    // fifo (8 bytes)
    wire wr = (cnt == 4'd10) & sampling & 
                (buffer[0] == 1'b0) & ps2_data & (^buffer[9:1]);
    wire rd = ready & ~next_data_n;

    Reg #(3, 3'd0) u_wp (.clk(clk), .rst(~clrn), 
        .din(w_ptr + 3'd1), 
        .dout(w_ptr), 
        .wen(wr));
    Reg #(3, 3'd0) u_rp (.clk(clk), .rst(~clrn), 
        .din(r_ptr + 3'd1), 
        .dout(r_ptr), 
        .wen(rd));
    Reg #(1, 1'b0) u_ready (.clk(clk), .rst(~clrn), 
        .din(wr ? 1'b1 : ((rd & (w_ptr == r_ptr + 3'd1)) ? 1'b0 : ready)), 
        .dout(ready), 
        .wen(wr | rd));
    Reg #(1, 1'b0) u_ov (.clk(clk), .rst(~clrn),
        .din(overflow | (wr & (r_ptr == w_ptr + 3'd1))),
        .dout(overflow),
        .wen(wr));

    // 8个存储格: 写指针译码(fifo[w_ptr])
    // 写data
    genvar i;
    generate
        for (i = 0 ; i < 8 ; i = i + 1) begin : gen_fifo
            Reg #(8 , 8'd0) u_fifo (.clk(clk), .rst(~clrn),
                .din(buffer[8:1]),
                .dout(fifo[i]),
                .wen(wr & (w_ptr == i)));
        end
    endgenerate

    // 读出队首(fifo[r_ptr])
    MuxKey #(8 , 3 , 8) u_data (data , r_ptr , {
        3'd0,fifo[0], 3'd1,fifo[1], 3'd2,fifo[2], 3'd3,fifo[3], 
        3'd4,fifo[4], 3'd5,fifo[5], 3'd6,fifo[6], 3'd7,fifo[7]
        });
        endmodule
