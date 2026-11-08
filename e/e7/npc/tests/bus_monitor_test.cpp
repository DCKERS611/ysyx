#include "bus_monitor.h"
#include "check.h"

#include <cstring>

// 直接驱动协议监视器，验证它对合法时序不误报、对违例必须报告。
// 用例里的 cycle/addr 都是编造的，不对应真实程序；这里只检查判据本身。
int main()
{
    checker result;
    bus_monitor bus;

    // 1. 合法的三段取指：请求、回复交替，不产生任何违例。
    bus.reset();
    for (unsigned i = 0; i < 3; ++i) {
        bus.sample_ifu(false, true, 0x80000000u + 4u * i, 10u * i);
        bus.sample_ifu(true, false, 0x80000000u + 4u * i, 10u * i + 1);
        bus.on_ifu_response(10u * i + 2);
    }
    result.check("合法取指请求数", bus.ifu_requests(), 3);
    result.check("合法取指回复数", bus.ifu_responses(), 3);
    result.is_true("合法取指没有违例", bus.ok());

    // 2. 等待回复期间再次拉高 reqValid：必须报告，且不算一笔新请求。
    bus.reset();
    bus.sample_ifu(false, true, 0x80000004u, 1);
    bus.sample_ifu(true, true, 0x80000004u, 2);
    result.check("等待中重复请求被报告", bus.violations(), 1);
    result.check("重复请求不计入请求数", bus.ifu_requests(), 1);
    result.is_true("记录的违例类型",
                   std::strcmp(bus.last_kind(), "ifu_request_while_pending") == 0);

    // 3. 取指地址未对齐。
    bus.reset();
    bus.sample_ifu(false, true, 0x80000002u, 5);
    result.check("未对齐取指被报告", bus.violations(), 1);

    // 4. 数据总线：重复请求、保留 size、word/half 不对齐。
    bus.reset();
    bus.sample_lsu(false, true, 0x80000000u, 0x2u, 1);
    bus.sample_lsu(true, true, 0x80000000u, 0x2u, 2);
    result.check("数据等待中重复请求被报告", bus.violations(), 1);

    bus.reset();
    bus.sample_lsu(false, true, 0x80000000u, 0x3u, 1);
    result.check("保留 size 被报告", bus.violations(), 1);

    bus.reset();
    bus.sample_lsu(false, true, 0x80000002u, 0x2u, 1);
    result.check("未对齐 word 被报告", bus.violations(), 1);

    bus.reset();
    bus.sample_lsu(false, true, 0x80000003u, 0x1u, 1);
    result.check("未对齐 half 被报告", bus.violations(), 1);

    // 字节访问可以落在任意地址，不能误报。
    bus.reset();
    bus.sample_lsu(false, true, 0x80000003u, 0x0u, 1);
    result.is_true("字节访问不误报", bus.ok());

    // 5. 没有在途请求却收到回复。
    bus.reset();
    bus.on_lsu_response(7);
    result.check("孤立回复被报告", bus.violations(), 1);

    // 6. 正常停机时仍有请求没回复。
    bus.reset();
    bus.sample_ifu(false, true, 0x80000000u, 1);
    bus.finish(9);
    result.check("停机时有未完成取指被报告", bus.violations(), 1);

    bus.reset();
    bus.sample_lsu(false, true, 0x80000000u, 0x2u, 1);
    bus.finish(9);
    result.check("停机时有未完成访存被报告", bus.violations(), 1);

    // 7. 沿前统一样本：IFU 回复和普通指令提交可在同一沿完成。
    bus.reset();
    bus_cycle_sample sample;
    sample.ifu_req_valid = true;
    sample.ifu_addr = 0x80000000u;
    bus.sample_cycle(sample, 1);
    sample = {};
    sample.ifu_resp_valid = true;
    sample.ifu_rdata = 0x00100093u; // addi x1,x0,1
    sample.commit = true;
    sample.pc = 0x80000000u;
    sample.inst = sample.ifu_rdata;
    bus.sample_cycle(sample, 2);
    result.is_true("同沿取指回复与普通提交合法", bus.ok());

    // 8. LSU 请求归属到当前取指回复；数据回复与访存提交同沿必须合法。
    bus.reset();
    sample = {};
    sample.ifu_req_valid = true;
    sample.ifu_addr = 0x80000000u;
    bus.sample_cycle(sample, 1);
    sample = {};
    sample.ifu_resp_valid = true;
    sample.ifu_rdata = 0x0000A103u; // lw x2,0(x1)
    sample.lsu_req_valid = true;
    sample.lsu_addr = 0x80000100u;
    sample.lsu_size = 2;
    bus.sample_cycle(sample, 2);
    sample = {};
    sample.lsu_resp_valid = true;
    sample.lsu_rdata = 0x12345678u;
    sample.commit = true;
    sample.pc = 0x80000000u;
    sample.inst = 0x0000A103u;
    bus.sample_cycle(sample, 3);
    result.is_true("访存回复与提交同沿合法", bus.ok());

    // 9. 即使 LSU 从未发送请求，访存指令提交也必须失败。
    bus.reset();
    sample = {};
    sample.ifu_req_valid = true;
    sample.ifu_addr = 0x80000000u;
    bus.sample_cycle(sample, 1);
    sample = {};
    sample.ifu_resp_valid = true;
    sample.ifu_rdata = 0x0000A103u;
    sample.commit = true;
    sample.pc = 0x80000000u;
    sample.inst = sample.ifu_rdata;
    bus.sample_cycle(sample, 2);
    result.check("无LSU请求的访存提交被拒绝", bus.violations(), 1);
    result.is_true("无请求违例类型",
                   std::strcmp(bus.last_kind(), "commit_without_lsu_request") == 0);

    // 10. 已发请求但回复未到时提交，必须明确报告早提交。
    bus.reset();
    sample = {};
    sample.ifu_req_valid = true;
    sample.ifu_addr = 0x80000000u;
    bus.sample_cycle(sample, 1);
    sample = {};
    sample.ifu_resp_valid = true;
    sample.ifu_rdata = 0x0000A103u;
    sample.lsu_req_valid = true;
    sample.lsu_addr = 0x80000100u;
    sample.lsu_size = 2;
    bus.sample_cycle(sample, 2);
    sample = {};
    sample.commit = true;
    sample.pc = 0x80000000u;
    sample.inst = 0x0000A103u;
    bus.sample_cycle(sample, 3);
    result.check("LSU未回复时提交被拒绝", bus.violations(), 1);
    result.is_true("早提交违例类型",
                   std::strcmp(bus.last_kind(), "commit_with_pending_lsu") == 0);

    // 11. 回复后、提交前再次发同一条指令的 LSU 请求仍算重复发送。
    bus.reset();
    sample = {};
    sample.ifu_req_valid = true;
    sample.ifu_addr = 0x80000000u;
    bus.sample_cycle(sample, 1);
    sample = {};
    sample.ifu_resp_valid = true;
    sample.ifu_rdata = 0x0000A103u;
    sample.lsu_req_valid = true;
    sample.lsu_addr = 0x80000100u;
    sample.lsu_size = 2;
    bus.sample_cycle(sample, 2);
    sample = {};
    sample.lsu_resp_valid = true;
    bus.sample_cycle(sample, 3);
    sample = {};
    sample.lsu_req_valid = true;
    sample.lsu_addr = 0x80000100u;
    sample.lsu_size = 2;
    bus.sample_cycle(sample, 4);
    result.is_true("回复后重复发送被拒绝",
                   std::strcmp(bus.last_kind(), "lsu_duplicate_for_instruction") == 0);

    // 12. 提交指令必须与之前收到的取指 PC/指令配对。
    bus.reset();
    sample = {};
    sample.ifu_req_valid = true;
    sample.ifu_addr = 0x80000000u;
    bus.sample_cycle(sample, 1);
    sample = {};
    sample.ifu_resp_valid = true;
    sample.ifu_rdata = 0x00100093u;
    bus.sample_cycle(sample, 2);
    sample = {};
    sample.commit = true;
    sample.pc = 0x80000004u;
    sample.inst = 0x00100093u;
    bus.sample_cycle(sample, 3);
    result.is_true("提交PC与取指不匹配被拒绝",
                   std::strcmp(bus.last_kind(), "commit_fetch_mismatch") == 0);

    return result.report();
}
