/*
 * fpga_interface.cpp
 * Author       : Michael Sausmikat
 */
#include <fpga_interface.hpp>
#include <assert.h>
#include <errno.h>
#include <fcntl.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <sys/mman.h>
#include <unistd.h>
#include "socal/socal.h"

addr_base::addr_base(){
  //     map the address space for all registers into user space so we can interact with them.
  //     we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span
  if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
      printf( "ERROR: could not open \"/dev/mem\"...\n" );
  }

  virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

  if( virtual_base == MAP_FAILED ) {
      printf( "ERROR: mmap() failed...\n" );
      close( fd );
  }

  #ifdef REALTIME_CLOCK_CONTROLL_0_BASE
      rtc_base_addr = (int32_t*)(virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + REALTIME_CLOCK_CONTROLL_0_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
  #else
      rtc_base_addr = nullptr;
  #endif
  #ifdef PIEZO_CONTROLLER_0_BASE
      piezo_base_addr = (int32_t*)(virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIEZO_CONTROLLER_0_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
  #else
      piezo_base_addr = nullptr;
  #endif
  #ifdef FPGA_LED_BASE
      led_base_addr = (int32_t*)(virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_LED_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
  #else
      led_base_addr = nullptr;
  #endif
  #ifdef FPGA_KEY_BASE
      key_base = (int32_t*)(virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_KEY_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
  #else
      key_base = nullptr;
  #endif
  #ifdef PTP_SIMPLE_US_0_BASE
      ptp_base = (int32_t*)(virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PTP_SIMPLE_US_0_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
  #else
      ptp_base = nullptr;
  #endif
}
