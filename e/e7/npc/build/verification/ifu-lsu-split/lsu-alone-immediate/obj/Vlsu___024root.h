// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vlsu.h for the primary calling header

#ifndef VERILATED_VLSU___024ROOT_H_
#define VERILATED_VLSU___024ROOT_H_  // guard

#include "verilated.h"


class Vlsu__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vlsu___024root final {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    VL_IN8(start,0,0);
    VL_IN8(mem_read,0,0);
    VL_IN8(mem_write,0,0);
    VL_IN8(mem_byte,0,0);
    VL_IN8(lsu_respValid,0,0);
    VL_OUT8(lsu_reqValid,0,0);
    VL_OUT8(done,0,0);
    VL_OUT8(mem_ren,0,0);
    VL_OUT8(mem_wen,0,0);
    VL_OUT8(mem_wmask,3,0);
    CData/*0:0*/ lsu__DOT__task_valid;
    CData/*0:0*/ lsu__DOT__task_sent;
    CData/*3:0*/ lsu__DOT__task_wmask;
    CData/*0:0*/ lsu__DOT__task_write;
    CData/*0:0*/ lsu__DOT__task_byte;
    CData/*0:0*/ lsu__DOT__accept;
    CData/*3:0*/ lsu__DOT__input_wmask;
    CData/*0:0*/ lsu__DOT__active_write;
    CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_2;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VstlPhaseResult;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__rst__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__start__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__mem_read__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__mem_write__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__mem_byte__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__lsu_respValid__0;
    CData/*0:0*/ __VicoDidInit;
    CData/*0:0*/ __VicoPhaseResult;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__1;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    VL_IN(addr,31,0);
    VL_IN(rs2_data,31,0);
    VL_IN(mem_rdata,31,0);
    VL_OUT(load_data,31,0);
    VL_OUT(mem_addr,31,0);
    VL_OUT(mem_wdata,31,0);
    IData/*31:0*/ lsu__DOT__task_addr;
    IData/*31:0*/ lsu__DOT__task_wdata;
    IData/*31:0*/ lsu__DOT__input_wdata;
    IData/*31:0*/ __Vtrigprevexpr___TOP__addr__0;
    IData/*31:0*/ __Vtrigprevexpr___TOP__rs2_data__0;
    IData/*31:0*/ __Vtrigprevexpr___TOP__mem_rdata__0;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
    VlUnpacked<QData/*63:0*/, 2> __VicoTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vlsu__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vlsu___024root(Vlsu__Syms* symsp, const char* namep);
    ~Vlsu___024root();
    VL_UNCOPYABLE(Vlsu___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
