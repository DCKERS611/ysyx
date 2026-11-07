#include <am.h>
#include <klib.h>
#include <klib-macros.h>

int main(void) {
    volatile uint32_t *led = (volatile uint32_t *)0x20001000;
    volatile uint32_t *input = (volatile uint32_t *)0x20001004;
    volatile uint32_t *segment = (volatile uint32_t *)0x20001008;
    volatile uint8_t *led_byte = (volatile uint8_t *)led;
    volatile uint8_t *segment_byte = (volatile uint8_t *)segment;
    // 用实际CPU的sb/lbu穿过总线桥，确认PSTRB和读回在SoC中也接通。
    *led = 0xa55a;
    led_byte[0] = 0x3c; assert(*led == 0xa53c);
    led_byte[1] = 0xc7; assert(*led == 0xc73c);
    led_byte[2] = 0x55; led_byte[3] = 0xaa;
    assert(*led == 0xc73c);
    assert(led_byte[0] == 0x3c && led_byte[1] == 0xc7);
    assert(led_byte[2] == 0 && led_byte[3] == 0);
    *segment = 0x12345678; assert(*segment == 0x12345678);
    segment_byte[0] = 0xab; assert(*segment == 0x123456ab);
    segment_byte[1] = 0xcd; assert(*segment == 0x1234cdab);
    segment_byte[2] = 0xef; assert(*segment == 0x12efcdab);
    segment_byte[3] = 0x09; assert(*segment == 0x09efcdab);
    assert(segment_byte[0] == 0xab && segment_byte[1] == 0xcd);
    assert(segment_byte[2] == 0xef && segment_byte[3] == 0x09);
    // 该程序在无NVBoard输入变化的自动验收环境运行。
    uint32_t switches = *input;
    *input = 0xffffffff;
    assert(*input == switches);
    *led = 0; *segment = 0;
    assert(*led == 0 && *segment == 0);
    printf("GPIO_BYTE_ACCESS PASS\n");
    return 0;
}
