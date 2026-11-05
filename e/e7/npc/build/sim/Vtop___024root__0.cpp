// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop__pch.h"

bool Vtop___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 2> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___trigger_anySet__ico\n"); );
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

void Vtop___024root___ico_comb__TOP__2(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___ico_comb__TOP__2\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.top__DOT__u_ifu__DOT__inst_in = vlSelfRef.top__DOT__inst_in;
    vlSelfRef.top__DOT__u_ifu__DOT__inst = vlSelfRef.top__DOT__u_ifu__DOT__inst_in;
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

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 2> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vtop___024root___eval_phase__ico(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__ico\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VicoExecute;
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__ico
        vlSelfRef.__VicoTriggered[1U] = ((0xfffffffffffffffeULL 
                                          & vlSelfRef.__VicoTriggered[1U]) 
                                         | (IData)((IData)(vlSelfRef.__VicoFirstIteration)));
        vlSelfRef.__VicoTriggered[0U] = (QData)((IData)(
                                                        (((vlSelfRef.inst_in 
                                                           != vlSelfRef.__Vtrigprevexpr___TOP__inst_in__0) 
                                                          << 2U) 
                                                         | ((((IData)(vlSelfRef.rst) 
                                                              != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__rst__0)) 
                                                             << 1U) 
                                                            | ((IData)(vlSelfRef.clk) 
                                                               != (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0))))));
        vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
        vlSelfRef.__Vtrigprevexpr___TOP__rst__0 = vlSelfRef.rst;
        vlSelfRef.__Vtrigprevexpr___TOP__inst_in__0 
            = vlSelfRef.inst_in;
        if (VL_UNLIKELY(((1U & (~ (IData)(vlSelfRef.__VicoDidInit)))))) {
            vlSelfRef.__VicoDidInit = 1U;
            vlSelfRef.__VicoTriggered[0U] = (1ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (2ULL | vlSelfRef.__VicoTriggered[0U]);
            vlSelfRef.__VicoTriggered[0U] = (4ULL | vlSelfRef.__VicoTriggered[0U]);
        }
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
    }
#endif
    __VicoExecute = Vtop___024root___trigger_anySet__ico(vlSelfRef.__VicoTriggered);
    if (__VicoExecute) {
        {
            // Inlined CFunc: _eval_ico
            if ((2ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_sequent__TOP__0
                    vlSelfRef.top__DOT__rst = vlSelfRef.rst;
                }
            }
            if ((1ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_sequent__TOP__1
                    vlSelfRef.top__DOT__clk = vlSelfRef.clk;
                }
            }
            if ((1ULL & vlSelfRef.__VicoTriggered[1U])) {
                {
                    // Inlined CFunc: _ico_sequent__TOP__2
                    vlSelfRef.top__DOT__u_ifu__DOT__pc 
                        = vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__dout;
                    vlSelfRef.top__DOT__pc = vlSelfRef.top__DOT__u_ifu__DOT__pc;
                    vlSelfRef.pc = vlSelfRef.top__DOT__pc;
                    vlSelfRef.top__DOT__u_wbu__DOT__pc 
                        = vlSelfRef.top__DOT__pc;
                    vlSelfRef.top__DOT__u_wbu__DOT__pc_plus4 
                        = ((IData)(4U) + vlSelfRef.top__DOT__u_wbu__DOT__pc);
                }
            }
            if ((4ULL & vlSelfRef.__VicoTriggered[0U])) {
                {
                    // Inlined CFunc: _ico_sequent__TOP__3
                    vlSelfRef.top__DOT__inst_in = vlSelfRef.inst_in;
                }
            }
            if (((1ULL & vlSelfRef.__VicoTriggered[1U]) 
                 | (2ULL & vlSelfRef.__VicoTriggered[0U]))) {
                {
                    // Inlined CFunc: _ico_comb__TOP__0
                    vlSelfRef.top__DOT__u_ifu__DOT__rst 
                        = vlSelfRef.top__DOT__rst;
                    vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__rst 
                        = vlSelfRef.top__DOT__u_ifu__DOT__rst;
                }
            }
            if ((1ULL & (vlSelfRef.__VicoTriggered[1U] 
                         | vlSelfRef.__VicoTriggered[0U]))) {
                {
                    // Inlined CFunc: _ico_comb__TOP__1
                    vlSelfRef.top__DOT__u_rf__DOT__clk 
                        = vlSelfRef.top__DOT__clk;
                    vlSelfRef.top__DOT__u_ifu__DOT__clk 
                        = vlSelfRef.top__DOT__clk;
                    vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__clk 
                        = vlSelfRef.top__DOT__u_ifu__DOT__clk;
                }
            }
            if (((1ULL & vlSelfRef.__VicoTriggered[1U]) 
                 | (4ULL & vlSelfRef.__VicoTriggered[0U]))) {
                Vtop___024root___ico_comb__TOP__2(vlSelf);
            }
        }
    }
    return (__VicoExecute);
}

bool Vtop___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___trigger_anySet__act\n"); );
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

void Vtop___024root___nba_comb__TOP__0(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_comb__TOP__0\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
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

void Vtop___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___trigger_orInto__act_vec_vec\n"); );
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
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vtop___024root___eval_phase__act(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__act\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__act
        vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                        ((((IData)(vlSelfRef.top__DOT__u_rf__DOT__clk) 
                                                           & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__top__DOT__u_rf__DOT__clk__0))) 
                                                          << 1U) 
                                                         | ((IData)(vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__clk) 
                                                            & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__top__DOT__u_ifu__DOT__u_pc__DOT__clk__0))))));
        vlSelfRef.__Vtrigprevexpr___TOP__top__DOT__u_ifu__DOT__u_pc__DOT__clk__0 
            = vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__clk;
        vlSelfRef.__Vtrigprevexpr___TOP__top__DOT__u_rf__DOT__clk__0 
            = vlSelfRef.top__DOT__u_rf__DOT__clk;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vtop___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    return (0U);
}

void Vtop___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Vtop___024root___eval_phase__nba(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_phase__nba\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vtop___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        {
            // Inlined CFunc: _eval_nba
            if ((2ULL & vlSelfRef.__VnbaTriggered[0U])) {
                {
                    // Inlined CFunc: _nba_sequent__TOP__0
                    IData/*31:0*/ __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlyVal__top__DOT__u_rf__DOT__rf__v0;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlyVal__top__DOT__u_rf__DOT__rf__v0 = 0;
                    CData/*3:0*/ __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlyDim0__top__DOT__u_rf__DOT__rf__v0;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlyDim0__top__DOT__u_rf__DOT__rf__v0 = 0;
                    CData/*0:0*/ __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlySet__top__DOT__u_rf__DOT__rf__v0;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlySet__top__DOT__u_rf__DOT__rf__v0 = 0;
                    __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlySet__top__DOT__u_rf__DOT__rf__v0 = 0U;
                    if (vlSelfRef.top__DOT__u_rf__DOT__wen) {
                        __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlyVal__top__DOT__u_rf__DOT__rf__v0 
                            = vlSelfRef.top__DOT__u_rf__DOT__wdata;
                        __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlyDim0__top__DOT__u_rf__DOT__rf__v0 
                            = vlSelfRef.top__DOT__u_rf__DOT__waddr;
                        __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlySet__top__DOT__u_rf__DOT__rf__v0 = 1U;
                    }
                    if (__Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlySet__top__DOT__u_rf__DOT__rf__v0) {
                        vlSelfRef.top__DOT__u_rf__DOT__rf[__Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlyDim0__top__DOT__u_rf__DOT__rf__v0] 
                            = __Vinline_0__eval_nba___Vinline_0__nba_sequent__TOP__0___VdlyVal__top__DOT__u_rf__DOT__rf__v0;
                    }
                    vlSelfRef.top__DOT__u_rf__DOT__rdata2 
                        = (vlSelfRef.top__DOT__u_rf__DOT__rf
                           [vlSelfRef.top__DOT__u_rf__DOT__raddr2] 
                           & (- (IData)((0U != (IData)(vlSelfRef.top__DOT__u_rf__DOT__raddr2)))));
                    vlSelfRef.top__DOT__u_rf__DOT__rdata1 
                        = (vlSelfRef.top__DOT__u_rf__DOT__rf
                           [vlSelfRef.top__DOT__u_rf__DOT__raddr1] 
                           & (- (IData)((0U != (IData)(vlSelfRef.top__DOT__u_rf__DOT__raddr1)))));
                    vlSelfRef.top__DOT__rs2_data = vlSelfRef.top__DOT__u_rf__DOT__rdata2;
                    vlSelfRef.top__DOT__rs1_data = vlSelfRef.top__DOT__u_rf__DOT__rdata1;
                    vlSelfRef.top__DOT__u_exu__DOT__rs2_data 
                        = vlSelfRef.top__DOT__rs2_data;
                    vlSelfRef.top__DOT__u_exu__DOT__rs1_data 
                        = vlSelfRef.top__DOT__rs1_data;
                    vlSelfRef.top__DOT__u_exu__DOT__alu_out 
                        = (vlSelfRef.top__DOT__u_exu__DOT__rs1_data 
                           + vlSelfRef.top__DOT__u_exu__DOT__alu_b);
                    vlSelfRef.top__DOT__alu_out = vlSelfRef.top__DOT__u_exu__DOT__alu_out;
                    vlSelfRef.top__DOT__u_wbu__DOT__alu_out 
                        = vlSelfRef.top__DOT__alu_out;
                    vlSelfRef.top__DOT__u_wbu__DOT__jump_target 
                        = (0xfffffffeU & vlSelfRef.top__DOT__u_wbu__DOT__alu_out);
                }
            }
            if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
                {
                    // Inlined CFunc: _nba_sequent__TOP__1
                    vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__dout 
                        = ((IData)(vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__rst)
                            ? 0U : vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__din);
                    vlSelfRef.top__DOT__u_ifu__DOT__pc 
                        = vlSelfRef.top__DOT__u_ifu__DOT__u_pc__DOT__dout;
                    vlSelfRef.top__DOT__pc = vlSelfRef.top__DOT__u_ifu__DOT__pc;
                    vlSelfRef.pc = vlSelfRef.top__DOT__pc;
                    vlSelfRef.top__DOT__u_wbu__DOT__pc 
                        = vlSelfRef.top__DOT__pc;
                    vlSelfRef.top__DOT__u_wbu__DOT__pc_plus4 
                        = ((IData)(4U) + vlSelfRef.top__DOT__u_wbu__DOT__pc);
                }
            }
            if ((3ULL & vlSelfRef.__VnbaTriggered[0U])) {
                Vtop___024root___nba_comb__TOP__0(vlSelf);
            }
        }
        Vtop___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void Vtop___024root___eval(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VicoIterCount = 0U;
    vlSelfRef.__VicoFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VicoIterCount)))) {
#ifdef VL_DEBUG
            Vtop___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
#endif
            VL_FATAL_MT("vsrc/top.v", 1, "", "DIDNOTCONVERGE: Input combinational region did not converge after '--converge-limit' of 10000 tries");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        vlSelfRef.__VicoPhaseResult = Vtop___024root___eval_phase__ico(vlSelf);
        vlSelfRef.__VicoFirstIteration = 0U;
    } while (vlSelfRef.__VicoPhaseResult);
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vtop___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("vsrc/top.v", 1, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("vsrc/top.v", 1, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactPhaseResult = Vtop___024root___eval_phase__act(vlSelf);
        } while (vlSelfRef.__VactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Vtop___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void Vtop___024root___eval_debug_assertions(Vtop___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_debug_assertions\n"); );
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
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
