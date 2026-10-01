// ============================================================================
// 12 小时时钟计数器 测试平台
// 验证内容：
//   1. 复位到 12:00:00 AM（pm=0）
//   2. 秒、分进位
//   3. 11:59:59 AM -> 12:00:00 PM 翻转（pm 0->1）
//   4. 12:59:59 PM -> 1:00:00 PM（pm 保持 1）
//   5. 11:59:59 PM -> 12:00:00 AM 翻转（pm 1->0）
//   6. reset 优先级高于 ena
// ============================================================================
`timescale 1ns/1ps

module count_clock_tb;

    reg  clk;
    reg  reset;
    reg  ena;
    wire pm;
    wire [7:0] hh, mm, ss;

    integer errors = 0;

    // 被测模块
    top_module uut (
        .clk  (clk),
        .reset(reset),
        .ena  (ena),
        .pm   (pm),
        .hh   (hh),
        .mm   (mm),
        .ss   (ss)
    );

    // 时钟：周期 10ns
    always #5 clk = ~clk;

    // 波形输出
    initial begin
        $dumpfile("count_clock_tb.vcd");
        $dumpvars(0, count_clock_tb);
    end

    // 2 位 BCD 转数值，方便显示
    function [6:0] bcd2num;
        input [7:0] bcd;
        begin
            bcd2num = bcd[7:4] * 4'd10 + bcd[3:0];
        end
    endfunction

    // 前进 1 秒：ena 拉高一个时钟周期
    task tick;
        begin
            ena = 1'b1;
            @(posedge clk);
            #1;               // 越过非阻塞赋值更新的时间点
            ena = 1'b0;
        end
    endtask

    // 检查当前状态
    task check;
        input [7:0] eh;
        input [7:0] em;
        input [7:0] es;
        input       ep;
        input [31:0] tics;
        begin
            if (hh !== eh || mm !== em || ss !== es || pm !== ep) begin
                $display("FAIL @t=%0d: got %0d:%0d:%0d pm=%0d, expected %0d:%0d:%0d pm=%0d",
                         tics, bcd2num(hh), bcd2num(mm), bcd2num(ss), pm,
                               bcd2num(eh), bcd2num(em), bcd2num(es), ep);
                errors = errors + 1;
            end else begin
                $display("PASS @t=%0d: %0d:%0d:%0d pm=%0d",
                         tics, bcd2num(hh), bcd2num(mm), bcd2num(ss), pm);
            end
        end
    endtask

    integer i;

    initial begin
        clk   = 0;
        reset = 1;
        ena   = 0;

        // 1) 复位：连续保持 3 个时钟沿
        repeat (3) begin
            @(posedge clk);
            #1;
        end
        reset = 0;
        check(8'h12, 8'h00, 8'h00, 0, 0);   // 12:00:00 AM

        // 2) 秒计数 + 分进位
        for (i = 1; i <= 59; i = i + 1) tick();
        check(8'h12, 8'h00, 8'h59, 0, 59);  // 12:00:59 AM
        tick();
        check(8'h12, 8'h01, 8'h00, 0, 60);  // 12:01:00 AM

        // 3) 快进到 11:59:59 AM（复位起共 43199 秒）
        for (i = 60; i < 43199; i = i + 1) tick();
        check(8'h11, 8'h59, 8'h59, 0, 43199);  // 11:59:59 AM

        // 4) 关键翻转：11:59:59 AM -> 12:00:00 PM，pm 0->1
        tick();
        check(8'h12, 8'h00, 8'h00, 1, 43200);  // 12:00:00 PM

        // 5) 12:59:59 PM -> 1:00:00 PM，pm 保持 1
        for (i = 43200; i < 46800; i = i + 1) tick();
        check(8'h01, 8'h00, 8'h00, 1, 46800);  // 1:00:00 PM

        // 6) 快进到 11:59:59 PM（复位起共 86399 秒）
        for (i = 46800; i < 86399; i = i + 1) tick();
        check(8'h11, 8'h59, 8'h59, 1, 86399);  // 11:59:59 PM

        // 7) 翻转：11:59:59 PM -> 12:00:00 AM，pm 1->0
        tick();
        check(8'h12, 8'h00, 8'h00, 0, 86400);  // 12:00:00 AM

        // 8) reset 优先级高于 ena：同时拉高，应当复位而不是计数
        ena   = 1'b1;
        reset = 1'b1;
        @(posedge clk);
        #1;
        check(8'h12, 8'h00, 8'h00, 0, 86401);  // 复位生效
        reset = 1'b0;
        @(posedge clk);
        #1;
        check(8'h12, 8'h00, 8'h01, 0, 86402);  // 之后 ena=1 才计数
        ena = 1'b0;

        // 汇总
        if (errors == 0) begin
            $display("=========================================");
            $display("ALL TESTS PASSED");
            $display("=========================================");
        end else
            $display("FAILED: %0d error(s)", errors);

        $finish;
    end

    // 超时保护（模拟 2 小时仿真时间仍未结束则报错退出）
    initial begin
        # 7200000;
        $display("TIMEOUT");
        $finish;
    end

endmodule
