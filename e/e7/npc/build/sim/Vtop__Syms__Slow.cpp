// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vtop__pch.h"

Vtop__Syms::Vtop__Syms(VerilatedContext* contextp, const char* namep, Vtop* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup top module instance
    , TOP{this, namep}
{
    // Check resources
    Verilated::stackCheck(294);
    // Setup sub module instances
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-12);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
    // Setup scopes
    __Vscopep_TOP = new VerilatedScope{this, "TOP", "TOP", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    __Vscopep_top = new VerilatedScope{this, "top", "top", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    __Vscopep_top__u_exu = new VerilatedScope{this, "top.u_exu", "u_exu", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    __Vscopep_top__u_idu = new VerilatedScope{this, "top.u_idu", "u_idu", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    __Vscopep_top__u_ifu = new VerilatedScope{this, "top.u_ifu", "u_ifu", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    __Vscopep_top__u_ifu__u_pc = new VerilatedScope{this, "top.u_ifu.u_pc", "u_pc", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    __Vscopep_top__u_rf = new VerilatedScope{this, "top.u_rf", "u_rf", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    __Vscopep_top__u_wbu = new VerilatedScope{this, "top.u_wbu", "u_wbu", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    __Vscopep_top__u_wbu__u_wb_mux = new VerilatedScope{this, "top.u_wbu.u_wb_mux", "u_wb_mux", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    __Vscopep_top__u_wbu__u_wb_mux__i0 = new VerilatedScope{this, "top.u_wbu.u_wb_mux.i0", "i0", "<null>", 0, VerilatedScope::SCOPE_OTHER};
    // Setup export functions - final: 0
    // Setup export functions - final: 1
    // Setup public variables
    __Vscopep_TOP->varInsert("clk", &(TOP.clk), false, VLVT_UINT8, VLVD_IN|VLVF_PUB_RW, 0, 0);
    __Vscopep_TOP->varInsert("illegal", &(TOP.illegal), false, VLVT_UINT8, VLVD_OUT|VLVF_PUB_RW, 0, 0);
    __Vscopep_TOP->varInsert("inst_in", &(TOP.inst_in), false, VLVT_UINT32, VLVD_IN|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_TOP->varInsert("pc", &(TOP.pc), false, VLVT_UINT32, VLVD_OUT|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_TOP->varInsert("rst", &(TOP.rst), false, VLVT_UINT8, VLVD_IN|VLVF_PUB_RW, 0, 0);
    __Vscopep_top->varInsert("alu_out", &(TOP.top__DOT__alu_out), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top->varInsert("alu_src", &(TOP.top__DOT__alu_src), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 0);
    __Vscopep_top->varInsert("clk", &(TOP.top__DOT__clk), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top->varInsert("illegal", &(TOP.top__DOT__illegal), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top->varInsert("imm", &(TOP.top__DOT__imm), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top->varInsert("inst", &(TOP.top__DOT__inst), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top->varInsert("inst_in", &(TOP.top__DOT__inst_in), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top->varInsert("next_pc", &(TOP.top__DOT__next_pc), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top->varInsert("pc", &(TOP.top__DOT__pc), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top->varInsert("pc_sel", &(TOP.top__DOT__pc_sel), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 0);
    __Vscopep_top->varInsert("rd", &(TOP.top__DOT__rd), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,3,0);
    __Vscopep_top->varInsert("rs1", &(TOP.top__DOT__rs1), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,3,0);
    __Vscopep_top->varInsert("rs1_data", &(TOP.top__DOT__rs1_data), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top->varInsert("rs2", &(TOP.top__DOT__rs2), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,3,0);
    __Vscopep_top->varInsert("rs2_data", &(TOP.top__DOT__rs2_data), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top->varInsert("rst", &(TOP.top__DOT__rst), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top->varInsert("wb_sel", &(TOP.top__DOT__wb_sel), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,1,0);
    __Vscopep_top->varInsert("wdata", &(TOP.top__DOT__wdata), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top->varInsert("wen", &(TOP.top__DOT__wen), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_NET, 0, 0);
    __Vscopep_top__u_exu->varInsert("alu_b", &(TOP.top__DOT__u_exu__DOT__alu_b), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top__u_exu->varInsert("alu_out", &(TOP.top__DOT__u_exu__DOT__alu_out), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,31,0);
    __Vscopep_top__u_exu->varInsert("alu_src", &(TOP.top__DOT__u_exu__DOT__alu_src), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_exu->varInsert("imm", &(TOP.top__DOT__u_exu__DOT__imm), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_exu->varInsert("rs1_data", &(TOP.top__DOT__u_exu__DOT__rs1_data), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_exu->varInsert("rs2_data", &(TOP.top__DOT__u_exu__DOT__rs2_data), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_idu->varInsert("alu_src", &(TOP.top__DOT__u_idu__DOT__alu_src), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 0);
    __Vscopep_top__u_idu->varInsert("funct3", &(TOP.top__DOT__u_idu__DOT__funct3), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 1 ,2,0);
    __Vscopep_top__u_idu->varInsert("illegal", &(TOP.top__DOT__u_idu__DOT__illegal), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 0);
    __Vscopep_top__u_idu->varInsert("imm", &(TOP.top__DOT__u_idu__DOT__imm), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,31,0);
    __Vscopep_top__u_idu->varInsert("imm_i", &(TOP.top__DOT__u_idu__DOT__imm_i), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top__u_idu->varInsert("imm_s", &(TOP.top__DOT__u_idu__DOT__imm_s), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top__u_idu->varInsert("imm_u", &(TOP.top__DOT__u_idu__DOT__imm_u), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top__u_idu->varInsert("inst", &(TOP.top__DOT__u_idu__DOT__inst), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_idu->varInsert("is_addi", &(TOP.top__DOT__u_idu__DOT__is_addi), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 0);
    __Vscopep_top__u_idu->varInsert("is_jalr", &(TOP.top__DOT__u_idu__DOT__is_jalr), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 0);
    __Vscopep_top__u_idu->varInsert("opcode", &(TOP.top__DOT__u_idu__DOT__opcode), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 1 ,6,0);
    __Vscopep_top__u_idu->varInsert("pc_sel", &(TOP.top__DOT__u_idu__DOT__pc_sel), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 0);
    __Vscopep_top__u_idu->varInsert("rd", &(TOP.top__DOT__u_idu__DOT__rd), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,3,0);
    __Vscopep_top__u_idu->varInsert("rs1", &(TOP.top__DOT__u_idu__DOT__rs1), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,3,0);
    __Vscopep_top__u_idu->varInsert("rs2", &(TOP.top__DOT__u_idu__DOT__rs2), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,3,0);
    __Vscopep_top__u_idu->varInsert("wb_sel", &(TOP.top__DOT__u_idu__DOT__wb_sel), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,1,0);
    __Vscopep_top__u_idu->varInsert("wen", &(TOP.top__DOT__u_idu__DOT__wen), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 0);
    __Vscopep_top__u_ifu->varInsert("clk", &(TOP.top__DOT__u_ifu__DOT__clk), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_ifu->varInsert("inst", &(TOP.top__DOT__u_ifu__DOT__inst), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,31,0);
    __Vscopep_top__u_ifu->varInsert("inst_in", &(TOP.top__DOT__u_ifu__DOT__inst_in), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_ifu->varInsert("next_pc", &(TOP.top__DOT__u_ifu__DOT__next_pc), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_ifu->varInsert("pc", &(TOP.top__DOT__u_ifu__DOT__pc), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_ifu->varInsert("rst", &(TOP.top__DOT__u_ifu__DOT__rst), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_ifu__u_pc->varInsert("RESET_VAL", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_ifu__DOT__u_pc__DOT__RESET_VAL))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_ifu__u_pc->varInsert("WIDTH", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_ifu__DOT__u_pc__DOT__WIDTH))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_ifu__u_pc->varInsert("clk", &(TOP.top__DOT__u_ifu__DOT__u_pc__DOT__clk), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_ifu__u_pc->varInsert("din", &(TOP.top__DOT__u_ifu__DOT__u_pc__DOT__din), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_ifu__u_pc->varInsert("dout", &(TOP.top__DOT__u_ifu__DOT__u_pc__DOT__dout), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_ifu__u_pc->varInsert("rst", &(TOP.top__DOT__u_ifu__DOT__u_pc__DOT__rst), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_ifu__u_pc->varInsert("wen", &(TOP.top__DOT__u_ifu__DOT__u_pc__DOT__wen), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_rf->varInsert("ADDR_WIDTH", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_rf__DOT__ADDR_WIDTH))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_rf->varInsert("DATA_WIDTH", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_rf__DOT__DATA_WIDTH))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_rf->varInsert("clk", &(TOP.top__DOT__u_rf__DOT__clk), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_rf->varInsert("raddr1", &(TOP.top__DOT__u_rf__DOT__raddr1), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,3,0);
    __Vscopep_top__u_rf->varInsert("raddr2", &(TOP.top__DOT__u_rf__DOT__raddr2), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,3,0);
    __Vscopep_top__u_rf->varInsert("rdata1", &(TOP.top__DOT__u_rf__DOT__rdata1), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,31,0);
    __Vscopep_top__u_rf->varInsert("rdata2", &(TOP.top__DOT__u_rf__DOT__rdata2), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,31,0);
    __Vscopep_top__u_rf->varInsert("rf", &(TOP.top__DOT__u_rf__DOT__rf), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 1, 1 ,15,0 ,31,0);
    __Vscopep_top__u_rf->varInsert("waddr", &(TOP.top__DOT__u_rf__DOT__waddr), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,3,0);
    __Vscopep_top__u_rf->varInsert("wdata", &(TOP.top__DOT__u_rf__DOT__wdata), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_rf->varInsert("wen", &(TOP.top__DOT__u_rf__DOT__wen), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 0);
    __Vscopep_top__u_rf->varInsert("wen_in", &(TOP.top__DOT__u_rf__DOT__wen_in), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_wbu->varInsert("alu_out", &(TOP.top__DOT__u_wbu__DOT__alu_out), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_wbu->varInsert("imm", &(TOP.top__DOT__u_wbu__DOT__imm), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_wbu->varInsert("jump_target", &(TOP.top__DOT__u_wbu__DOT__jump_target), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top__u_wbu->varInsert("load_data", &(TOP.top__DOT__u_wbu__DOT__load_data), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_wbu->varInsert("next_pc", &(TOP.top__DOT__u_wbu__DOT__next_pc), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY, 0, 1 ,31,0);
    __Vscopep_top__u_wbu->varInsert("pc", &(TOP.top__DOT__u_wbu__DOT__pc), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_wbu->varInsert("pc_plus4", &(TOP.top__DOT__u_wbu__DOT__pc_plus4), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 0, 1 ,31,0);
    __Vscopep_top__u_wbu->varInsert("pc_sel", &(TOP.top__DOT__u_wbu__DOT__pc_sel), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_wbu->varInsert("wb_sel", &(TOP.top__DOT__u_wbu__DOT__wb_sel), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,1,0);
    __Vscopep_top__u_wbu->varInsert("wdata", &(TOP.top__DOT__u_wbu__DOT__wdata), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux->varInsert("DATA_LEN", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__DATA_LEN))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux->varInsert("KEY_LEN", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__KEY_LEN))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux->varInsert("NR_KEY", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__NR_KEY))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux->varInsert("key", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__key), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,1,0);
    __Vscopep_top__u_wbu__u_wb_mux->varInsert("lut", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut), false, VLVT_WDATA, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,135,0);
    __Vscopep_top__u_wbu__u_wb_mux->varInsert("out", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__out), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("DATA_LEN", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__DATA_LEN))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("HAS_DEFAULT", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__HAS_DEFAULT))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("KEY_LEN", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__KEY_LEN))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("NR_KEY", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__NR_KEY))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("PAIR_LEN", const_cast<void*>(static_cast<const void*>(&(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__PAIR_LEN))), true, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("data_list", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__data_list), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 1, 1 ,3,0 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("default_out", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__default_out), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("hit", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__hit), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("i", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW|VLVF_SIGNED, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("key", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,1,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("key_list", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key_list), false, VLVT_UINT8, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 1, 1 ,3,0 ,1,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("lut", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut), false, VLVT_WDATA, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,135,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("lut_out", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut_out), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("out", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__out), false, VLVT_UINT32, VLVD_NODIR|VLVF_PUB_RW, 0, 1 ,31,0);
    __Vscopep_top__u_wbu__u_wb_mux__i0->varInsert("pair_list", &(TOP.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list), false, VLVT_UINT64, VLVD_NODIR|VLVF_PUB_RW|VLVF_CONTINUOUSLY|VLVF_NET, 1, 1 ,3,0 ,33,0);
}

Vtop__Syms::~Vtop__Syms() {
    // Tear down scopes
    VL_DO_CLEAR(delete __Vscopep_TOP, __Vscopep_TOP = nullptr);
    VL_DO_CLEAR(delete __Vscopep_top, __Vscopep_top = nullptr);
    VL_DO_CLEAR(delete __Vscopep_top__u_exu, __Vscopep_top__u_exu = nullptr);
    VL_DO_CLEAR(delete __Vscopep_top__u_idu, __Vscopep_top__u_idu = nullptr);
    VL_DO_CLEAR(delete __Vscopep_top__u_ifu, __Vscopep_top__u_ifu = nullptr);
    VL_DO_CLEAR(delete __Vscopep_top__u_ifu__u_pc, __Vscopep_top__u_ifu__u_pc = nullptr);
    VL_DO_CLEAR(delete __Vscopep_top__u_rf, __Vscopep_top__u_rf = nullptr);
    VL_DO_CLEAR(delete __Vscopep_top__u_wbu, __Vscopep_top__u_wbu = nullptr);
    VL_DO_CLEAR(delete __Vscopep_top__u_wbu__u_wb_mux, __Vscopep_top__u_wbu__u_wb_mux = nullptr);
    VL_DO_CLEAR(delete __Vscopep_top__u_wbu__u_wb_mux__i0, __Vscopep_top__u_wbu__u_wb_mux__i0 = nullptr);
    // Tear down sub module instances
}
