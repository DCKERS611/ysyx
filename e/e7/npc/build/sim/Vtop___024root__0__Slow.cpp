// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop__pch.h"

VL_ATTR_COLD void Vtop___024root___eval_static(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_static\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
    vlSelfRef.__Vtrigprevexpr___TOP__rst__0 = vlSelfRef.rst;
    vlSelfRef.__Vtrigprevexpr___TOP__inst_in__0 = vlSelfRef.inst_in;
    vlSelfRef.__Vtrigprevexpr___TOP__top__DOT__u_ifu__DOT__u_pc__DOT__clk__0 
        = vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__top__DOT__u_rf__DOT__clk__0 
        = vlSelfRef.top__DOT__u_rf__DOT__clk;
}

VL_ATTR_COLD void Vtop___024root___eval_initial(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_initial\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    {
        // Inlined CFunc: _eval_initial__TOP
        vlSelfRef.top__DOT__u_wbu__DOT__load_data = 0U;
        vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__default_out = 0U;
        vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__wen = 1U;
        vlSelfRef.top__DOT__u_exu__DOT__alu_src = 1U;
        vlSelfRef.top__DOT__alu_src = 1U;
        vlSelfRef.top__DOT__u_idu__DOT__alu_src = 1U;
    }
}

VL_ATTR_COLD void Vtop___024root___eval_final(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_final\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vtop___024root___eval_phase__stl(Vtop___024root* vlSelf);

VL_ATTR_COLD void Vtop___024root___eval_settle(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_settle\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VstlIterCount;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vtop___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
            VL_FATAL_MT("vsrc/top.v", 1, "", "DIDNOTCONVERGE: Settle region did not converge after '--converge-limit' of 10000 tries");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        vlSelfRef.__VstlPhaseResult = Vtop___024root___eval_phase__stl(vlSelf);
        vlSelfRef.__VstlFirstIteration = 0U;
    } while (vlSelfRef.__VstlPhaseResult);
}

VL_ATTR_COLD bool Vtop___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(Vtop___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool Vtop___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___trigger_anySet__stl\n"); );
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

VL_ATTR_COLD void Vtop___024root___stl_sequent__TOP__0(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___stl_sequent__TOP__0\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.top__DOT__rst = vlSelfRef.rst;
    vlSelfRef.top__DOT__clk = vlSelfRef.clk;
    vlSelfRef.top__DOT__u_ifu__DOT__pc = vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__dout;
    vlSelfRef.top__DOT__inst_in = vlSelfRef.inst_in;
    vlSelfRef.top__DOT__u_ifu__DOT__rst = vlSelfRef.top__DOT__rst;
    vlSelfRef.top__DOT__u_rf__DOT__clk = vlSelfRef.top__DOT__clk;
    vlSelfRef.top__DOT__u_ifu__DOT__clk = vlSelfRef.top__DOT__clk;
    vlSelfRef.top__DOT__pc = vlSelfRef.top__DOT__u_ifu__DOT__pc;
    vlSelfRef.top__DOT__u_ifu__DOT__inst_in = vlSelfRef.top__DOT__inst_in;
    vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__rst 
        = vlSelfRef.top__DOT__u_ifu__DOT__rst;
    vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__clk 
        = vlSelfRef.top__DOT__u_ifu__DOT__clk;
    vlSelfRef.pc = vlSelfRef.top__DOT__pc;
    vlSelfRef.top__DOT__u_wbu__DOT__pc = vlSelfRef.top__DOT__pc;
    vlSelfRef.top__DOT__u_ifu__DOT__inst = vlSelfRef.top__DOT__u_ifu__DOT__inst_in;
    vlSelfRef.top__DOT__u_wbu__DOT__pc_plus4 = ((IData)(4U) 
                                                + vlSelfRef.top__DOT__u_wbu__DOT__pc);
    vlSelfRef.top__DOT__inst = vlSelfRef.top__DOT__u_ifu__DOT__inst;
    vlSelfRef.top__DOT__u_idu__DOT__inst = vlSelfRef.top__DOT__inst;
    vlSelfRef.top__DOT__u_idu__DOT__rd = (0x0000000fU 
                                          & (vlSelfRef.top__DOT__u_idu__DOT__inst 
                                             >> 7U));
    vlSelfRef.top__DOT__u_idu__DOT__rs2 = (0x0000000fU 
                                           & (vlSelfRef.top__DOT__u_idu__DOT__inst 
                                              >> 0x00000014U));
    vlSelfRef.top__DOT__u_idu__DOT__funct3 = (7U & 
                                              (vlSelfRef.top__DOT__u_idu__DOT__inst 
                                               >> 0x0000000cU));
    vlSelfRef.top__DOT__u_idu__DOT__rs1 = (0x0000000fU 
                                           & (vlSelfRef.top__DOT__u_idu__DOT__inst 
                                              >> 0x0000000fU));
    vlSelfRef.top__DOT__u_idu__DOT__imm_i = (((- (IData)(
                                                         (vlSelfRef.top__DOT__u_idu__DOT__inst 
                                                          >> 0x0000001fU))) 
                                              << 0x0000000cU) 
                                             | (vlSelfRef.top__DOT__u_idu__DOT__inst 
                                                >> 0x00000014U));
    vlSelfRef.top__DOT__u_idu__DOT__imm_s = (((- (IData)(
                                                         (vlSelfRef.top__DOT__u_idu__DOT__inst 
                                                          >> 0x0000001fU))) 
                                              << 0x0000000cU) 
                                             | ((0x00000fe0U 
                                                 & (vlSelfRef.top__DOT__u_idu__DOT__inst 
                                                    >> 0x00000014U)) 
                                                | (0x0000001fU 
                                                   & (vlSelfRef.top__DOT__u_idu__DOT__inst 
                                                      >> 7U))));
    vlSelfRef.top__DOT__u_idu__DOT__imm_u = (0xfffff000U 
                                             & vlSelfRef.top__DOT__u_idu__DOT__inst);
    vlSelfRef.top__DOT__u_idu__DOT__opcode = (0x0000007fU 
                                              & vlSelfRef.top__DOT__u_idu__DOT__inst);
    vlSelfRef.top__DOT__rd = vlSelfRef.top__DOT__u_idu__DOT__rd;
    vlSelfRef.top__DOT__rs2 = vlSelfRef.top__DOT__u_idu__DOT__rs2;
    vlSelfRef.top__DOT__rs1 = vlSelfRef.top__DOT__u_idu__DOT__rs1;
    vlSelfRef.top__DOT__u_idu__DOT__is_addi = ((0x13U 
                                                == (IData)(vlSelfRef.top__DOT__u_idu__DOT__opcode)) 
                                               & (0U 
                                                  == (IData)(vlSelfRef.top__DOT__u_idu__DOT__funct3)));
    vlSelfRef.top__DOT__u_idu__DOT__is_jalr = ((0U 
                                                == (IData)(vlSelfRef.top__DOT__u_idu__DOT__funct3)) 
                                               & (0x67U 
                                                  == (IData)(vlSelfRef.top__DOT__u_idu__DOT__opcode)));
    vlSelfRef.top__DOT__u_idu__DOT__imm = ((0x37U == (IData)(vlSelfRef.top__DOT__u_idu__DOT__opcode))
                                            ? vlSelfRef.top__DOT__u_idu__DOT__imm_u
                                            : ((0x23U 
                                                == (IData)(vlSelfRef.top__DOT__u_idu__DOT__opcode))
                                                ? vlSelfRef.top__DOT__u_idu__DOT__imm_s
                                                : vlSelfRef.top__DOT__u_idu__DOT__imm_i));
    vlSelfRef.top__DOT__u_rf__DOT__waddr = vlSelfRef.top__DOT__rd;
    vlSelfRef.top__DOT__u_rf__DOT__raddr2 = vlSelfRef.top__DOT__rs2;
    vlSelfRef.top__DOT__u_rf__DOT__raddr1 = vlSelfRef.top__DOT__rs1;
    vlSelfRef.top__DOT__u_idu__DOT__pc_sel = vlSelfRef.top__DOT__u_idu__DOT__is_jalr;
    vlSelfRef.top__DOT__u_idu__DOT__illegal = (1U & 
                                               ((0U 
                                                 != 
                                                 (0x00080800U 
                                                  & vlSelfRef.top__DOT__u_idu__DOT__inst)) 
                                                | (~ 
                                                   ((IData)(vlSelfRef.top__DOT__u_idu__DOT__is_addi) 
                                                    | (IData)(vlSelfRef.top__DOT__u_idu__DOT__is_jalr)))));
    vlSelfRef.top__DOT__u_idu__DOT__wb_sel = (3U & 
                                              (- (IData)((IData)(vlSelfRef.top__DOT__u_idu__DOT__is_jalr))));
    vlSelfRef.top__DOT__imm = vlSelfRef.top__DOT__u_idu__DOT__imm;
    vlSelfRef.top__DOT__u_rf__DOT__rdata2 = (vlSelfRef.top__DOT__u_rf__DOT__rf
                                             [vlSelfRef.top__DOT__u_rf__DOT__raddr2] 
                                             & (- (IData)(
                                                          (0U 
                                                           != (IData)(vlSelfRef.top__DOT__u_rf__DOT__raddr2)))));
    vlSelfRef.top__DOT__u_rf__DOT__rdata1 = (vlSelfRef.top__DOT__u_rf__DOT__rf
                                             [vlSelfRef.top__DOT__u_rf__DOT__raddr1] 
                                             & (- (IData)(
                                                          (0U 
                                                           != (IData)(vlSelfRef.top__DOT__u_rf__DOT__raddr1)))));
    vlSelfRef.top__DOT__pc_sel = vlSelfRef.top__DOT__u_idu__DOT__pc_sel;
    vlSelfRef.top__DOT__illegal = vlSelfRef.top__DOT__u_idu__DOT__illegal;
    vlSelfRef.top__DOT__u_idu__DOT__wen = (1U & (~ (IData)(vlSelfRef.top__DOT__u_idu__DOT__illegal)));
    vlSelfRef.top__DOT__wb_sel = vlSelfRef.top__DOT__u_idu__DOT__wb_sel;
    vlSelfRef.top__DOT__u_wbu__DOT__imm = vlSelfRef.top__DOT__imm;
    vlSelfRef.top__DOT__u_exu__DOT__imm = vlSelfRef.top__DOT__imm;
    vlSelfRef.top__DOT__rs2_data = vlSelfRef.top__DOT__u_rf__DOT__rdata2;
    vlSelfRef.top__DOT__rs1_data = vlSelfRef.top__DOT__u_rf__DOT__rdata1;
    vlSelfRef.top__DOT__u_wbu__DOT__pc_sel = vlSelfRef.top__DOT__pc_sel;
    vlSelfRef.illegal = vlSelfRef.top__DOT__illegal;
    vlSelfRef.top__DOT__wen = vlSelfRef.top__DOT__u_idu__DOT__wen;
    vlSelfRef.top__DOT__u_wbu__DOT__wb_sel = vlSelfRef.top__DOT__wb_sel;
    vlSelfRef.top__DOT__u_exu__DOT__alu_b = vlSelfRef.top__DOT__u_exu__DOT__imm;
    vlSelfRef.top__DOT__u_exu__DOT__rs2_data = vlSelfRef.top__DOT__rs2_data;
    vlSelfRef.top__DOT__u_exu__DOT__rs1_data = vlSelfRef.top__DOT__rs1_data;
    vlSelfRef.top__DOT__u_rf__DOT__wen_in = vlSelfRef.top__DOT__wen;
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__key 
        = vlSelfRef.top__DOT__u_wbu__DOT__wb_sel;
    vlSelfRef.top__DOT__u_exu__DOT__alu_out = (vlSelfRef.top__DOT__u_exu__DOT__rs1_data 
                                               + vlSelfRef.top__DOT__u_exu__DOT__alu_b);
    vlSelfRef.top__DOT__u_rf__DOT__wen = ((IData)(vlSelfRef.top__DOT__u_rf__DOT__wen_in) 
                                          & (0U != (IData)(vlSelfRef.top__DOT__u_rf__DOT__waddr)));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key 
        = vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__key;
    vlSelfRef.top__DOT__alu_out = vlSelfRef.top__DOT__u_exu__DOT__alu_out;
    vlSelfRef.top__DOT__u_wbu__DOT__alu_out = vlSelfRef.top__DOT__alu_out;
    vlSelfRef.top__DOT__u_wbu__DOT__jump_target = (0xfffffffeU 
                                                   & vlSelfRef.top__DOT__u_wbu__DOT__alu_out);
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[0U] 
        = (IData)((0x0000000300000000ULL | (QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__pc_plus4))));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[1U] 
        = ((vlSelfRef.top__DOT__u_wbu__DOT__imm << 2U) 
           | (IData)(((0x0000000300000000ULL | (QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__pc_plus4))) 
                      >> 0x00000020U)));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[2U] 
        = (8U | (vlSelfRef.top__DOT__u_wbu__DOT__imm 
                 >> 0x0000001eU));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[3U] 
        = (0x00000010U | (0xffffffc0U & vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[3U]));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[3U] 
        = ((0x0000003fU & vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[3U]) 
           | ((IData)((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__alu_out))) 
              << 6U));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[4U] 
        = (0x000000ffU & (((IData)((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__alu_out))) 
                           >> 0x0000001aU) | ((IData)(
                                                      ((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__alu_out)) 
                                                       >> 0x00000020U)) 
                                              << 6U)));
    vlSelfRef.top__DOT__u_wbu__DOT__next_pc = ((IData)(vlSelfRef.top__DOT__u_wbu__DOT__pc_sel)
                                                ? vlSelfRef.top__DOT__u_wbu__DOT__jump_target
                                                : vlSelfRef.top__DOT__u_wbu__DOT__pc_plus4);
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[0U] 
        = vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[0U];
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[1U] 
        = vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[1U];
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[2U] 
        = vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[2U];
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[3U] 
        = vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[3U];
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[4U] 
        = vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut[4U];
    vlSelfRef.top__DOT__next_pc = vlSelfRef.top__DOT__u_wbu__DOT__next_pc;
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[0U] 
        = (0x00000003ffffffffULL & (((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[1U])) 
                                     << 0x00000020U) 
                                    | (QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[0U]))));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[1U] 
        = (0x00000003ffffffffULL & (((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[2U])) 
                                     << 0x0000001eU) 
                                    | ((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[1U])) 
                                       >> 2U)));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[2U] 
        = (0x00000003ffffffffULL & (((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[3U])) 
                                     << 0x0000001cU) 
                                    | ((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[2U])) 
                                       >> 4U)));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[3U] 
        = (0x00000003ffffffffULL & (((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[4U])) 
                                     << 0x0000001aU) 
                                    | ((QData)((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut[3U])) 
                                       >> 6U)));
    vlSelfRef.top__DOT__u_ifu__DOT__next_pc = vlSelfRef.top__DOT__next_pc;
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__data_list[0U] 
        = (IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[0U]);
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__data_list[1U] 
        = (IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[1U]);
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__data_list[2U] 
        = (IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[2U]);
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__data_list[3U] 
        = (IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[3U]);
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key_list[0U] 
        = (3U & (IData)((vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[0U] 
                         >> 0x00000020U)));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key_list[1U] 
        = (3U & (IData)((vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[1U] 
                         >> 0x00000020U)));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key_list[2U] 
        = (3U & (IData)((vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[2U] 
                         >> 0x00000020U)));
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key_list[3U] 
        = (3U & (IData)((vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[3U] 
                         >> 0x00000020U)));
    vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__din 
        = vlSelfRef.top__DOT__u_ifu__DOT__next_pc;
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut_out = 0U;
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__hit = 0U;
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i = 0U;
    while (VL_GTS_III(32, 4U, vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i)) {
        vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut_out 
            = (vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut_out 
               | ((- (IData)(((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key) 
                              == vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key_list
                              [(3U & vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i)]))) 
                  & vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__data_list
                  [(3U & vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i)]));
        vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__hit 
            = ((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__hit) 
               | ((IData)(vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key) 
                  == vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key_list
                  [(3U & vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i)]));
        vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i 
            = ((IData)(1U) + vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i);
    }
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__out 
        = vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut_out;
    vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__out 
        = vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__out;
    vlSelfRef.top__DOT__u_wbu__DOT__wdata = vlSelfRef.top__DOT__u_wbu__DOT__u_wb_mux__DOT__out;
    vlSelfRef.top__DOT__wdata = vlSelfRef.top__DOT__u_wbu__DOT__wdata;
    vlSelfRef.top__DOT__u_rf__DOT__wdata = vlSelfRef.top__DOT__wdata;
}

VL_ATTR_COLD bool Vtop___024root___eval_phase__stl(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__stl\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
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
        Vtop___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
    __VstlExecute = Vtop___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        {
            // Inlined CFunc: _eval_stl
            if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
                Vtop___024root___stl_sequent__TOP__0(vlSelf);
            }
        }
    }
    return (__VstlExecute);
}

bool Vtop___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 2> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 2> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(Vtop___024root___trigger_anySet__ico(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @( clk)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 1U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 1 is active: @( rst)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 2U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 2 is active: @( inst_in)\n");
    }
    if ((1U & (IData)(triggers[1U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 64 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

bool Vtop___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Vtop___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @(posedge top.u_ifu.u_pc.clk)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 1U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 1 is active: @(posedge top.u_rf.clk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vtop___024root___ctor_var_reset(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___ctor_var_reset\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16707436170211756652ull);
    vlSelf->rst = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18209466448985614591ull);
    vlSelf->inst_in = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15544804360470151695ull);
    vlSelf->pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4211327832146562899ull);
    vlSelf->illegal = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14027783744025561445ull);
    vlSelf->top__DOT__clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17741742976451700217ull);
    vlSelf->top__DOT__rst = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9570330383657782965ull);
    vlSelf->top__DOT__inst_in = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 521644861230971000ull);
    vlSelf->top__DOT__pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8764853023528993103ull);
    vlSelf->top__DOT__illegal = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 55765482526416605ull);
    vlSelf->top__DOT__next_pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5748649115500010960ull);
    vlSelf->top__DOT__inst = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4033626345969658743ull);
    vlSelf->top__DOT__rd = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 3328450216708286131ull);
    vlSelf->top__DOT__rs1 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13712195198600804357ull);
    vlSelf->top__DOT__rs2 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4635751753440128890ull);
    vlSelf->top__DOT__imm = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 18445623346312568628ull);
    vlSelf->top__DOT__wen = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5718604826377190525ull);
    vlSelf->top__DOT__alu_src = 1U;
    ;
    vlSelf->top__DOT__wb_sel = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 2796855917807905036ull);
    vlSelf->top__DOT__pc_sel = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8758113527376418720ull);
    vlSelf->top__DOT__alu_out = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13228210308208510599ull);
    vlSelf->top__DOT__wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11938134829075462375ull);
    vlSelf->top__DOT__rs1_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 595039983895368829ull);
    vlSelf->top__DOT__rs2_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12555395350430748387ull);
    vlSelf->top__DOT__u_wbu__DOT__alu_out = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12734670175511805696ull);
    vlSelf->top__DOT__u_wbu__DOT__load_data = 0U;
    ;
    vlSelf->top__DOT__u_wbu__DOT__imm = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5086531384849874929ull);
    vlSelf->top__DOT__u_wbu__DOT__pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3913528534091260402ull);
    vlSelf->top__DOT__u_wbu__DOT__wb_sel = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 3174137908163487240ull);
    vlSelf->top__DOT__u_wbu__DOT__pc_sel = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5922377062625403202ull);
    vlSelf->top__DOT__u_wbu__DOT__wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11579145828401953699ull);
    vlSelf->top__DOT__u_wbu__DOT__next_pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2964743395023503925ull);
    vlSelf->top__DOT__u_wbu__DOT__pc_plus4 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9884382776941140639ull);
    vlSelf->top__DOT__u_wbu__DOT__jump_target = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2651258643439688521ull);
    vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__out = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10480821259978582638ull);
    vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__key = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13323745763636351886ull);
    VL_SCOPED_RAND_RESET_W(136, vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__lut, __VscopeHash, 9227381219602680588ull);
    vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__out = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7305860707866988376ull);
    vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4477551942755222368ull);
    vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__default_out = 0U;
    ;
    VL_SCOPED_RAND_RESET_W(136, vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut, __VscopeHash, 11944549850087738747ull);
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__pair_list[__Vi0] = VL_SCOPED_RAND_RESET_Q(34, __VscopeHash, 16660097936003971196ull);
    }
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__key_list[__Vi0] = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4910391564118413645ull);
    }
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__data_list[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 18376887425494954808ull);
    }
    vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__lut_out = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14878449383632478920ull);
    vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__hit = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5747711827421700058ull);
    vlSelf->top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__i = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6048204494610635712ull);
    vlSelf->top__DOT__u_ifu__DOT__clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3867313606428762895ull);
    vlSelf->top__DOT__u_ifu__DOT__rst = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3307811151339180943ull);
    vlSelf->top__DOT__u_ifu__DOT__inst_in = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7277343350405142000ull);
    vlSelf->top__DOT__u_ifu__DOT__next_pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10102485929234343962ull);
    vlSelf->top__DOT__u_ifu__DOT__pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6197392623517917179ull);
    vlSelf->top__DOT__u_ifu__DOT__inst = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15047849817493983486ull);
    vlSelf->top__DOT__u_ifu__DOT__u_pc__DOT__clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3432182198539150525ull);
    vlSelf->top__DOT__u_ifu__DOT__u_pc__DOT__rst = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10167225490081997213ull);
    vlSelf->top__DOT__u_ifu__DOT__u_pc__DOT__din = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17292280066194197084ull);
    vlSelf->top__DOT__u_ifu__DOT__u_pc__DOT__dout = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2164127971797079540ull);
    vlSelf->top__DOT__u_ifu__DOT__u_pc__DOT__wen = 1U;
    ;
    vlSelf->top__DOT__u_exu__DOT__rs1_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12143105676560872862ull);
    vlSelf->top__DOT__u_exu__DOT__rs2_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5561818497195083765ull);
    vlSelf->top__DOT__u_exu__DOT__imm = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15102824458289643275ull);
    vlSelf->top__DOT__u_exu__DOT__alu_src = 1U;
    ;
    vlSelf->top__DOT__u_exu__DOT__alu_out = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14773549438333267806ull);
    vlSelf->top__DOT__u_exu__DOT__alu_b = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16702688704184122927ull);
    vlSelf->top__DOT__u_rf__DOT__clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17013750904286960774ull);
    vlSelf->top__DOT__u_rf__DOT__wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13230910645650994674ull);
    vlSelf->top__DOT__u_rf__DOT__waddr = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 10291717554364868989ull);
    vlSelf->top__DOT__u_rf__DOT__wen_in = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15330186647488248607ull);
    vlSelf->top__DOT__u_rf__DOT__raddr1 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 6518438957719028473ull);
    vlSelf->top__DOT__u_rf__DOT__raddr2 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4150102245348930795ull);
    vlSelf->top__DOT__u_rf__DOT__rdata1 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6725319480330848245ull);
    vlSelf->top__DOT__u_rf__DOT__rdata2 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4551491643021380649ull);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->top__DOT__u_rf__DOT__rf[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7285423838718180806ull);
    }
    vlSelf->top__DOT__u_rf__DOT__wen = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13293172246033056738ull);
    vlSelf->top__DOT__u_idu__DOT__inst = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8058105158993619481ull);
    vlSelf->top__DOT__u_idu__DOT__rd = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 17245629261415544078ull);
    vlSelf->top__DOT__u_idu__DOT__rs1 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 14269931098858135317ull);
    vlSelf->top__DOT__u_idu__DOT__rs2 = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 1786130172137837275ull);
    vlSelf->top__DOT__u_idu__DOT__imm = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4728651849826536423ull);
    vlSelf->top__DOT__u_idu__DOT__wen = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6754204727929514111ull);
    vlSelf->top__DOT__u_idu__DOT__alu_src = 1U;
    ;
    vlSelf->top__DOT__u_idu__DOT__wb_sel = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 812587734204945243ull);
    vlSelf->top__DOT__u_idu__DOT__pc_sel = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15860102862101013751ull);
    vlSelf->top__DOT__u_idu__DOT__illegal = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6074768383798955715ull);
    vlSelf->top__DOT__u_idu__DOT__opcode = VL_SCOPED_RAND_RESET_I(7, __VscopeHash, 5639915224422076529ull);
    vlSelf->top__DOT__u_idu__DOT__funct3 = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 12400278710304774854ull);
    vlSelf->top__DOT__u_idu__DOT__imm_i = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 922370248847877465ull);
    vlSelf->top__DOT__u_idu__DOT__imm_s = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16689872276802658920ull);
    vlSelf->top__DOT__u_idu__DOT__imm_u = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5150691316337946093ull);
    vlSelf->top__DOT__u_idu__DOT__is_addi = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 884335076837943286ull);
    vlSelf->top__DOT__u_idu__DOT__is_jalr = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9672577560297645510ull);
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VstlTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->__VicoTriggered[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__clk__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__rst__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__inst_in__0 = 0;
    vlSelf->__VicoDidInit = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__top__DOT__u_ifu__DOT__u_pc__DOT__clk__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__top__DOT__u_rf__DOT__clk__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
}
