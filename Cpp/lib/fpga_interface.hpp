#pragma once

#include <stdint.h>
#include "socal/hps.h"
#include "soc_system.h"

#define ALT_LWFPGASLVS_OFST 0xFF200000
#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

class addr_base{
  public:
    addr_base();
    int32_t *rtc_base_addr=nullptr;
    int32_t *piezo_base_addr;
    int32_t *led_base_addr;
    int32_t *key_base;

    void *virtual_base=nullptr;

    int fd;
};
