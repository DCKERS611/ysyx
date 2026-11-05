// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vlsu__pch.h"

//============================================================
// Constructors

Vlsu::Vlsu(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vlsu__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , rst{vlSymsp->TOP.rst}
    , start{vlSymsp->TOP.start}
    , mem_read{vlSymsp->TOP.mem_read}
    , mem_write{vlSymsp->TOP.mem_write}
    , mem_byte{vlSymsp->TOP.mem_byte}
    , lsu_respValid{vlSymsp->TOP.lsu_respValid}
    , lsu_reqValid{vlSymsp->TOP.lsu_reqValid}
    , done{vlSymsp->TOP.done}
    , mem_ren{vlSymsp->TOP.mem_ren}
    , mem_wen{vlSymsp->TOP.mem_wen}
    , mem_wmask{vlSymsp->TOP.mem_wmask}
    , addr{vlSymsp->TOP.addr}
    , rs2_data{vlSymsp->TOP.rs2_data}
    , mem_rdata{vlSymsp->TOP.mem_rdata}
    , load_data{vlSymsp->TOP.load_data}
    , mem_addr{vlSymsp->TOP.mem_addr}
    , mem_wdata{vlSymsp->TOP.mem_wdata}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vlsu::Vlsu(const char* _vcname__)
    : Vlsu(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vlsu::~Vlsu() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vlsu___024root___eval_debug_assertions(Vlsu___024root* vlSelf);
#endif  // VL_DEBUG
void Vlsu___024root___eval_static(Vlsu___024root* vlSelf);
void Vlsu___024root___eval_initial(Vlsu___024root* vlSelf);
void Vlsu___024root___eval_settle(Vlsu___024root* vlSelf);
void Vlsu___024root___eval(Vlsu___024root* vlSelf);

void Vlsu::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vlsu::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vlsu___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vlsu___024root___eval_static(&(vlSymsp->TOP));
        Vlsu___024root___eval_initial(&(vlSymsp->TOP));
        Vlsu___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vlsu___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vlsu::eventsPending() { return false; }

uint64_t Vlsu::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vlsu::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vlsu___024root___eval_final(Vlsu___024root* vlSelf);

VL_ATTR_COLD void Vlsu::final() {
    contextp()->executingFinal(true);
    Vlsu___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vlsu::hierName() const { return vlSymsp->name(); }
const char* Vlsu::modelName() const { return "Vlsu"; }
unsigned Vlsu::threads() const { return 1; }
void Vlsu::prepareClone() const { contextp()->prepareClone(); }
void Vlsu::atClone() const {
    contextp()->threadPoolpOnClone();
}
