#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <piezo_ctl.hpp>
#include "peripherals.h"
#include "trap.h"


piezo_ctl::piezo_ctl(void *virtual_base){
  char c[2], line[256], *cmd, *str;
  double a, angle = DEFAULT_TWIN_ANGLE, radius = DEFAULT_BOTTLE_RADIUS, velocity = DEFAULT_V;
  point_t p = {0,0,0}, q;
  uint16_t i;
  uint8_t helicity = DEFAULT_VORTEX_HELICITY, m;

  // Init signals, /dev/mem, mmap, exit function and status LED
  //init_signal();
  //open_dev_mem();
  mmap_fpga_peripherals(virtual_base);
  //atexit(cleanup);
  set_led_status(1);

  // Set STDIN non-blocking
  if ((tty = isatty(0))) fcntl(0,F_SETFL,fcntl(0,F_GETFL,0)|O_NONBLOCK);

  //init Info
  printf("multilateraltriangulation\n");
  printf("========================\n");
  printf("Frequency: %.3f kHz\n",PIEZO_FREQ/1000.0);
  printf("Phase resolution: %.3f°\n\n",360.0/PIEZO_PERIOD_CLK);

  for (i=0; i<N_PIEZO; i++) {
    piezo_xyz[i].x = 0;
    piezo_xyz[i].y = 0;
    piezo_xyz[i].z = 0;
  }
  printf("\n");

  // Init traps
  calc_twin_sig(piezo_xyz,twin_angle,twin_sig);

  // Set initial levitation point
  init_piezo();
  set_trap_twin(p,twin_angle);
  set_piezo_phase_count(0,0);
  set_piezo_enable(1);
}

void piezo_ctl::start_piezo_out() {
    set_piezo_enable(1);
}

void piezo_ctl::stop_piezo_out() {
    set_piezo_enable(0);
}


 void piezo_ctl::set_trap_twin(point_t p, double angle) {

   uint16_t i;
   double focus[N_PIEZO], phase[N_PIEZO];

   if (angle != twin_angle) {
     twin_angle = angle;
     calc_twin_sig(piezo_xyz,twin_angle,twin_sig);
   }

   calc_focus(piezo_xyz,p,focus);

   for (i=0; i<N_PIEZO; i++) phase[i] = twin_sig[i]+focus[i];
   set_piezo_phase(REGISTER_A,phase);

   set_led_trap(LED_TWIN);

 }


void piezo_ctl::cleanup() {
  set_piezo_enable(0);
  set_led_trap(0);
  set_led_status(0);
  munmap_fpga_peripherals();
  close_dev_mem();
}




void piezo_ctl::handle_signal(int sig) {

  if (!tty) exit(EXIT_SUCCESS);

  switch (sig) {
    case SIGINT:
      sigint = 1;
      break;
    case SIGTERM:
      exit(EXIT_SUCCESS);
  }

}

/*
inline void init_signal() {

  struct sigaction sa;
  sa.sa_flags = SA_RESTART;
  sigfillset(&sa.sa_mask);

  // Ignore SIGTTIN
  sa.sa_handler = SIG_IGN;
  sigaction(SIGTTIN,&sa,NULL);

  // Catch SIGINT & SIGTERM
  sa.sa_handler = handle_signal;
  sigaction(SIGINT,&sa,NULL);
  sigaction(SIGTERM,&sa,NULL);

}*/
