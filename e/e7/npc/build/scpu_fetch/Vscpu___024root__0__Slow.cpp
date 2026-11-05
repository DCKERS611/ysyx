// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vscpu.h for the primary calling header

#include "Vscpu__pch.h"

VL_ATTR_COLD void Vscpu___024root___eval_static(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___eval_static\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
}

VL_ATTR_COLD void Vscpu___024root___eval_initial(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___eval_initial\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vscpu___024root___eval_final(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___eval_final\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vscpu___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vscpu___024root___eval_phase__stl(Vscpu___024root* vlSelf);

VL_ATTR_COLD void Vscpu___024root___eval_settle(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___eval_settle\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VstlIterCount;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vscpu___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
            VL_FATAL_MT("/home/ysyx/ysyx-workbench/npc/vsrc/scpu.v", 1, "", "DIDNOTCONVERGE: Settle region did not converge after '--converge-limit' of 10000 tries");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        vlSelfRef.__VstlPhaseResult = Vscpu___024root___eval_phase__stl(vlSelf);
        vlSelfRef.__VstlFirstIteration = 0U;
    } while (vlSelfRef.__VstlPhaseResult);
}

VL_ATTR_COLD bool Vscpu___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vscpu___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(Vscpu___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool Vscpu___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___trigger_anySet__stl\n"); );
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

VL_ATTR_COLD void Vscpu___024root___stl_sequent__TOP__0(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___stl_sequent__TOP__0\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
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
    vlSelfRef.scpu__DOT__u_gpr__DOT__regs[0U] = vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__0__KET____DOT__u_reg__dout;
    vlSelfRef.scpu__DOT__u_gpr__DOT__regs[1U] = vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__1__KET____DOT__u_reg__dout;
    vlSelfRef.scpu__DOT__u_gpr__DOT__regs[2U] = vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__2__KET____DOT__u_reg__dout;
    vlSelfRef.scpu__DOT__u_gpr__DOT__regs[3U] = vlSelfRef.scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__3__KET____DOT__u_reg__dout;
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

VL_ATTR_COLD bool Vscpu___024root___eval_phase__stl(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___eval_phase__stl\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VstlExecute;
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__stl
        vlSelfRef.__VstlTriggered[0U] = ((0xfffffffffffffffeULL 
                                          & vlSelfRef.__VstlTriggered[0U]) 
                                         | (IData)((IData)(vlSelfRef.__VstlFirstIteration)));
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vscpu___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
    __VstlExecute = Vscpu___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        {
            // Inlined CFunc: _eval_stl
            if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
                Vscpu___024root___stl_sequent__TOP__0(vlSelf);
            }
        }
    }
    return (__VstlExecute);
}

bool Vscpu___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vscpu___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Vscpu___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @(posedge clk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vscpu___024root___ctor_var_reset(Vscpu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vscpu___024root___ctor_var_reset\n"); );
    Vscpu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16707436170211756652ull);
    vlSelf->rst = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18209466448985614591ull);
    vlSelf->pc = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4211327832146562899ull);
    vlSelf->inst = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9812503827101699671ull);
    vlSelf->led = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 14009161575225144129ull);
    vlSelf->scpu__DOT__w_reg = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3746047161357681169ull);
    vlSelf->scpu__DOT__wdata = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9114023800731072681ull);
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->scpu__DOT__u_gpr__DOT__regs[__Vi0] = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 17630417240494836566ull);
    }
    vlSelf->scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__0__KET____DOT__u_reg__dout = 0;
    vlSelf->scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__1__KET____DOT__u_reg__dout = 0;
    vlSelf->scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__2__KET____DOT__u_reg__dout = 0;
    vlSelf->scpu__DOT__u_gpr__DOT____Vcellout__gen_reg__BRA__3__KET____DOT__u_reg__dout = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VstlTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__clk__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
}
