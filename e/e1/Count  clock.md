# Count  clock

bcd_counter(时分共用一个bcd module,分别实例化四个计时器)

top_module
├── sec_ones
├── sec_tens
├── min_ones
├── min_tens
└── hour_counter

```verilog
module top_module(
input clk,
input reset,
input ena,
output pm,
output [7:0] hh,
output [7:0] mm,
output [7:0] ss
);

wire en_sec_tens , en_min_ones , en_min_tens , en_hour;

// sec_ones
bcd_counter #(.MAX_VALUE = 4'd9) sec_ones (
.clk(clk), .reset(reset), .en(ena), .q(ss[3:0])
);

// sec_tens
bcd_counter #(.MAX_VALUE (4'd5)) sec_tens (
.clk(clk), .reset(reset), .en(ena_sec_tens), .q(ss[7:4])
);

// min_ones
bcd_counter #(.MAX_VALUE(4'd9)) min_ones (
.clk(clk), .reset(reset), .en(en_min_ones), .q(mm[3:0])
);

// min_tens
bcd_counter #(.MAX_VALUE(4'd5)) min_tens (
.clk(clk), .reset(reset), .en(en_min_tens), .q(mm[7:4])
);

// hour
hour_counter u(
.clk(clk), .reset(reset), .en(en_hour), .hh(q), .pm(pm)
);

endmodule

// sec&min_bcd_counter
module bcd_counter #(parameter [3:0] MAX_VALUE = 4'd9)(
input clk,
input reset,
input en,
output reg [3:0]q
);

always @(posedge clk) begin
	if(reset)
		q <= 4'd0;
	else if (en) begin
		if ( q == MAX_VALUE)    
			q <= 4'd0;
		else 
			q <= q + 4'd1;
	end
end
    
endmodule

// hour_bcd_counter
module hour_counter (
input clk,
input reset,
input en,
output reg pm,
output reg [7:0]q
);

always @(posedge clk) begin 
	if(reset) begin
		q <= 8'h12;
		pm <= 1'd0;
	end
	else if(en) begin
		if(q == 8'h11) begin
			q <= 8'h12;
			pm <= ~pm;
		end
		else if(q == 8'h12) q <= 8'h01;
		else if(q == 8'h09) q <= 8'h10;
		else q <= q + 8'h01;
	end
end
endmodule
```



00～59 计数模块
├── counter_00_59 seconds
│   ├── ones
│   └── tens
├── counter_00_59 minutes
│   ├── ones
│   └── tens
└── hour_counter

```verilog
// 00～59 计数模块
module counter_00_59 (
	input clk,
    input reset,
    input en,
    output [7:0]q,
    output carry
);
    wire en_tens;
    assign en_tens = en && (q[3:0] == 4'd9);
    assign carry   = en && (q 	   == 8'h59);
    
    bcd_counter #(.MAX_VALUE(4'd9)) ones(
        .clk(clk), .reset(reset), .en(en), .q(q[3:0])
    );
    bcd_counter #(.MAX_VALUE(4'd5)) tens(
        .clk(clk), .reset(reset), .en(en_tens), .q(q[7:4])
    );
endmodule

// hour_bcd_counter
module hour_counter (
input clk,
input reset,
input en,
output reg pm,
output reg [7:0]q
);

always @(posedge clk) begin 
	if(reset) begin
		q <= 8'h12;
		pm <= 1'd0;
	end
	else if(en) begin
		if(q == 8'h11) begin
			q <= 8'h12;
			pm <= ~pm;
		end
		else if(q == 8'h12) q <= 8'h01;
		else if(q == 8'h09) q <= 8'h10;
		else q <= q + 8'h01;
	end
end
endmodule

// 顶层连接
module top_module ();
    wire sec_carry,min_carry;
    
    // sec
    counter_00_59 sec(
        .clk(clk), .reset(reset), .en(ena), .q(ss), .carry(sec_carry)
    );
    
    // min
    counter_00_59 min(
        .clk(clk), .reset(reset), .en(sec_carry), .q(mm), .carry(min_carry)
    );
    
    // hour
    hour_counter hour(
        .clk(clk), .reset(reset), .en(min_carry), .q(hh), .pm(pm)
    );
endmodule
```

