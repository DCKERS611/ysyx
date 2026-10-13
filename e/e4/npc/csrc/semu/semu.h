#pragma once
#include <cstdint>

struct CPUState {
    uint8_t pc = 0;
    uint8_t r[4] = {};
    uint8_t led = 0;
};

class SEMU {
    public:
        void reset();
        void step();
        const CPUState& get_state() const;

    private:
        CPUState state;
};
