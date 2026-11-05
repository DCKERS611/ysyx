// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VSCPU__SYMS_H_
#define VERILATED_VSCPU__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vscpu.h"

// INCLUDE MODULE CLASSES
#include "Vscpu___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vscpu__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vscpu* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vscpu___024root                TOP;

    // CONSTRUCTORS
    Vscpu__Syms(VerilatedContext* contextp, const char* namep, Vscpu* modelp);
    ~Vscpu__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
