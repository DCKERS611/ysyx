// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vscpu.h for the primary calling header

#include "Vscpu__pch.h"

void Vscpu___024root___ctor_var_reset(Vscpu___024root* vlSelf);

Vscpu___024root::Vscpu___024root(Vscpu__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vscpu___024root___ctor_var_reset(this);
}

void Vscpu___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vscpu___024root::~Vscpu___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
