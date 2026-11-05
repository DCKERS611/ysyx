// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VLSU__SYMS_H_
#define VERILATED_VLSU__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vlsu.h"

// INCLUDE MODULE CLASSES
#include "Vlsu___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vlsu__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vlsu* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vlsu___024root                 TOP;

    // CONSTRUCTORS
    Vlsu__Syms(VerilatedContext* contextp, const char* namep, Vlsu* modelp);
    ~Vlsu__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
