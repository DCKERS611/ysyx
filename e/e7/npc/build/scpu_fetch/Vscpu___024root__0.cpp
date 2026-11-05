// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vscpu.h for the primary calling header

#include "Vscpu__pch.h"

bool Vscpu___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void Vscpu___024root___nba_sequent__TOP__0(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___nba_sequent__TOP__0\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (vlSelfRef.rst) {
        vlSelfRef.pc = 0U;
        vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__3__KET____DOT__u_reg__dout = 0U;
        vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__2__KET____DOT__u_reg__dout = 0U;
        vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__1__KET____DOT__u_reg__dout = 0U;
        vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__0__KET____DOT__u_reg__dout = 0U;
        vlSelfRef.led = 0U;
    } else {
        vlSelfRef.pc = (0x000000ffU & ((IData)(((0xc0U 
                                                 == 
                                                 (0xc0U 
                                                  & (IData)(vlSelfRef.inst))) 
                                                & (vlSelfRef.scpu__DOT__u_gpr__DOT__regs
                                                   [
                                                   (3U 
                                                    & (((IData)(vlSelfRef.inst) 
                                                        >> 2U) 
                                                       & (- (IData)(
                                                                    (3U 
                                                                     != 
                                                                     (3U 
                                                                      & ((IData)(vlSelfRef.inst) 
                                                                         >> 6U)))))))] 
                                                   != vlSelfRef.scpu__DOT__u_gpr__DOT__regs
                                                   [
                                                   (3U 
                                                    & ((1U 
                                                        == 
                                                        (3U 
                                                         & ((IData)(vlSelfRef.inst) 
                                                            >> 6U)))
                                                        ? 
                                                       ((IData)(vlSelfRef.inst) 
                                                        >> 4U)
                                                        : (IData)(vlSelfRef.inst)))])))
                                        ? ((IData)(vlSelfRef.pc) 
                                           + ((0x000000f0U 
                                               & ((- (IData)(
                                                             (1U 
                                                              & ((IData)(vlSelfRef.inst) 
                                                                 >> 5U)))) 
                                                  << 4U)) 
                                              | (0x0000000fU 
                                                 & ((IData)(vlSelfRef.inst) 
                                                    >> 2U))))
                                        : ((IData)(1U) 
                                           + (IData)(vlSelfRef.pc))));
        if (((IData)(vlSelfRef.scpu__DOT__w_reg) & 
             (0x30U == (0x30U & (IData)(vlSelfRef.inst))))) {
            vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__3__KET____DOT__u_reg__dout 
                = vlSelfRef.scpu__DOT__wdata;
        }
        if (((IData)(vlSelfRef.scpu__DOT__w_reg) & 
             (0x20U == (0x30U & (IData)(vlSelfRef.inst))))) {
            vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__2__KET____DOT__u_reg__dout 
                = vlSelfRef.scpu__DOT__wdata;
        }
        if (((IData)(vlSelfRef.scpu__DOT__w_reg) & 
             (0x10U == (0x30U & (IData)(vlSelfRef.inst))))) {
            vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__1__KET____DOT__u_reg__dout 
                = vlSelfRef.scpu__DOT__wdata;
        }
        if (((IData)(vlSelfRef.scpu__DOT__w_reg) & 
             (0U == (0x30U & (IData)(vlSelfRef.inst))))) {
            vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__0__KET____DOT__u_reg__dout 
                = vlSelfRef.scpu__DOT__wdata;
        }
        if ((IData)((0x40U == (0xc7U & (IData)(vlSelfRef.inst))))) {
            vlSelfRef.led = vlSelfRef.scpu__DOT__u_gpr__DOT__regs
                [(3U & ((1U == (3U & ((IData)(vlSelfRef.inst) 
                                      >> 6U))) ? ((IData)(vlSelfRef.inst) 
                                                  >> 4U)
                         : (IData)(vlSelfRef.inst)))];
        }
    }
    vlSelfRef.inst = ((- (IData)(((0x0aU == (IData)(vlSelfRef.pc)) 
                                  | ((9U == (IData)(vlSelfRef.pc)) 
                                     | ((8U == (IData)(vlSelfRef.pc)) 
                                        | ((7U == (IData)(vlSelfRef.pc)) 
                                           | ((6U == (IData)(vlSelfRef.pc)) 
                                              | ((5U 
                                                  == (IData)(vlSelfRef.pc)) 
                                                 | ((4U 
                                                     == (IData)(vlSelfRef.pc)) 
                                                    | ((3U 
                                                        == (IData)(vlSelfRef.pc)) 
                                                       | ((2U 
                                                           == (IData)(vlSelfRef.pc)) 
                                                          | ((0U 
                                                              == (IData)(vlSelfRef.pc)) 
                                                             | (1U 
                                                                == (IData)(vlSelfRef.pc)))))))))))))) 
                      & ((0xc3U & (- (IData)((0x0aU 
                                              == (IData)(vlSelfRef.pc))))) 
                         | ((0x68U & (- (IData)((9U 
                                                 == (IData)(vlSelfRef.pc))))) 
                            | ((0xf9U & (- (IData)(
                                                   (8U 
                                                    == (IData)(vlSelfRef.pc))))) 
                               | ((0x29U & (- (IData)(
                                                      (7U 
                                                       == (IData)(vlSelfRef.pc))))) 
                                  | ((0x17U & (- (IData)(
                                                         (6U 
                                                          == (IData)(vlSelfRef.pc))))) 
                                     | ((0xb1U & (- (IData)(
                                                            (5U 
                                                             == (IData)(vlSelfRef.pc))))) 
                                        | ((0xa0U & 
                                            (- (IData)(
                                                       (4U 
                                                        == (IData)(vlSelfRef.pc))))) 
                                           | ((0x90U 
                                               & (- (IData)(
                                                            (3U 
                                                             == (IData)(vlSelfRef.pc))))) 
                                              | ((1U 
                                                  & (- (IData)(
                                                               (2U 
                                                                == (IData)(vlSelfRef.pc))))) 
                                                 | ((0x86U 
                                                     & (- (IData)(
                                                                  (0U 
                                                                   == (IData)(vlSelfRef.pc))))) 
                                                    | (0x92U 
                                                       & (- (IData)(
                                                                    (1U 
                                                                     == (IData)(vlSelfRef.pc))))))))))))))));
    vlSelfRef.scpu__DOT__u_gpr__DOT__regs[3U] = vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__3__KET____DOT__u_reg__dout;
    vlSelfRef.scpu__DOT__u_gpr__DOT__regs[2U] = vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__2__KET____DOT__u_reg__dout;
    vlSelfRef.scpu__DOT__u_gpr__DOT__regs[1U] = vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__1__KET____DOT__u_reg__dout;
    vlSelfRef.scpu__DOT__u_gpr__DOT__regs[0U] = vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__0__KET____DOT__u_reg__dout;
    vlSelfRef.scpu__DOT__w_reg = ((2U == (3U & ((IData)(vlSelfRef.inst) 
                                                >> 6U))) 
                                  | (0U == (3U & ((IData)(vlSelfRef.inst) 
                                                  >> 6U))));
    vlSelfRef.scpu__DOT__wdata = (0x000000ffU & ((2U 
                                                  == 
                                                  (3U 
                                                   & ((IData)(vlSelfRef.inst) 
                                                      >> 6U)))
                                                  ? 
                                                 (((- (IData)(
                                                              (3U 
                                                               == 
                                                               (3U 
                                                                & ((IData)(vlSelfRef.inst) 
                                                                   >> 2U))))) 
                                                   & ((IData)(vlSelfRef.inst) 
                                                      << 6U)) 
                                                  | ((0x00000030U 
                                                      & ((- (IData)(
                                                                    (2U 
                                                                     == 
                                                                     (3U 
                                                                      & ((IData)(vlSelfRef.inst) 
                                                                         >> 2U))))) 
                                                         & ((IData)(vlSelfRef.inst) 
                                                            << 4U))) 
                                                     | ((3U 
                                                         & ((- (IData)(
                                                                       (0U 
                                                                        == 
                                                                        (3U 
                                                                         & ((IData)(vlSelfRef.inst) 
                                                                            >> 2U))))) 
                                                            & (IData)(vlSelfRef.inst))) 
                                                        | (0x0000000cU 
                                                           & ((- (IData)(
                                                                         (1U 
                                                                          == 
                                                                          (3U 
                                                                           & ((IData)(vlSelfRef.inst) 
                                                                              >> 2U))))) 
                                                              & ((IData)(vlSelfRef.inst) 
                                                                 << 2U))))))
                                                  : 
                                                 ((IData)(vlSelfRef.scpu__DOT__u_gpr__DOT__regs
                                                          [
                                                          (3U 
                                                           & (((IData)(vlSelfRef.inst) 
                                                               >> 2U) 
                                                              & (- (IData)(
                                                                           (3U 
                                                                            != 
                                                                            (3U 
                                                                             & ((IData)(vlSelfRef.inst) 
                                                                                >> 6U)))))))]) 
                                                  + (IData)(vlSelfRef.scpu__DOT__u_gpr__DOT__regs
                                                            [
                                                            (3U 
                                                             & ((1U 
                                                                 == 
                                                                 (3U 
                                                                  & ((IData)(vlSelfRef.inst) 
                                                                     >> 6U)))
                                                                 ? 
                                                                ((IData)(vlSelfRef.inst) 
                                                                 >> 4U)
                                                                 : (IData)(vlSelfRef.inst)))]))));
}

void Vscpu___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vscpu___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vscpu___024root___eval_phase__act(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___eval_phase__act\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__act
        vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                        ((IData)(vlSelfRef.clk) 
                                                         & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0)))));
        vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vscpu___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vscpu___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    return (0U);
}

void Vscpu___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Vscpu___024root___eval_phase__nba(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___eval_phase__nba\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vscpu___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        {
            // Inlined CFunc: _eval_nba
            if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
                Vscpu___024root___nba_sequent__TOP__0(vlSelf);
            }
        }
        Vscpu___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void Vscpu___024root___eval(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___eval\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vscpu___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("/home/ysyx/ysyx-workbench/npc/vsrc/scpu.v", 1, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vscpu___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("/home/ysyx/ysyx-workbench/npc/vsrc/scpu.v", 1, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactPhaseResult = Vscpu___024root___eval_phase__act(vlSelf);
        } while (vlSelfRef.__VactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Vscpu___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void Vscpu___024root___eval_debug_assertions(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___eval_debug_assertions\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((vlSelfRef.clk & 0xfeU)))) {
        Verilated::overWidthError("clk");
    }
    if (VL_UNLIKELY(((vlSelfRef.rst & 0xfeU)))) {
        Verilated::overWidthError("rst");
    }
}
#endif  // VL_DEBUG
