// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vscpu__pch.h"

//============================================================
// Constructors

Vscpu::Vscpu(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vscpu__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , rst{vlSymsp->TOP.rst}
    , pc{vlSymsp->TOP.pc}
    , inst{vlSymsp->TOP.inst}
    , led{vlSymsp->TOP.led}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vscpu::Vscpu(const char* _vcname__)
    : Vscpu(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vscpu::~Vscpu() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vscpu___024root___eval_debug_assertions(Vscpu___024root* vlSelf);
#endif  // VL_DEBUG
void Vscpu___024root___eval_static(Vscpu___024root* vlSelf);
void Vscpu___024root___eval_initial(Vscpu___024root* vlSelf);
void Vscpu___024root___eval_settle(Vscpu___024root* vlSelf);
void Vscpu___024root___eval(Vscpu___024root* vlSelf);

void Vscpu::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vscpu::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vscpu___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vscpu___024root___eval_static(&(vlSymsp->TOP));
        Vscpu___024root___eval_initial(&(vlSymsp->TOP));
        Vscpu___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vscpu___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vscpu::eventsPending() { return false; }

uint64_t Vscpu::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vscpu::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vscpu___024root___eval_final(Vscpu___024root* vlSelf);

VL_ATTR_COLD void Vscpu::final() {
    contextp()->executingFinal(true);
    Vscpu___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vscpu::hierName() const { return vlSymsp->name(); }
const char* Vscpu::modelName() const { return "Vscpu"; }
unsigned Vscpu::threads() const { return 1; }
void Vscpu::prepareClone() const { contextp()->prepareClone(); }
void Vscpu::atClone() const {
    contextp()->threadPoolpOnClone();
}
