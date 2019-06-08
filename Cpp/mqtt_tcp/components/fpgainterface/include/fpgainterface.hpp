#pragma once

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
//#include <vector>
#include "spi_interface.hpp"
#include "GPIO_trigger.hpp"

#define BUFFER_LENGTH		1024

// -----------------------------------------------------------------------
// INCREMENT ADDRESS - starting from the given address, data will be
//						read/write to incrementing address
// NON_INCREMEMT_ADDRESS - data will read/write only to the given address
//(If data size is more than 4 bytes, the 1st four data will be overwrite
//	by the next 4 bytes , due to non-increment address
// -----------------------------------------------------------------------
#define INCREMENT_ADDRESS			1
#define NON_INCREMENT_ADDRESS		0

#define PIN_NUM_MISO 25
#define PIN_NUM_MOSI 23
#define PIN_NUM_CLK  19
#define PIN_NUM_CS   22
#define PIN_NUM_WP   -1
#define PIN_NUM_HD   -1

#define ALTERA_IDLE_CHAR 0x4a



//------ AVALON BRIDGE ----
class hardware_interface{
  public:
    hardware_interface();

    spi_interface spi_i;
    gpio_trig *gpio;


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
