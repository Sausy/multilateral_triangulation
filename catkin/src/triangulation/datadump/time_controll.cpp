#include <time_controll.hpp>
#include <stdio.h>

/*
hw::hw(int32_t *base_addr_){
  rtc_base=base_addr_;
  US_start_time=0;
}

uint32_t hw::read_time(void) {
    return (IORD(rtc_base, (uint32_t)(0x00<<8|0)));
}
uint32_t hw::read_trigger_time(void) {
    return (IORD(rtc_base, (uint32_t)(0x01<<8|0)));
}
bool hw::rdy_to_read(void) {
    return (bool)(IORD(rtc_base, (uint32_t)(0x03<<8|0)));
}

void hw::set_time(uint32_t time_data) {
    IOWR(rtc_base, (uint32_t)(0x00<<8|0), time_data);
}

//piezo out sync functions
void hw::start_US_out() {
    IOWR(rtc_base, (uint32_t)(0x03<<8|0), 0xff);
    US_start_time = IORD(rtc_base, (uint32_t)(0x02<<8|0));
}

void hw::piezo_set_burst_cycles(uint32_t cycle_amont) {
    IOWR(rtc_base, (uint32_t)(0x04<<8|0), cycle_amont*BURSTCYCLE_OFFSET);
}
void hw::piezo_burst_out() {
    IOWR(rtc_base, (uint32_t)(0x05<<8|0), 0xff);
    US_start_time = IORD(rtc_base, (uint32_t)(0x02<<8|0));
}


void hw::stop_US_out() {
    IOWR(rtc_base, (uint32_t)(0x03<<8|0), 0x00);
}

//piezo in sync functions
void hw::allow_input_trigger() {
    IOWR(rtc_base, (uint32_t)(0x02<<8|0), 0x01);
}
*/
