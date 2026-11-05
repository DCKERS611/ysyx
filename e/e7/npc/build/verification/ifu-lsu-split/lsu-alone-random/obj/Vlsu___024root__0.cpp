// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlsu.h for the primary calling header

#include "Vlsu__pch.h"

bool Vlsu___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 2> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___trigger_anySet__ico\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((2U > n));
    return (0U);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlsu___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 2> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vlsu___024root___eval_phase__ico(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval_phase__ico\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VicoExecute;
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__ico
        vlSelfRef.__VicoTriggered[0U] = (QData)((IData)(
                                                        (((((IData)(vlSelfRef.lsu_respValid) 
                                                            != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__lsu_respValid__0)) 
                                                           << 9U) 
                                                          | ((vlSelfRef.mem_rdata 
                                                              != vlSelfRef.__Vtrigprevexpr___TOP__mem_rdata__0) 
                                                             << 8U)) 
                                                         | (((((((IData)(vlSelfRef.mem_byte) 
                                                                 != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__mem_byte__0)) 
                                                                << 3U) 
                                                               | (((IData)(vlSelfRef.mem_write) 
                                                                   != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__mem_write__0)) 
                                                                  << 2U)) 
                                                              | ((((IData)(vlSelfRef.mem_read) 
                                                                   != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__mem_read__0)) 
                                                                  << 1U) 
                                                                 | (vlSelfRef.rs2_data 
                                                                    != vlSelfRef.__Vtrigprevexpr___TOP__rs2_data__0))) 
                                                             << 4U) 
                                                            | ((((vlSelfRef.addr 
                                                                  != vlSelfRef.__Vtrigprevexpr___TOP__addr__0) 
                                                                 << 3U) 
                                                                | (((IData)(vlSelfRef.start) 
                                                                    != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__start__0)) 
                                                                   << 2U)) 
                                                               | ((((IData)(vlSelfRef.rst) 
                                                                    != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__rst__0)) 
                                                                   << 1U) 
                                                                  | ((IData)(vlSelfRef.clk) 
                                                                     != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0))))))));
        vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
        vlSelfRef.__Vtrigprevexpr___TOP__rst__0 = vlSelfRef.rst;
        vlSelfRef.__Vtrigprevexpr___TOP__start__0 = vlSelfRef.start;
        vlSelfRef.__Vtrigprevexpr___TOP__addr__0 = vlSelfRef.addr;
        vlSelfRef.__Vtrigprevexpr___TOP__rs2_data__0 
            = vlSelfRef.rs2_data;
        vlSelfRef.__Vtrigprevexpr___TOP__mem_read__0 
            = vlSelfRef.mem_read;
        vlSelfRef.__Vtrigprevexpr___TOP__mem_write__0 
            = vlSelfRef.mem_write;
        vlSelfRef.__Vtrigprevexpr___TOP__mem_byte__0 
            = vlSelfRef.mem_byte;
        vlSelfRef.__Vtrigprevexpr___TOP__mem_rdata__0 
            = vlSelfRef.mem_rdata;
        vlSelfRef.__Vtrigprevexpr___TOP__lsu_respValid__0 
            = vlSelfRef.lsu_respValid;
        if (VL_UNLIKELY(((1U & (~ (IData)(vlSelfRef.__VicoDidInit)))))) {
            vlSelfRef.__VicoDidInit = 1U;
            vlSelfRef.__VicoTriggered[0U] = (1ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (2ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (4ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (8ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (0x0000000000000010ULL 
                                             | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (0x0000000000000020ULL 
                                             | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (0x0000000000000040ULL 
                                             | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (0x0000000000000080ULL 
                                             | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (0x0000000000000100ULL 
                                             | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (0x0000000000000200ULL 
                                             | vlSelfRef.__VicoTriggered[0U]);
        }
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vlsu___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
    }
#endif
    __VicoExecute = Vlsu___024root___trigger_anySet__ico(vlSelfRef.__VicoTriggered);
    if (__VicoExecute) {
        {
            // Inlined CFunc: _eval_ico
            if ((8ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_sequent__TOP__0
                    vlSelfRef.mem_addr = ((IData)(vlSelfRef.lsu__DOT__task_valid)
                                           ? vlSelfRef.lsu__DOT__task_addr
                                           : vlSelfRef.addr);
                }
            }
            if ((0x0000000000000202ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_comb__TOP__0
                    vlSelfRef.done = ((~ (IData)(vlSelfRef.rst)) 
                                      & ((IData)(vlSelfRef.lsu__DOT__task_valid) 
                                         & ((IData)(vlSelfRef.lsu_respValid) 
                                            & (IData)(vlSelfRef.lsu__DOT__task_sent))));
                }
            }
            if ((0x0000000000000100ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_sequent__TOP__1
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
                }
            }
            if ((0x0000000000000088ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_comb__TOP__1
                    vlSelfRef.lsu__DOT__input_wmask 
                        = (0x0000000fU & (((IData)(1U) 
                                           << (3U & vlSelfRef.addr)) 
                                          | (- (IData)(
                                                       (1U 
                                                        & (~ (IData)(vlSelfRef.mem_byte)))))));
                    vlSelfRef.mem_wmask = ((IData)(vlSelfRef.lsu__DOT__task_valid)
                                            ? (IData)(vlSelfRef.lsu__DOT__task_wmask)
                                            : (IData)(vlSelfRef.lsu__DOT__input_wmask));
                }
            }
            if ((0x0000000000000098ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_comb__TOP__2
                    vlSelfRef.lsu__DOT__input_wdata 
                        = ((IData)(vlSelfRef.mem_byte)
                            ? ((0x000000ffU & vlSelfRef.rs2_data) 
                               << (0x00000018U & (vlSelfRef.addr 
                                                  << 3U)))
                            : vlSelfRef.rs2_data);
                    vlSelfRef.mem_wdata = ((IData)(vlSelfRef.lsu__DOT__task_valid)
                                            ? vlSelfRef.lsu__DOT__task_wdata
                                            : vlSelfRef.lsu__DOT__input_wdata);
                }
            }
            if ((0x0000000000000040ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_sequent__TOP__2
                    vlSelfRef.lsu__DOT__active_write 
                        = ((IData)(vlSelfRef.lsu__DOT__task_valid)
                            ? (IData)(vlSelfRef.lsu__DOT__task_write)
                            : (IData)(vlSelfRef.mem_write));
                }
            }
            if ((0x0000000000000066ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_comb__TOP__3
                    vlSelfRef.lsu__DOT__accept = ((~ (IData)(vlSelfRef.rst)) 
                                                  & ((IData)(vlSelfRef.start) 
                                                     & ((~ (IData)(vlSelfRef.lsu__DOT__task_valid)) 
                                                        & ((IData)(vlSelfRef.mem_read) 
                                                           | (IData)(vlSelfRef.mem_write)))));
                    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_2 
                        = ((IData)(vlSelfRef.lsu__DOT__task_valid) 
                           | (IData)(vlSelfRef.lsu__DOT__accept));
                }
            }
            if ((0x0000000000000266ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_comb__TOP__4
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
    return (__VicoExecute);
}

bool Vlsu___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___trigger_anySet__act\n"); );
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

void Vlsu___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___trigger_orInto__act_vec_vec\n"); );
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
VL_ATTR_COLD void Vlsu___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vlsu___024root___eval_phase__act(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval_phase__act\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__act
        vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                        ((IData)(vlSelfRef.clk) 
                                                         & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__1)))));
        vlSelfRef.__Vtrigprevexpr___TOP__clk__1 = vlSelfRef.clk;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vlsu___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vlsu___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    return (0U);
}

void Vlsu___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

extern const VlUnpacked<CData/*7:0*/, 512> Vlsu__ConstPool__TABLE_hebe76de9_0;

bool Vlsu___024root___eval_phase__nba(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval_phase__nba\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vlsu___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        {
            // Inlined CFunc: _eval_nba
            if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
                {
                    // Inlined CFunc: _nba_sequent__TOP__0
                    SData/*8:0*/ __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vtableidx1;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vtableidx1 = 0;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vtableidx1 
                        = (((IData)(vlSelfRef.lsu__DOT__req_lfsr) 
                            << 1U) | (IData)(vlSelfRef.rst));
                    vlSelfRef.lsu__DOT__req_lfsr = Vlsu__ConstPool__TABLE_hebe76de9_0
                        [__Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___Vtableidx1];
                    if (vlSelfRef.rst) {
                        vlSelfRef.lsu__DOT__task_byte = 0U;
                        vlSelfRef.lsu__DOT__task_wmask = 0U;
                        vlSelfRef.lsu__DOT__task_wdata = 0U;
                        vlSelfRef.lsu__DOT__task_addr = 0U;
                        vlSelfRef.lsu__DOT__task_sent = 0U;
                        vlSelfRef.lsu__DOT__task_write = 0U;
                        vlSelfRef.lsu__DOT__task_valid = 0U;
                    } else {
                        if (vlSelfRef.lsu__DOT__accept) {
                            vlSelfRef.lsu__DOT__task_byte 
                                = vlSelfRef.mem_byte;
                            vlSelfRef.lsu__DOT__task_wmask 
                                = vlSelfRef.lsu__DOT__input_wmask;
                            vlSelfRef.lsu__DOT__task_wdata 
                                = vlSelfRef.lsu__DOT__input_wdata;
                            vlSelfRef.lsu__DOT__task_addr 
                                = vlSelfRef.addr;
                            vlSelfRef.lsu__DOT__task_write 
                                = vlSelfRef.mem_write;
                        }
                        if (((IData)(vlSelfRef.lsu_reqValid) 
                             | (IData)(vlSelfRef.done))) {
                            vlSelfRef.lsu__DOT__task_sent 
                                = ((~ (IData)(vlSelfRef.done)) 
                                   & (IData)(vlSelfRef.lsu_reqValid));
                        }
                        if (((IData)(vlSelfRef.done) 
                             | (IData)(vlSelfRef.lsu__DOT__accept))) {
                            vlSelfRef.lsu__DOT__task_valid 
                                = ((~ (IData)(vlSelfRef.done)) 
                                   & (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_2));
                        }
                    }
                    if (vlSelfRef.lsu__DOT__task_valid) {
                        vlSelfRef.mem_addr = vlSelfRef.lsu__DOT__task_addr;
                        vlSelfRef.mem_wdata = vlSelfRef.lsu__DOT__task_wdata;
                        vlSelfRef.mem_wmask = vlSelfRef.lsu__DOT__task_wmask;
                        vlSelfRef.lsu__DOT__active_write 
                            = vlSelfRef.lsu__DOT__task_write;
                    } else {
                        vlSelfRef.mem_addr = vlSelfRef.addr;
                        vlSelfRef.mem_wdata = vlSelfRef.lsu__DOT__input_wdata;
                        vlSelfRef.mem_wmask = vlSelfRef.lsu__DOT__input_wmask;
                        vlSelfRef.lsu__DOT__active_write 
                            = vlSelfRef.mem_write;
                    }
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
        Vlsu___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void Vlsu___024root___eval(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VicoIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VicoIterCount)))) {
#ifdef VL_DEBUG
            Vlsu___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
#endif
            VL_FATAL_MT("/home/ysyx/ysyx-workbench/npc/build/verification/ifu-lsu-split/lsu-alone-random/lsu.v", 1, "", "DIDNOTCONVERGE: Input combinational region did not converge after '--converge-limit' of 10000 tries");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        vlSelfRef.__VicoPhaseResult = Vlsu___024root___eval_phase__ico(vlSelf);
    } while (vlSelfRef.__VicoPhaseResult);
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vlsu___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("/home/ysyx/ysyx-workbench/npc/build/verification/ifu-lsu-split/lsu-alone-random/lsu.v", 1, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vlsu___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("/home/ysyx/ysyx-workbench/npc/build/verification/ifu-lsu-split/lsu-alone-random/lsu.v", 1, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactPhaseResult = Vlsu___024root___eval_phase__act(vlSelf);
        } while (vlSelfRef.__VactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Vlsu___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void Vlsu___024root___eval_debug_assertions(Vlsu___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlsu___024root___eval_debug_assertions\n"); );
    Vlsu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((vlSelfRef.clk & 0xfeU)))) {
        Verilated::overWidthError("clk");
    }
    if (VL_UNLIKELY(((vlSelfRef.rst & 0xfeU)))) {
        Verilated::overWidthError("rst");
    }
    if (VL_UNLIKELY(((vlSelfRef.start & 0xfeU)))) {
        Verilated::overWidthError("start");
    }
    if (VL_UNLIKELY(((vlSelfRef.mem_read & 0xfeU)))) {
        Verilated::overWidthError("mem_read");
    }
    if (VL_UNLIKELY(((vlSelfRef.mem_write & 0xfeU)))) {
        Verilated::overWidthError("mem_write");
    }
    if (VL_UNLIKELY(((vlSelfRef.mem_byte & 0xfeU)))) {
        Verilated::overWidthError("mem_byte");
    }
    if (VL_UNLIKELY(((vlSelfRef.lsu_respValid & 0xfeU)))) {
        Verilated::overWidthError("lsu_respValid");
    }
}
#endif  // VL_DEBUG
