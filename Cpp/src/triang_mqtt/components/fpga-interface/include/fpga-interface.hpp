#pragma once

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>


class addr_base{
  public:
    addr_base();
    int32_t *rtc_base_addr=nullptr;
    int32_t *piezo_base_addr;
    int32_t *led_base_addr;
    int32_t *key_base;
    int32_t *ptp_base;
    int32_t *sw_base;

    void *virtual_base=nullptr;

    int fd;
};

//------ AVALON BRIDGE ----
class hardware_interface{
  public:
    hardware_interface();

    addr_base *addr;// = nullptr;

    uint32_t US_start_time;

    //--SET---
    void master_reset();
    void start_time_sync(bool is_master_mode_);
    void start_US_out();
    void stop_US_out();
    void piezo_burst_out();
    void piezo_set_burst_cycles(uint32_t cycle_amont);
    void allow_input_trigger();
    void set_time(uint32_t time_data);

    //--GET--
    uint32_t getID();
    uint32_t time_sync_data();
    bool waitFlag_timeSync();
    bool rdy_to_read();
    uint32_t read_time(void);
    uint32_t read_trigger_time(void);


    //--BI--


};
