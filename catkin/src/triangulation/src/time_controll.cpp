#include <time_controll.hpp>
#include <stdio.h>

rtc_ctl::rtc_ctl(int32_t *base_addr_){
  rtc_base=base_addr_;
  US_start_time=0;
}

uint32_t rtc_ctl::read_time(void) {
    return (IORD(rtc_base, (uint32_t)(0x00<<8|0)));
}
uint32_t rtc_ctl::read_trigger_time(void) {
    return (IORD(rtc_base, (uint32_t)(0x01<<8|0)));
}
bool rtc_ctl::rdy_to_read(void) {
    return (bool)(IORD(rtc_base, (uint32_t)(0x03<<8|0)));
}

void rtc_ctl::set_time(uint32_t time_data) {
    IOWR(rtc_base, (uint32_t)(0x00<<8|0), time_data);
}

//piezo out sync functions
void rtc_ctl::start_US_out() {
    IOWR(rtc_base, (uint32_t)(0x03<<8|0), 0xff);
    US_start_time = IORD(rtc_base, (uint32_t)(0x02<<8|0));
}

void rtc_ctl::piezo_set_burst_cycles(uint32_t cycle_amont) {
    IOWR(rtc_base, (uint32_t)(0x04<<8|0), cycle_amont*BURSTCYCLE_OFFSET);
}
void rtc_ctl::piezo_burst_out() {
    IOWR(rtc_base, (uint32_t)(0x05<<8|0), 0xff);
    US_start_time = IORD(rtc_base, (uint32_t)(0x02<<8|0));
}


void rtc_ctl::stop_US_out() {
    IOWR(rtc_base, (uint32_t)(0x03<<8|0), 0x00);
}

//piezo in sync functions
void rtc_ctl::allow_input_trigger() {
    IOWR(rtc_base, (uint32_t)(0x02<<8|0), 0x01);
}
