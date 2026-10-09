#include <cstdio>
#include "Vtop.h"
#include "verilated.h"

static void tick(Vtop& dut)
{
    dut.clk = 0; dut.eval();
    dut.clk = 1; dut.eval();
}

static void reset(Vtop& dut)              // clrn 低有效，拉低 4 拍再放开
{
    dut.ps2_clk = 1;
    dut.ps2_data = 1;
    dut.clrn = 0;

    for (int i = 0; i < 4; i++) tick(dut);
    
    dut.clrn = 1;
    for (int i = 0 ; i < 4 ; i ++) tick(dut);
}

// 发一位：数据先摆好，再制造一次 ps2_clk 下降沿
static void send_bit(Vtop& dut, int bit)
{
    dut.ps2_data = bit;

    for (int i = 0; i < 2; i++) tick(dut);

    dut.ps2_clk = 0;
    for (int i = 0; i < 4; i++) tick(dut);

    dut.ps2_clk = 1;
    for (int i = 0; i < 4; i++) tick(dut);
}

// 发一帧 11 位：起始0 + 8 数据位(低位先) + 奇校验 + 停止1
static void send_byte(Vtop& dut, unsigned code)
{
    int parity = 1;

    for (int i = 0; i < 8; i++)
        parity ^= (code >> i) & 1;

    send_bit(dut, 0);

    for (int i = 0; i < 8; i++)
        send_bit(dut, (code >> i) & 1);

    send_bit(dut, parity);
    send_bit(dut, 1);

    // 给按键处理模块留出处理入队字节的时间。
    for (int i = 0; i < 2; i++) tick(dut);
}


static void check(
    Vtop& dut,
    const char* name,
    int expected_pressed,
    unsigned expected_keycode,
    unsigned expected_count,
    int& total,
    int& fails
)
{
    total++;

    if (dut.pressed != expected_pressed ||
        dut.keycode != expected_keycode ||
        dut.press_cnt != expected_count ||
        dut.overflow != 0)
    {
        fails++;

        std::printf(
            "FAIL %s: pressed=%u keycode=%02X count=%u overflow=%u"
            " (expect pressed=%d keycode=%02X count=%u overflow=0)\n",
            name,
            static_cast<unsigned>(dut.pressed),
            static_cast<unsigned>(dut.keycode),
            static_cast<unsigned>(dut.press_cnt),
            static_cast<unsigned>(dut.overflow),
            expected_pressed,
            expected_keycode,
            expected_count
        );
    }
}

static void check_display(
        Vtop& dut,
        const char* name,
        unsigned expected_ascii,
        unsigned expected_valid,
        const std::array<unsigned, 6>& expected_seg,
        int& total,
        int& fails
)
{
    // 顺序: seg0 seg1 seg2 seg3 seg4 seg5
    const std::array<unsigned , 6> got_seg = {
        dut.seg0, dut.seg1, dut.seg2,
        dut.seg3, dut.seg4, dut.seg5
    };

    total ++;

    bool bad = (dut.ascii != expected_ascii) ||
                (dut.ascii_valid != expected_valid) ||
                (got_seg != expected_seg);

    if (bad) {
        fails ++;

        printf(
                "FAIL %s: ascii=%02x valid=%u"
                "(expect ascii=%02x valid=%u)\n",
                name,
                static_cast<unsigned>(dut.ascii),
                static_cast<unsigned>(dut.ascii_valid),
                expected_ascii,
                expected_valid);

        for (int i = 0 ; i < 6 ; i ++)
        {
            if (got_seg[i] != expected_seg[i])
            {
                printf(
                        "seg%d=%02x (expect %02x)\n",
                        i , got_seg[i] , expected_seg[i]);
            }
        }
    }
}

static void check_combo(
        Vtop& dut,
        const char* name,
        unsigned shift,
        unsigned ctrl,
        unsigned ascii,
        int& total,
        int& fails)
{
    total++;
    if (dut.shift_down != shift ||
            dut.ctrl_down != ctrl ||
                dut.ascii != ascii||
                    dut.seg6 != 0xFF ||
                        dut.seg7 != 0xFF) {
        fails++;
        std::printf("FAIL %s: shift=%u ctrl=%u ascii=%02X"
                    " (expect %u %u %02X) seg6=%02X seg7=%02X\n",
            name, unsigned(dut.shift_down), unsigned(dut.ctrl_down),
            unsigned(dut.ascii), shift, ctrl, ascii,
            unsigned(dut.seg6), unsigned(dut.seg7));
    }
}

int main(int argc , char** argv)
{
    VerilatedContext ctx;
    ctx.commandArgs(argc,argv);
    Vtop dut{&ctx};

    int fails = 0 , total = 0;
    
	// 1. 复位
    reset(dut);
    check(dut, "reset", 0, 0x00, 0, total, fails);
    check_display(dut, "display reset", 0x00, 0,
            {0xff, 0xff, 0xff, 0xff, 0x03, 0x03},
            total, fails);

    // 2. 第一次按下 A
    send_byte(dut, 0x1C);
    check(dut, "press A", 1, 0x1C, 1, total, fails);
    check_display(dut, "display A", 0x61, 1,
            {0x63, 0x9F, 0x9F, 0x41, 0x9F, 0x03},
            total, fails);

    // 3. 长按重复：不能增加次数
    for (int i = 0; i < 3; i++) {
        send_byte(dut, 0x1C);
        check(dut, "repeat A", 1, 0x1C, 1, total, fails);
    }

    // 4. 空闲期间，按键状态应保持
    for (int i = 0; i < 20; i++) tick(dut);
    check(dut, "hold A during idle", 1, 0x1C, 1, total, fails);

    // 5. 收到 F0 还不能认为 A 已经松开
    send_byte(dut, 0xF0);
    check(dut, "A break prefix", 1, 0x1C, 1, total, fails);
    check_display(dut, "display A break prefix", 0x61, 1,
            {0x63, 0x9f, 0x9f, 0x41, 0x9f, 0x03},
            total, fails);

    // 6. 收到后续 1C，确认 A 松开
    send_byte(dut, 0x1C);
    check(dut, "release A", 0, 0x1C, 1, total, fails);
    check_display(dut, "display A released", 0x61, 1,
            {0xFF, 0xFF, 0xFF, 0xFF, 0x9F, 0x03},
            total, fails);

    // 7. 再次按下 A，次数增加
    send_byte(dut, 0x1C);
    check(dut, "press A again", 1, 0x1C, 2, total, fails);

    send_byte(dut, 0xF0);
    send_byte(dut, 0x1C);
    check(dut, "release A again", 0, 0x1C, 2, total, fails);

    // 8. 换成 S，验证保存的键码发生变化
    send_byte(dut, 0x1B);
    check(dut, "press S", 1, 0x1B, 3, total, fails);

    send_byte(dut, 0x1B);
    check(dut, "repeat S", 1, 0x1B, 3, total, fails);

    send_byte(dut, 0xF0);
    send_byte(dut, 0x1B);
    check(dut, "release S", 0, 0x1B, 3, total, fails);

    // 9. 不复位，持续收发，让 FIFO 指针多次回绕
    for (int round = 0; round < 12; round++) {
        unsigned code = (round % 2 == 0) ? 0x1C : 0x1B;
        unsigned count = 4 + round;

        send_byte(dut, code);
        check(dut, "loop press", 1, code, count, total, fails);

        send_byte(dut, code);
        check(dut, "loop repeat", 1, code, count, total, fails);

        send_byte(dut, 0xF0);
        check(dut, "loop break prefix", 1, code, count, total, fails);

        send_byte(dut, code);
        check(dut, "loop release", 0, code, count, total, fails);
    }

    // 10. 按住键时复位，应清除所有状态和计数
    send_byte(dut, 0x1C);
    check(dut, "press before reset", 1, 0x1C, 16, total, fails);

    reset(dut);
    check(dut, "reset while pressed", 0, 0x00, 0, total, fails);

    // 11. 复位后仍能正常重新按下
    send_byte(dut, 0x16);  // 数字键 1
    check(dut, "press 1 after reset", 1, 0x16, 1, total, fails);
    check_display(dut, "display digit 1", 0x31, 1,
            {0x41, 0x9F, 0x9F, 0x0D, 0x9F, 0x03},
            total, fails);
	
    // Optional: modifiers do not occupy the character slot or increment its count.
    reset(dut);
    send_byte(dut, 0x12); // left Shift
    check(dut, "Shift alone", 0, 0, 0, total, fails);
    check_combo(dut, "left Shift on", 1, 0, 0, total, fails);
    send_byte(dut, 0x1C);
    check(dut, "Shift+A", 1, 0x1C, 1, total, fails);
    check_combo(dut, "uppercase A", 1, 0, 0x41, total, fails);
    check_display(dut, "uppercase A segments", 0x41, 1,
        {0x63, 0x9F, 0x9F, 0x99, 0x9F, 0x03}, total, fails);
    send_byte(dut, 0x59); // both Shift keys held
    send_byte(dut, 0xF0); send_byte(dut, 0x12);
    check_combo(dut, "right Shift remains", 1, 0, 0x41, total, fails);
    send_byte(dut, 0x14); // Ctrl while A is still held
    check_combo(dut, "Ctrl+Shift+A", 1, 1, 0x41, total, fails);
    send_byte(dut, 0x1C);
    check(dut, "combo repeat A", 1, 0x1C, 1, total, fails);
    send_byte(dut, 0xF0); send_byte(dut, 0x59);
    check_combo(dut, "release Shift before A", 0, 1, 0x61, total, fails);
    check(dut, "modifier release keeps A", 1, 0x1C, 1, total, fails);
    send_byte(dut, 0xF0); send_byte(dut, 0x1C);
    check(dut, "release A keeps Ctrl", 0, 0x1C, 1, total, fails);
    check_combo(dut, "Ctrl remains", 0, 1, 0x61, total, fails);
    send_byte(dut, 0xE0); send_byte(dut, 0x14); // right Ctrl
    send_byte(dut, 0xF0); send_byte(dut, 0x14); // release left Ctrl
    check_combo(dut, "right Ctrl remains", 0, 1, 0x61, total, fails);
    send_byte(dut, 0xE0); send_byte(dut, 0xF0); send_byte(dut, 0x14);
    check_combo(dut, "both Ctrl released", 0, 0, 0x61, total, fails);

    // Unsupported ordinary and extended codes must not become character presses.
    send_byte(dut, 0x58); // Caps Lock is outside this experiment's scope
    send_byte(dut, 0xF0); send_byte(dut, 0x58);
    send_byte(dut, 0xE0); send_byte(dut, 0x75); // arrow up
    send_byte(dut, 0xE0); send_byte(dut, 0xF0); send_byte(dut, 0x75);
    check(dut, "unsupported keys ignored", 0, 0x1C, 1, total, fails);

    // Check every supported character, in both Shift states.
    const unsigned codes[36] = {
        0x1C,0x32,0x21,0x23,0x24,0x2B,0x34,0x33,0x43,0x3B,
        0x42,0x4B,0x3A,0x31,0x44,0x4D,0x15,0x2D,0x1B,0x2C,
        0x3C,0x2A,0x1D,0x22,0x35,0x1A,
        0x45,0x16,0x1E,0x26,0x25,0x2E,0x36,0x3D,0x3E,0x46
    };
    const char* plain = "abcdefghijklmnopqrstuvwxyz0123456789";
    const char* upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ)!@#$%^&*(";
    reset(dut);
    send_byte(dut, 0x12);
    for (int i = 0; i < 36; i++) {
        send_byte(dut, codes[i]);
        check(dut, "all characters press", 1, codes[i], i + 1, total, fails);
        check_combo(dut, "all shifted characters", 1, 0, upper[i], total, fails);
        send_byte(dut, codes[i]);
        check(dut, "all characters repeat", 1, codes[i], i + 1, total, fails);
        send_byte(dut, 0xF0); send_byte(dut, codes[i]);
        check(dut, "all characters release", 0, codes[i], i + 1, total, fails);
    }
    send_byte(dut, 0xF0); send_byte(dut, 0x12);
    for (int i = 0; i < 36; i++) {
        send_byte(dut, codes[i]);
        check(dut, "plain character press", 1, codes[i], 37 + i, total, fails);
        check_combo(dut, "all plain characters", 0, 0, plain[i], total, fails);
        send_byte(dut, 0xF0); send_byte(dut, codes[i]);
        check(dut, "plain character release", 0, codes[i], 37 + i, total, fails);
    }
    send_byte(dut, 0x12); send_byte(dut, 0xE0); send_byte(dut, 0x14);
    reset(dut);
    check(dut, "combo reset", 0, 0, 0, total, fails);
    check_combo(dut, "reset clears modifiers", 0, 0, 0, total, fails);

	if (fails) {printf("FAILED: %d/%d checks\n", fails,total); return 1;}
	
  	printf("PASS: %d check\n",total);
	return 0;
}
