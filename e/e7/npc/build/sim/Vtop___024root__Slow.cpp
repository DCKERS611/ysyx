// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop__pch.h"

// Parameter definitions for Vtop___024root
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_wbu__DOT__u_wb_mux__DOT__NR_KEY;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_wbu__DOT__u_wb_mux__DOT__KEY_LEN;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_wbu__DOT__u_wb_mux__DOT__DATA_LEN;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__NR_KEY;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__KEY_LEN;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__DATA_LEN;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__HAS_DEFAULT;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_wbu__DOT__u_wb_mux__DOT__i0__DOT__PAIR_LEN;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_ifu__DOT__u_pc__DOT__WIDTH;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_ifu__DOT__u_pc__DOT__RESET_VAL;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_rf__DOT__ADDR_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::top__DOT__u_rf__DOT__DATA_WIDTH;


void Vtop___024root___ctor_var_reset(Vtop___024root* vlSelf);

Vtop___024root::Vtop___024root(Vtop__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vtop___024root___ctor_var_reset(this);
}

void Vtop___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vtop___024root::~Vtop___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
