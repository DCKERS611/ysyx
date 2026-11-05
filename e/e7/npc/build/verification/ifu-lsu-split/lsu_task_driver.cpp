
#include "Vlsu.h"
#include "verilated.h"
#include <cstdint>
#include <cstdio>
#include <cstdlib>
static void require(bool ok,const char* message) {
    if (!ok) { std::fprintf(stderr,"FAIL: %s\n",message); std::exit(1); }
}
struct Case {
    bool write, byte;
    uint32_t addr, data, response, expected_data;
    uint32_t expected_wdata;
    unsigned expected_mask;
};
int main(int argc,char** argv) {
    VerilatedContext ctx;ctx.commandArgs(argc,argv);
    Vlsu dut{&ctx};
    const bool random_mode=argc>1;
    const Case cases[]={
        {true,true,0x80000102u,0xABu,0u,0u,0x00AB0000u,4},
        {true,true,0x80000103u,0x90u,0u,0u,0x90000000u,8},
        {false,true,0x80000102u,0u,0x90ABCDEFu,0xABu,0u,4},
        {false,true,0x80000103u,0u,0x90ABCDEFu,0x90u,0u,8},
        {true,false,0x80000108u,0x12345678u,0u,0u,0x12345678u,15},
        {false,false,0x80000108u,0u,42u,42u,0u,15}
    };
    for (const auto& c:cases) {
        dut.clk=0;dut.rst=1;dut.start=0;dut.addr=0;dut.rs2_data=0;
        dut.mem_read=0;dut.mem_write=0;dut.mem_byte=0;
        dut.mem_rdata=0;dut.lsu_respValid=0;dut.eval();
        dut.clk=1;dut.eval();dut.clk=0;dut.rst=0;dut.eval();
        dut.start=1;dut.addr=c.addr;dut.rs2_data=c.data;
        dut.mem_read=!c.write;dut.mem_write=c.write;dut.mem_byte=c.byte;
        int sent_at=-1;unsigned requests=0,unsent_waits=0;bool complete=false;
        for (int cycle=0;cycle<64;cycle++) {
            dut.clk=0;dut.lsu_respValid=sent_at>=0 && cycle>=sent_at+3;
            dut.mem_rdata=c.response;dut.eval();
            if (cycle>0) {
                require(dut.mem_addr==c.addr,"task address changed with live inputs");
                require(dut.mem_wdata==c.expected_wdata,"saved shifted data changed");
                require(dut.mem_wmask==c.expected_mask,"saved mask changed");
            }
            if (dut.lsu_reqValid) {
                require(sent_at<0,"duplicate data request");
                require(dut.mem_addr==c.addr && dut.mem_wdata==c.expected_wdata &&
                        dut.mem_wmask==c.expected_mask,"incorrect request payload");
                require(bool(dut.mem_wen)==c.write && bool(dut.mem_ren)==!c.write,
                        "request type changed with live inputs");
                sent_at=cycle;requests++;
            } else if (sent_at<0) unsent_waits++;
            if (dut.done) {
                require(dut.lsu_respValid && sent_at>=0,"completion before reply");
                require(dut.load_data==(c.write?0:c.expected_data),
                        "read format depends on poisoned live address/type");
                complete=true;
            } else require(!dut.lsu_respValid,"reply did not complete task");
            dut.clk=1;dut.eval();
            // After acceptance, change every live task field.
            dut.start=0;dut.addr=0xDEAD0001u;dut.rs2_data=0xFEDCBA98u;
            dut.mem_read=c.write;dut.mem_write=!c.write;dut.mem_byte=!c.byte;
            if (complete) break;
        }
        require(complete && requests==1,"task failed to complete exactly once");
        require(random_mode ? unsent_waits>0 : sent_at==0,
                "request mode did not exercise intended path");
        dut.clk=0;dut.lsu_respValid=0;dut.eval();
        require(!dut.done && !dut.lsu_reqValid,"completed task was reissued");
        std::printf("PASS %s addr=%08x requests=%u unsent_waits=%u\n",
                    c.write?"store":"load",c.addr,requests,unsent_waits);
    }
    dut.final();std::puts("LSU task isolation: PASS 6 cases");
}
