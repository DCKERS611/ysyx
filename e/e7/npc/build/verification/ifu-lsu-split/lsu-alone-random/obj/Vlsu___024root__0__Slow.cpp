// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlsu.h for the primary calling header

#include "Vlsu__pch.h"

VL_ATTR_COLD void Vlsu___024root___eval_static(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval_static\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
    vlSelfRef.__Vtrigprevexpr___TOP__rst__0 = vlSelfRef.rst;
    vlSelfRef.__Vtrigprevexpr___TOP__start__0 = vlSelfRef.start;
    vlSelfRef.__Vtrigprevexpr___TOP__addr__0 = vlSelfRef.addr;
    vlSelfRef.__Vtrigprevexpr___TOP__rs2_data__0 = vlSelfRef.rs2_data;
    vlSelfRef.__Vtrigprevexpr___TOP__mem_read__0 = vlSelfRef.mem_read;
    vlSelfRef.__Vtrigprevexpr___TOP__mem_write__0 = vlSelfRef.mem_write;
    vlSelfRef.__Vtrigprevexpr___TOP__mem_byte__0 = vlSelfRef.mem_byte;
    vlSelfRef.__Vtrigprevexpr___TOP__mem_rdata__0 = vlSelfRef.mem_rdata;
    vlSelfRef.__Vtrigprevexpr___TOP__lsu_respValid__0 
        = vlSelfRef.lsu_respValid;
    vlSelfRef.__Vtrigprevexpr___TOP__clk__1 = vlSelfRef.clk;
}

VL_ATTR_COLD void Vlsu___024root___eval_initial(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval_initial\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vlsu___024root___eval_final(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval_final\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlsu___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vlsu___024root___eval_phase__stl(Vlsu___024root* vlSelf);

VL_ATTR_COLD void Vlsu___024root___eval_settle(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval_settle\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VstlIterCount;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vlsu___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
            VL_FATAL_MT("/home/ysyx/ysyx-workbench/npc/build/verification/ifu-lsu-split/lsu-alone-random/lsu.v", 1, "", "DIDNOTCONVERGE: Settle region did not converge after '--converge-limit' of 10000 tries");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        vlSelfRef.__VstlPhaseResult = Vlsu___024root___eval_phase__stl(vlSelf);
        vlSelfRef.__VstlFirstIteration = 0U;
    } while (vlSelfRef.__VstlPhaseResult);
}

VL_ATTR_COLD bool Vlsu___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlsu___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(Vlsu___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool Vlsu___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___trigger_anySet__stl\n"); );
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

VL_ATTR_COLD bool Vlsu___024root___eval_phase__stl(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval_phase__stl\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
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
        Vlsu___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
    __VstlExecute = Vlsu___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        {
            // Inlined CFunc: _eval_stl
            if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
                {
                    // Inlined CFunc: _stl_sequent__TOP__0
                    vlSelfRef.done = ((~ (IData)(vlSelfRef.rst)) 
                                      & ((IData)(vlSelfRef.lsu__DOT__task_valid) 
                                         & ((IData)(vlSelfRef.lsu_respValid) 
                                            & (IData)(vlSelfRef.lsu__DOT__task_sent))));
                    vlSelfRef.load_data = (((IData)(vlSelfRef.lsu__DOT__task_byte)
                                             ? (0x000000ffU 
                                                & (vlSelfRef.mem_rdata 
                                                   >> 
                                                   (0x00000018U 
                                                    & (vlSelfRef.lsu__DOT__task_addr 
                                                       << 3U))))
                                             : vlSelfRef.mem_rdata) 
                                           & (- (IData)(
                                                        ((~ (IData)(vlSelfRef.lsu__DOT__task_write)) 
                                                         & (IData)(vlSelfRef.lsu__DOT__task_valid)))));
                    vlSelfRef.lsu__DOT__input_wmask 
                        = (0x0000000fU & (((IData)(1U) 
                                           << (3U & vlSelfRef.addr)) 
                                          | (- (IData)(
                                                       (1U 
                                                        & (~ (IData)(vlSelfRef.mem_byte)))))));
                    vlSelfRef.lsu__DOT__input_wdata 
                        = ((IData)(vlSelfRef.mem_byte)
                            ? ((0x000000ffU & vlSelfRef.rs2_data) 
                               << (0x00000018U & (vlSelfRef.addr 
                                                  << 3U)))
                            : vlSelfRef.rs2_data);
                    if (vlSelfRef.lsu__DOT__task_valid) {
                        vlSelfRef.mem_addr = vlSelfRef.lsu__DOT__task_addr;
                        vlSelfRef.lsu__DOT__active_write 
                            = vlSelfRef.lsu__DOT__task_write;
                        vlSelfRef.mem_wmask = vlSelfRef.lsu__DOT__task_wmask;
                        vlSelfRef.mem_wdata = vlSelfRef.lsu__DOT__task_wdata;
                    } else {
                        vlSelfRef.mem_addr = vlSelfRef.addr;
                        vlSelfRef.lsu__DOT__active_write 
                            = vlSelfRef.mem_write;
                        vlSelfRef.mem_wmask = vlSelfRef.lsu__DOT__input_wmask;
                        vlSelfRef.mem_wdata = vlSelfRef.lsu__DOT__input_wdata;
                    }
                    vlSelfRef.lsu__DOT__accept = ((~ (IData)(vlSelfRef.rst)) 
                                                  & ((IData)(vlSelfRef.start) 
                                                     & ((~ (IData)(vlSelfRef.lsu__DOT__task_valid)) 
                                                        & ((IData)(vlSelfRef.mem_read) 
                                                           | (IData)(vlSelfRef.mem_write)))));
                    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_2 
                        = ((IData)(vlSelfRef.lsu__DOT__task_valid) 
                           | (IData)(vlSelfRef.lsu__DOT__accept));
                    vlSelfRef.lsu_reqValid = ((~ (IData)(vlSelfRef.rst)) 
                                              & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_2) 
                                                 & ((~ (IData)(vlSelfRef.lsu__DOT__task_sent)) 
                                                    & ((~ (IData)(vlSelfRef.lsu_respValid)) 
                                                       & ((IData)(vlSelfRef.lsu__DOT__req_lfsr) 
                                                          >> 1U)))));
                    vlSelfRef.mem_ren = ((~ (IData)(vlSelfRef.lsu__DOT__active_write)) 
                                         & (IData)(vlSelfRef.lsu_reqValid));
                    vlSelfRef.mem_wen = ((IData)(vlSelfRef.lsu__DOT__active_write) 
                                         & (IData)(vlSelfRef.lsu_reqValid));
                }
            }
        }
    }
    return (__VstlExecute);
}

bool Vlsu___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 2> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlsu___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 2> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(Vlsu___024root___trigger_anySet__ico(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @( clk)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 1U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 1 is active: @( rst)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 2U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 2 is active: @( start)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 3U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 3 is active: @( addr)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 4U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 4 is active: @( rs2_data)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 5U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 5 is active: @( mem_read)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 6U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 6 is active: @( mem_write)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 7U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 7 is active: @( mem_byte)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 8U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 8 is active: @( mem_rdata)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 9U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 9 is active: @( lsu_respValid)\n");
    }
    if ((1U & (IData)(triggers[1U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 64 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

bool Vlsu___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlsu___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Vlsu___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @(posedge clk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vlsu___024root___ctor_var_reset(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___ctor_var_reset\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16707436170211756652ull);
    vlSelf->rst = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18209466448985614591ull);
    vlSelf->start = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9867861323841650631ull);
    vlSelf->addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14934084843038794831ull);
    vlSelf->rs2_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10683005467506302743ull);
    vlSelf->mem_read = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13326595402784547387ull);
    vlSelf->mem_write = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11468839172742666876ull);
    vlSelf->mem_byte = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4875075337415740927ull);
    vlSelf->mem_rdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9659133473039683418ull);
    vlSelf->lsu_respValid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8636477089397954694ull);
    vlSelf->load_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9762156056485505432ull);
    vlSelf->lsu_reqValid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11881322873208076425ull);
    vlSelf->done = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10296494685231209730ull);
    vlSelf->mem_addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 326597072690670135ull);
    vlSelf->mem_ren = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8759674792306358751ull);
    vlSelf->mem_wen = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15152439719125524151ull);
    vlSelf->mem_wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5431754401481461448ull);
    vlSelf->mem_wmask = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 3532114055872623927ull);
    vlSelf->lsu__DOT__task_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13666759299476964738ull);
    vlSelf->lsu__DOT__task_sent = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6921814367590208058ull);
    vlSelf->lsu__DOT__task_addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12676513361855036970ull);
    vlSelf->lsu__DOT__task_wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17408372670771016988ull);
    vlSelf->lsu__DOT__task_wmask = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4301123509624745050ull);
    vlSelf->lsu__DOT__task_write = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1093413368454367014ull);
    vlSelf->lsu__DOT__task_byte = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6539325381156718712ull);
    vlSelf->lsu__DOT__req_lfsr = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 366451435855823432ull);
    vlSelf->lsu__DOT__accept = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1723405431884671806ull);
    vlSelf->lsu__DOT__input_wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10210305497708667299ull);
    vlSelf->lsu__DOT__input_wmask = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13849865210008746892ull);
    vlSelf->lsu__DOT__active_write = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17419941640434203333ull);
    vlSelf->__VdfgRegularize_h6e95ff9d_0_2 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VstlTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->__VicoTriggered[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__clk__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__rst__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__start__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__addr__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__rs2_data__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__mem_read__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__mem_write__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__mem_byte__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__mem_rdata__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__lsu_respValid__0 = 0;
    vlSelf->__VicoDidInit = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__clk__1 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
}
