// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtop.h for the primary calling header

#ifndef VERILATED_VTOP___024ROOT_H_
#define VERILATED_VTOP___024ROOT_H_  // guard

#include "verilated.h"


class Vtop__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtop___024root final {
  public:

    // DESIGN SPECIFIC STATE
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        VL_IN8(clk,0,0);
        VL_IN8(rst,0,0);
        VL_OUT8(illegal,0,0);
        CData/*0:0*/ top__DOT__clk;
        CData/*0:0*/ top__DOT__rst;
        CData/*0:0*/ top__DOT__illegal;
        CData/*3:0*/ top__DOT__rd;
        CData/*3:0*/ top__DOT__rs1;
        CData/*3:0*/ top__DOT__rs2;
        CData/*0:0*/ top__DOT__wen;
        CData/*0:0*/ top__DOT__alu_src;
        CData/*1:0*/ top__DOT__wb_sel;
        CData/*0:0*/ top__DOT__pc_sel;
        CData/*1:0*/ top__DOT__u_wbu__DOT__wb_sel;
        CData/*0:0*/ top__DOT__u_wbu__DOT__pc_sel;
        CData/*1:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__key;
        CData/*1:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key;
        CData/*0:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__hit;
        CData/*0:0*/ top__DOT__u_ifu__DOT__clk;
        CData/*0:0*/ top__DOT__u_ifu__DOT__rst;
        CData/*0:0*/ top__DOT__u_ifu__DOT__u_pc__DOT__clk;
        CData/*0:0*/ top__DOT__u_ifu__DOT__u_pc__DOT__rst;
        CData/*0:0*/ top__DOT__u_ifu__DOT__u_pc__DOT__wen;
        CData/*0:0*/ top__DOT__u_exu__DOT__alu_src;
        CData/*0:0*/ top__DOT__u_rf__DOT__clk;
        CData/*3:0*/ top__DOT__u_rf__DOT__waddr;
        CData/*0:0*/ top__DOT__u_rf__DOT__wen_in;
        CData/*3:0*/ top__DOT__u_rf__DOT__raddr1;
        CData/*3:0*/ top__DOT__u_rf__DOT__raddr2;
        CData/*0:0*/ top__DOT__u_rf__DOT__wen;
        CData/*3:0*/ top__DOT__u_idu__DOT__rd;
        CData/*3:0*/ top__DOT__u_idu__DOT__rs1;
        CData/*3:0*/ top__DOT__u_idu__DOT__rs2;
        CData/*0:0*/ top__DOT__u_idu__DOT__wen;
        CData/*0:0*/ top__DOT__u_idu__DOT__alu_src;
        CData/*1:0*/ top__DOT__u_idu__DOT__wb_sel;
        CData/*0:0*/ top__DOT__u_idu__DOT__pc_sel;
        CData/*0:0*/ top__DOT__u_idu__DOT__illegal;
        CData/*6:0*/ top__DOT__u_idu__DOT__opcode;
        CData/*2:0*/ top__DOT__u_idu__DOT__funct3;
        CData/*0:0*/ top__DOT__u_idu__DOT__is_addi;
        CData/*0:0*/ top__DOT__u_idu__DOT__is_jalr;
        CData/*0:0*/ __VstlFirstIteration;
        CData/*0:0*/ __VstlPhaseResult;
        CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__rst__0;
        CData/*0:0*/ __VicoDidInit;
        CData/*0:0*/ __VicoFirstIteration;
        CData/*0:0*/ __VicoPhaseResult;
        CData/*0:0*/ __Vtrigprevexpr___TOP__top__DOT__u_ifu__DOT__u_pc__DOT__clk__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__top__DOT__u_rf__DOT__clk__0;
        CData/*0:0*/ __VactPhaseResult;
        CData/*0:0*/ __VnbaPhaseResult;
        VL_IN(inst_in,31,0);
        VL_OUT(pc,31,0);
        IData/*31:0*/ top__DOT__inst_in;
        IData/*31:0*/ top__DOT__pc;
        IData/*31:0*/ top__DOT__next_pc;
        IData/*31:0*/ top__DOT__inst;
        IData/*31:0*/ top__DOT__imm;
        IData/*31:0*/ top__DOT__alu_out;
        IData/*31:0*/ top__DOT__wdata;
        IData/*31:0*/ top__DOT__rs1_data;
        IData/*31:0*/ top__DOT__rs2_data;
    };
    struct {
        IData/*31:0*/ top__DOT__u_wbu__DOT__alu_out;
        IData/*31:0*/ top__DOT__u_wbu__DOT__load_data;
        IData/*31:0*/ top__DOT__u_wbu__DOT__imm;
        IData/*31:0*/ top__DOT__u_wbu__DOT__pc;
        IData/*31:0*/ top__DOT__u_wbu__DOT__wdata;
        IData/*31:0*/ top__DOT__u_wbu__DOT__next_pc;
        IData/*31:0*/ top__DOT__u_wbu__DOT__pc_plus4;
        IData/*31:0*/ top__DOT__u_wbu__DOT__jump_target;
        IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__out;
        VlWide<5>/*135:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut;
        IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__out;
        IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__default_out;
        VlWide<5>/*135:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut;
        IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut_out;
        IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i;
        IData/*31:0*/ top__DOT__u_ifu__DOT__inst_in;
        IData/*31:0*/ top__DOT__u_ifu__DOT__next_pc;
        IData/*31:0*/ top__DOT__u_ifu__DOT__pc;
        IData/*31:0*/ top__DOT__u_ifu__DOT__inst;
        IData/*31:0*/ top__DOT__u_ifu__DOT__u_pc__DOT__din;
        IData/*31:0*/ top__DOT__u_ifu__DOT__u_pc__DOT__dout;
        IData/*31:0*/ top__DOT__u_exu__DOT__rs1_data;
        IData/*31:0*/ top__DOT__u_exu__DOT__rs2_data;
        IData/*31:0*/ top__DOT__u_exu__DOT__imm;
        IData/*31:0*/ top__DOT__u_exu__DOT__alu_out;
        IData/*31:0*/ top__DOT__u_exu__DOT__alu_b;
        IData/*31:0*/ top__DOT__u_rf__DOT__wdata;
        IData/*31:0*/ top__DOT__u_rf__DOT__rdata1;
        IData/*31:0*/ top__DOT__u_rf__DOT__rdata2;
        IData/*31:0*/ top__DOT__u_idu__DOT__inst;
        IData/*31:0*/ top__DOT__u_idu__DOT__imm;
        IData/*31:0*/ top__DOT__u_idu__DOT__imm_i;
        IData/*31:0*/ top__DOT__u_idu__DOT__imm_s;
        IData/*31:0*/ top__DOT__u_idu__DOT__imm_u;
        IData/*31:0*/ __Vtrigprevexpr___TOP__inst_in__0;
        IData/*31:0*/ __VactIterCount;
        VlUnpacked<QData/*33:0*/, 4> top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list;
        VlUnpacked<CData/*1:0*/, 4> top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key_list;
        VlUnpacked<IData/*31:0*/, 4> top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__data_list;
        VlUnpacked<IData/*31:0*/, 16> top__DOT__u_rf__DOT__rf;
        VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
        VlUnpacked<QData/*63:0*/, 2> __VicoTriggered;
        VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
        VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
    };

    // INTERNAL VARIABLES
    Vtop__Syms* vlSymsp;
    const char* vlNamep;

    // PARAMETERS
    static constexpr IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__NR_KEY = 4U;
    static constexpr IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__KEY_LEN = 2U;
    static constexpr IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__DATA_LEN = 0x00000020U;
    static constexpr IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__NR_KEY = 4U;
    static constexpr IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__KEY_LEN = 2U;
    static constexpr IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__DATA_LEN = 0x00000020U;
    static constexpr IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__HAS_DEFAULT = 0U;
    static constexpr IData/*31:0*/ top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__PAIR_LEN = 0x00000022U;
    static constexpr IData/*31:0*/ top__DOT__u_ifu__DOT__u_pc__DOT__WIDTH = 0x00000020U;
    static constexpr IData/*31:0*/ top__DOT__u_ifu__DOT__u_pc__DOT__RESET_VAL = 0U;
    static constexpr IData/*31:0*/ top__DOT__u_rf__DOT__ADDR_WIDTH = 4U;
    static constexpr IData/*31:0*/ top__DOT__u_rf__DOT__DATA_WIDTH = 0x00000020U;

    // CONSTRUCTORS
    Vtop___024root(Vtop__Syms* symsp, const char* namep);
    ~Vtop___024root();
    VL_UNCOPYABLE(Vtop___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
