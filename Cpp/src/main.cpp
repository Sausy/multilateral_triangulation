/*
 * main.cpp
 * Author       : Michael Sausmikat
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "piezo_ctl.hpp"
#include "fpga_interface.hpp"
#include "time_controll.hpp"
#include <math.h>

#include <unistd.h>

double calc_distance (uint32_t t1, uint32_t t2){
  uint32_t buffer = 0;
  uint32_t div_time = abs(t2 - t1);
  double ret;

  ret = 1. / 50000000.;
  buffer = SOUND_SPEED * div_time;
  ret *= buffer;

  return ret;
}

int main(int argc, char *argv[]) {
  uint32_t in_time, trave_time;
  double distance;

  addr_base addr_base;
  piezo_ctl piezo_ctl(addr_base.virtual_base);
  rtc_ctl rtc_ctl(addr_base.rtc_base_addr);
  //time_sync ptp(addr_base.ptp_base);


  //if (tty) printf("> ");
  piezo_ctl.stop_piezo_out();

  //TODO add PTP time sync
  printf("set rtc to ini\n\n");
  rtc_ctl.set_time(100);

  while (1) {

    rtc_ctl.allow_input_trigger(); //final waere das nur bei input slave ueber ein network event
    rtc_ctl.start_US_out(); //out of current output master !! has to trigger network broadcast that input trigger is allowed and wait for response
    usleep(100);

    printf("\n\nStart signal out at: %u", rtc_ctl.US_start_time);
    //in_time=rtc_ctl.read_trigger_time();
    //printf("\ntrigger time %u", in_time);
    usleep(10000);
    in_time=rtc_ctl.read_trigger_time();
    printf("\ntrigger time %u", in_time);
    rtc_ctl.stop_US_out();
    usleep(10000);
    /*//get trigger time
    rtc_ctl.read_trigger_time();
    current_time = rtc_ctl.read_time();

    rtc_ctl.stop_US_out();
    printf("counting time: %u\n", current_time);
    */
    distance = calc_distance(rtc_ctl.US_start_time,in_time);

    printf("\ncurrent distance is %lf", distance);
    printf("\ncurrent distance is %g\n", distance);
    printf("=====================================");

    usleep(100000);
  }

  return 0;
}
