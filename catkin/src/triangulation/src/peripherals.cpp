/*
 * based on peripherals.c from Léa Strobino
 * Author1       : Léa Strobino
 * Author2       : Michael Sausmikat
 */

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include "socal/socal.h"
#include "peripherals.h"

int32_t mem = 0;

void *h2f_lw_axi_master = NULL;

int32_t *fpga_key = NULL;
int32_t *fpga_led = NULL;

int32_t *piezo_enable = NULL, *piezo_period = NULL;
int32_t *piezo_phase_a_count = NULL, *piezo_phase_b_count = NULL;
int32_t *piezo_phase_a = NULL, *piezo_phase_b = NULL;
int32_t *rtc_base_ = NULL;
int32_t *rtc_base_set_ = NULL;


  void open_dev_mem() {
  mem = open("/dev/mem",O_RDWR|O_SYNC);
  if (mem == -1) {
    printf("[Error] Could not open \"/dev/mem\": %s\n",strerror(errno));
    exit(EXIT_FAILURE);
  }
}

  void close_dev_mem() {
  close(mem);
}

  void assert_mmap(void *ptr, const char *peripheral) {
  if (ptr == MAP_FAILED) {
    printf("[Error] %s mmap() failed: %s\n",peripheral,strerror(errno));
    close_dev_mem();
    exit(EXIT_FAILURE);
  }
}

void assert_munmap(int s, const char *peripheral) {
  if (s == -1) {
    printf("[Error] %s munmap() failed: %s\n",peripheral,strerror(errno));
    close_dev_mem();
    exit(EXIT_FAILURE);
  }
}

/*  void mmap_fpga_peripherals() {
  h2f_lw_axi_master = mmap(NULL,ALT_LWFPGASLVS_SPAN,PROT_READ|PROT_WRITE,MAP_SHARED,mem,ALT_LWFPGASLVS_BASE);
  assert_mmap(h2f_lw_axi_master,"h2f_lw_axi_master");
  fpga_key            = h2f_lw_axi_master + FPGA_KEY_BASE;
  fpga_led            = h2f_lw_axi_master + FPGA_LED_BASE;
  piezo_enable        = h2f_lw_axi_master + PIEZO_ENABLE_BASE;
  piezo_period        = h2f_lw_axi_master + PIEZO_PERIOD_BASE;
  piezo_phase_a_count = h2f_lw_axi_master + PIEZO_PHASE_A_COUNT_BASE;
  piezo_phase_b_count = h2f_lw_axi_master + PIEZO_PHASE_B_COUNT_BASE;
  piezo_phase_a       = h2f_lw_axi_master + PIEZO_PHASE_A_BASE;
  piezo_phase_b       = h2f_lw_axi_master + PIEZO_PHASE_B_BASE;
}*/

void mmap_fpga_peripherals(void *v_base) {
    fpga_led = (int32_t*)(v_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_LED_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
    fpga_key = (int32_t*)(v_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_KEY_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
    piezo_enable = (int32_t*)(v_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIEZO_ENABLE_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
    piezo_period = (int32_t*)(v_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIEZO_PERIOD_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
    piezo_phase_a_count = (int32_t*)(v_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIEZO_PHASE_A_COUNT_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
    piezo_phase_b_count = (int32_t*)(v_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIEZO_PHASE_B_COUNT_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
    piezo_phase_a = (int32_t*)(v_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIEZO_PHASE_A_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
    piezo_phase_b = (int32_t*)(v_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIEZO_PHASE_B_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
    rtc_base_ = (int32_t*)(v_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + REALTIME_CLOCK_CONTROLL_0_BASE ) & ( unsigned long)( HW_REGS_MASK )) );
}

 void munmap_fpga_peripherals() {
  //assert_munmap(munmap(h2f_lw_axi_master,ALT_LWFPGASLVS_SPAN),"h2f_lw_axi_master");
  h2f_lw_axi_master = NULL;
  fpga_key = fpga_led = NULL;
  piezo_enable = piezo_period = NULL;
  piezo_phase_a_count = piezo_phase_b_count = NULL;
  piezo_phase_a = piezo_phase_b = NULL;
}

uint8_t get_key(uint8_t key) {
  return !((alt_read_byte(fpga_key) >> key) & 0x1);
}

void set_led_status(uint8_t status) {
  alt_replbits_byte(fpga_led,1 << 7,status << 7);
}

void set_led_trap(uint8_t trap) {
  if (trap) alt_replbits_byte(fpga_led,0x7,0x8 >> trap);
  else alt_clrbits_byte(fpga_led,0x7);
}

  void init_piezo() {
  alt_write_hword(piezo_enable,0);
  alt_write_hword(piezo_period,PIEZO_PERIOD_CLK);
  alt_write_hword(piezo_phase_a_count,0);
  alt_write_hword(piezo_phase_b_count,0);
}

void set_piezo_phase(phase_register r, double phase[]) {
  double phase_mod;
  uint16_t phase_clk, i;
  for (i=0; i<PIEZO_COUNT; i++) {
    phase_mod = fmod(phase[i],2*M_PI);
    if (phase_mod < 0) phase_mod += 2*M_PI;
    phase_clk = phase_mod*PIEZO_PERIOD_CLK/(2*M_PI);
    switch (r) {
      case REGISTER_A:
        alt_write_hword(&piezo_phase_a[i],phase_clk);
        break;
      case REGISTER_B:
        alt_write_hword(&piezo_phase_b[i],phase_clk);
        break;
    }
  }
}

void set_piezo_phase_count(uint16_t n_a, uint16_t n_b) {
  alt_write_hword(piezo_phase_a_count,n_a);
  alt_write_hword(piezo_phase_b_count,n_b);
}

void set_piezo_enable(uint8_t enable) {
  alt_write_hword(piezo_enable,enable & 0x1);
}


uint32_t get_time() {
  return (alt_read_word(rtc_base_));
}

void set_time_(uint32_t data_){
  alt_write_word(rtc_base_,data_);
}
