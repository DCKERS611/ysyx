#include "cpu_view.h"
#include "bus_monitor.h"
#include <cstdio>
#include <cstdlib>
#include <optional>
#include <stdexcept>
#include <string>
#include <array>

extern "C" void ebreak(int) { throw std::runtime_error("unexpected ebreak"); }
static uint32_t csr(unsigned address, unsigned funct3, unsigned rd, unsigned source) {
    return (address << 20) | (source << 15) | (funct3 << 12) | (rd << 7) | 0x73;
}
class Test {
    npc::cpu dut;
    bus_monitor bus;
    bool bus_started = false;
    uint64_t cycles = 0, retired = 0;
    unsigned cases = 0;
    uint64_t cycle_value() { return dut.rootp->ysyx_00000000__DOT__u_csr__DOT__csr_mcycle; }
    uint64_t retired_value() { return dut.rootp->ysyx_00000000__DOT__u_csr__DOT__csr_minstret; }
    void require(bool ok, const char* message) {
        if (!ok) throw std::runtime_error(std::string(message) + " case=" + std::to_string(cases));
    }
    void sample_bus() {
        bus_cycle_sample sample;
        sample.reset = dut.reset;
        sample.ifu_req_valid = dut.io_ifu_reqValid;
        sample.ifu_addr = dut.io_ifu_addr;
        sample.ifu_resp_valid = dut.io_ifu_respValid;
        sample.ifu_rdata = dut.io_ifu_rdata;
        sample.lsu_req_valid = dut.io_lsu_reqValid;
        sample.lsu_addr = dut.io_lsu_addr;
        sample.lsu_size = dut.io_lsu_size;
        sample.lsu_wen = dut.io_lsu_wen;
        sample.lsu_wdata = dut.io_lsu_wdata;
        sample.lsu_wmask = dut.io_lsu_wmask;
        sample.lsu_resp_valid = dut.io_lsu_respValid;
        sample.lsu_rdata = dut.io_lsu_rdata;
        sample.commit = npc::commit(dut);
        sample.pc = npc::pc(dut);
        sample.inst = npc::inst(dut);
        bus.sample_cycle(sample, cycles);
    }
    void tick(bool retire = false, std::optional<uint64_t> cycle_write = {},
              std::optional<uint64_t> retired_write = {}) {
        dut.clock = 0; dut.eval();
        sample_bus();
        dut.clock = 1; dut.eval();
        cycles = cycle_write.value_or(cycles + 1);
        retired = retired_write.value_or(retired + (retire ? 1 : 0));
        require(cycle_value() == cycles, "mcycle update");
        require(retired_value() == retired, "minstret update");
    }
public:
    void reset() {
        if (bus_started) require(bus.ok(), "bus monitor before CPU reset");
        bus.reset();
        bus_started = true;
        dut.clock = 0; dut.reset = 1;
        dut.io_ifu_respValid = 0; dut.io_ifu_rdata = 0;
        dut.io_lsu_respValid = 0; dut.io_lsu_rdata = 0;
        dut.eval(); dut.clock = 1; dut.eval();
        cycles = retired = 0;
        for (unsigned i = 0; i < 16; ++i) npc::gpr(dut, i) = 0;
        dut.reset = 0; dut.clock = 0; dut.eval();
        require(cycle_value() == 0 && retired_value() == 0, "reset counters");
        require(npc::pc(dut) == 0x80000000 && dut.io_ifu_reqValid, "reset PC/request");
    }
    void source(unsigned reg, uint32_t value) { npc::gpr(dut, reg) = value; }
    uint64_t next_read_cycle() const { return cycles + 4; }
    uint64_t instructions() const { return retired; }
    // 请求发出后等待三拍，再提供取指回复；等待期间不能提前写CSR或退休。
    void run(uint32_t instruction, uint32_t old_value, bool reject = false,
             std::optional<uint64_t> cycle_write = {},
             std::optional<uint64_t> retired_write = {}) {
        ++cases;
        dut.clock = 0; dut.io_ifu_respValid = 0; dut.eval();
        require(dut.io_ifu_reqValid, "fetch request");
        const uint32_t pc = npc::pc(dut);
        std::array<uint32_t,16> before{};
        for (unsigned i=0; i<16; ++i) before[i] = npc::gpr(dut,i);
        tick();
        dut.io_ifu_rdata = instruction;
        for (unsigned i=0; i<3; ++i) {
            dut.clock=0; dut.eval();
            require(!npc::commit(dut) && !npc::illegal(dut), "speculative commit/reject");
            tick();
        }
        dut.clock=0; dut.io_ifu_respValid=1; dut.eval();
        require(npc::illegal(dut) == reject, "illegal access decision");
        // 不读CSR与不写GPR是两项独立语义，覆盖CSRRW和CSRRWI。
        if (((instruction >> 12) & 3) == 1 && ((instruction >> 7) & 31) == 0)
            require(dut.rootp->ysyx_00000000__DOT__csr_rdata == 0, "CSRRW[I] x0 suppresses CSR read");
        require(npc::commit(dut) == !reject, "commit decision");
        tick(!reject, cycle_write, retired_write);
        dut.clock=0; dut.io_ifu_respValid=0; dut.eval();
        require(npc::pc(dut) == pc + (reject ? 0 : 4), "PC side effect");
        unsigned rd=(instruction>>7)&31;
        for (unsigned i=0; i<16; ++i)
            require(npc::gpr(dut,i) == ((!reject && rd==i && i!=0) ? old_value : before[i]),
                    "GPR old-value/write suppression");
        if (reject) {
            for (unsigned i=0; i<4; ++i) {
                require(npc::illegal(dut) && !npc::commit(dut) &&
                        !dut.io_ifu_reqValid && !dut.io_lsu_reqValid, "persistent rejection");
                tick();
                require(npc::pc(dut)==pc, "fault PC held");
            }
        }
    }
    // 独立逐沿计分：等待取指、等待访存均增加mcycle，只有完成沿增加minstret。
    void memory(uint32_t instruction, bool store, bool byte = false) {
        ++cases;
        const uint32_t initial_pc = npc::pc(dut);
        const uint32_t old_x2 = npc::gpr(dut,2);
        dut.clock=0; dut.io_ifu_respValid=0; dut.io_lsu_respValid=0; dut.eval();
        require(dut.io_ifu_reqValid, "memory fetch request");
        tick();
        dut.io_ifu_rdata=instruction;
        for (unsigned i=0;i<7;++i) {
            dut.clock=0;dut.eval();
            require(!npc::commit(dut) && !dut.io_lsu_reqValid, "fetch wait must not retire/start LSU");
            tick();
        }
        dut.clock=0;dut.io_ifu_respValid=1;dut.eval();
        require(!npc::commit(dut), "memory instruction must wait for data");
        // LSU在取指回复当拍直通发送，必须在这个采样沿之前检查请求。
        require(dut.io_lsu_reqValid && dut.io_lsu_addr==0x80000100u, "LSU request address");
        require(bool(dut.io_lsu_wen)==store && dut.io_lsu_size==(byte ? 0u : 2u), "LSU operation");
        tick();
        dut.clock=0;dut.io_ifu_respValid=0;dut.eval();
        for(unsigned i=0;i<37;++i) {
            dut.clock=0;dut.eval();
            require(!dut.io_lsu_reqValid && !npc::commit(dut), "LSU wait must not repeat/retire");
            require(npc::pc(dut)==initial_pc && npc::gpr(dut,2)==old_x2, "no early architectural write");
            tick();
        }
        dut.clock=0;dut.io_lsu_rdata=0x1234ABCDu;dut.io_lsu_respValid=1;dut.eval();
        require(npc::commit(dut), "memory response retirement");
        tick(true);
        dut.clock=0;dut.io_lsu_respValid=0;dut.eval();
        require(npc::pc(dut)==initial_pc+4, "memory PC advances once");
        require(npc::gpr(dut,2)==(store ? old_x2 : 0x1234ABCDu), "load data/write isolation");
    }
    void tests() {
        reset();
        run(csr(0xF11,2,2,0),0x79737978);
        run(csr(0xF12,3,3,0),100023589);
        run(csr(0xF11,6,4,0),0x79737978);
        run(csr(0xF12,7,5,0),100023589);

        // 显式写minstret时，本条指令不再引起自动加一。
        source(1,0x12345678);
        run(csr(0xB02,1,2,1),4,false,{},0x12345678);
        source(1,0xF);
        run(csr(0xB02,2,2,1),0x12345678,false,{},0x1234567F);
        run(csr(0xB02,3,2,1),0x1234567F,false,{},0x12345670);
        run(csr(0xB02,5,2,31),0x12345670,false,{},31);
        run(csr(0xB02,6,2,16),31,false,{},31);
        run(csr(0xB02,7,2,16),31,false,{},15);
        run(csr(0xB02,2,2,0),15); // x0禁止写CSR，退休仍加一
        run(csr(0xB02,3,2,0),16);
        run(csr(0xB02,6,2,0),17);
        run(csr(0xB02,7,2,0),18);
        source(1,0); // 非x0源寄存器即使值为0，仍属于写访问
        run(csr(0xB02,2,2,1),19,false,{},19);
        run(csr(0xB02,3,2,1),19,false,{},19);
        run(csr(0xB02,5,0,0),0,false,{},0); // rd=x0仍写CSR
        run(csr(0xB82,5,2,3),0,false,{},uint64_t(3)<<32);
        run(csr(0xB02,1,2,0),0,false,{},uint64_t(3)<<32);
        source(1,0xFFFFFFFF);
        run(csr(0xB02,1,2,1),0,false,{},(uint64_t(3)<<32)|0xFFFFFFFF);
        run(csr(0xB82,2,2,0),3); // 自动递增产生高位进位
        run(csr(0xB82,2,2,0),4);

        // 显式写mcycle优先于同一时钟沿的自动递增。
        run(csr(0xB00,5,2,7),uint32_t(next_read_cycle()),false,7);
        run(csr(0xB80,5,2,2),0,false,(uint64_t(2)<<32)|11);
        run(csr(0xB00,1,2,0),15,false,uint64_t(2)<<32);
        run(csr(0xB00,1,0,1),0,false,(uint64_t(2)<<32)|0xFFFFFFFF);
        run(csr(0xB80,2,2,0),3); // 等待取指期间低位溢出进位

        // 只读ID的六种写访问均拒绝，包括写入数据为0的情况。
        for (unsigned address : {0xF11u,0xF12u}) {
            for (unsigned op : {1u,2u,3u,5u,6u,7u}) {
                reset(); source(1,0);
                run(csr(address,op,2,(op==1 || op==5) ? 0 : 1),0,true);
            }
        }
        // 未实现地址的读写都拒绝，包括rd=x0的情况。
        for (unsigned address : {0x000u,0x300u,0xB01u,0xC00u,0xFFFu}) {
            for (unsigned op : {1u,2u,3u,5u,6u,7u}) {
                reset(); run(csr(address,op,0,0),0,true);
            }
        }
        reset(); run(csr(0xB02,1,16,0),0,true); // RV32E非法目的寄存器
        reset(); run(csr(0xB02,2,2,16),0,true); // 非法通用源寄存器
        reset(); run(csr(0xB02,5,2,31),0,false,{},31); // 立即数仍允许完整5位
        reset(); run(0x00000073,0,true); // 未实现的SYSTEM指令编码
        reset(); run(0x00004073,0,true);
        reset(); run(csr(0xF11,2,2,0),0x79737978); // 复位解除拒绝状态
        reset(); source(1,0x80000100u);source(3,0x89ABCDEFu);
        memory(0x0000A103u,false); // lw x2,0(x1)
        memory(0x0030A023u,true);  // sw x3,0(x1)
        memory(0x00308023u,true,true); // sb x3,0(x1)
        for(unsigned i=0;i<7;++i) tick();
        bus.report();
        require(bus.ok(), "bus monitor");
        std::printf("CSR integration: %u cases PASS\n",cases);
    }
};
int main(int argc, char** argv) {
    Verilated::commandArgs(argc,argv);
    try { Test t; t.tests(); }
    catch(const std::exception& e) { std::fprintf(stderr,"CSR FAIL: %s\n",e.what()); return 1; }
}
