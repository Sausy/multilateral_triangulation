#pragma once

#include <stdint.h>
#include "config.hpp"

#ifndef IORD
  #define IORD(base, reg) (*(((volatile int32_t*)base)+reg))
#endif
#ifndef IOWR
  #define IOWR(base, reg, data) (*(((volatile int32_t*)base)+reg)=data)
#endif

class rtc_ctl
{
  public:
    rtc_ctl(int32_t *base_addr_ = nullptr);

    uint32_t read_time(void);
    uint32_t read_trigger_time(void);
    void set_time(uint32_t time_data);

    void start_US_out();
    void stop_US_out();
    void piezo_burst_out(uint32_t cycle_amont);
    void piezo_set_burst_cycles();

    uint32_t US_start_time;

    void get_master_time();
    void get_slave_time();

    void allow_input_trigger();

    bool rdy_to_read();


  private:
    int32_t *rtc_base;
};
