// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vscpu.h for the primary calling header

#ifndef VERILATED_VSCPU___024ROOT_H_
#define VERILATED_VSCPU___024ROOT_H_  // guard

#include "verilated.h"


class Vscpu__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vscpu___024root final {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst,0,0);
    VL_OUT8(pc,7,0);
    VL_OUT8(inst,7,0);
    VL_OUT8(led,7,0);
    CData/*0:0*/ scpu__DOT__w_reg;
    CData/*7:0*/ scpu__DOT__wdata;
    CData/*7:0*/ scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__0__KET____DOT__u_reg__dout;
    CData/*7:0*/ scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__1__KET____DOT__u_reg__dout;
    CData/*7:0*/ scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__2__KET____DOT__u_reg__dout;
    CData/*7:0*/ scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__3__KET____DOT__u_reg__dout;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VstlPhaseResult;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<CData/*7:0*/, 4> scpu__DOT__u_gpr__DOT__regs;
    VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vscpu__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vscpu___024root(Vscpu__Syms* symsp, const char* namep);
    ~Vscpu___024root();
    VL_UNCOPYABLE(Vscpu___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
