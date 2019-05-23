/*
 * based on peripherals.c from Léa Strobino
 * Author1       : Léa Strobino
 * Author2       : Michael Sausmikat
 */


#include <de0.hpp>


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
  #ifdef ID_SWITCH_0_BASE
      sw_base = (int32_t*)(virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + ID_SWITCH_0_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
  #else
      sw_base = nullptr;
  #endif
}


hardware_interface::hardware_interface(){
  //rtc_base=base_addr_;
  US_start_time=0;
  addr = new addr_base();
}

uint32_t hardware_interface::read_time(void) {
    return (IORD(addr->rtc_base_addr, (uint32_t)(0x00<<8|0)));
}
uint32_t hardware_interface::read_trigger_time(void) {
    return (IORD(addr->rtc_base_addr, (uint32_t)(0x01<<8|0)));
}
bool hardware_interface::rdy_to_read(void) {
    return (bool)(IORD(addr->rtc_base_addr, (uint32_t)(0x03<<8|0)));
}

void hardware_interface::set_time(uint32_t time_data) {
    IOWR(addr->rtc_base_addr, (uint32_t)(0x00<<8|0), time_data);
}

//piezo out sync functions
void hardware_interface::start_US_out() {
    IOWR(addr->rtc_base_addr, (uint32_t)(0x03<<8|0), 0xff);
    US_start_time = IORD(addr->rtc_base_addr, (uint32_t)(0x02<<8|0));
}

void hardware_interface::piezo_set_burst_cycles(uint32_t cycle_amont) {
    IOWR(addr->rtc_base_addr, (uint32_t)(0x04<<8|0), cycle_amont*BURSTCYCLE_OFFSET);
}
void hardware_interface::piezo_burst_out() {
    IOWR(addr->rtc_base_addr, (uint32_t)(0x05<<8|0), 0xff);
    US_start_time = IORD(addr->rtc_base_addr, (uint32_t)(0x02<<8|0));
}


void hardware_interface::stop_US_out() {
    IOWR(addr->rtc_base_addr, (uint32_t)(0x03<<8|0), 0x00);
}

//piezo in sync functions
void hardware_interface::allow_input_trigger() {
    IOWR(addr->rtc_base_addr, (uint32_t)(0x02<<8|0), 0x01);
}

//===================================================
//      HW switch
//===================================================
uint32_t hardware_interface::getID(){
  return (uint8_t)(IORD(addr->sw_base, (uint32_t)(0x00<<8|0)));
}

//===================================================
//      PTP Time Sync
//===================================================
void hardware_interface::master_reset(){
  IOWR(addr->ptp_base, (uint32_t)(0x02<<8|0), 1);
  IOWR(addr->ptp_base, (uint32_t)(0x04<<8|0), 0);
}
void hardware_interface::start_time_sync(bool is_master_mode_){
  uint8_t interface_buffer = ((is_master_mode_ << 1)|(1))& 0xff;

  IOWR(addr->ptp_base, (uint32_t)(0x03<<8|0), interface_buffer);
}

bool hardware_interface::waitFlag_timeSync(){
  return(IORD(addr->ptp_base, (uint32_t)((0x02<< 8)|0)));
}
uint32_t hardware_interface::time_sync_data(){
  uint32_t ret = 0;
  ret = IORD(addr->ptp_base, (uint32_t)((0x00<< 8)|0));
  ret = IORD(addr->ptp_base, (uint32_t)((0x01<< 8)|0));
  return ret;
}
