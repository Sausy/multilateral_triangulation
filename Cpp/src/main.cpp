/*
 * main.c
 *
 * Author       : Léa Strobino
 * Revision     : 1.0
 * Last updated : Sun, 10 Jun 2018 12:47:43 +0200
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "piezo_ctl.hpp"
#include "fpga_interface.hpp"
#include "time_controll.hpp"

#include <unistd.h>

double calc_distance (uint32_t t1, uint32_t t2){
  uint32_t buffer = 0;

  buffer = SOUND_SPEED * abs(t2 - t1);

  return buffer * DISTANCE_FACTOR;
}

int main(int argc, char *argv[]) {
  uint32_t in_time, trave_time;
  double distance;

  addr_base addr_base;
  piezo_ctl piezo_ctl(addr_base.virtual_base);
  rtc_ctl rtc_ctl(addr_base.rtc_base_addr);
  //if (tty) printf("> ");
  piezo_ctl.stop_piezo_out();

  //TODO add PTP time sync
  printf("set rtc to ini\n\n");
  rtc_ctl.set_time(100);

  while (1) {
    rtc_ctl.start_US_out();
    printf("\n\nStart signal out at: %u", rtc_ctl.US_start_time);
    usleep(200000);
    in_time=rtc_ctl.read_trigger_time();

    usleep(200000);

    rtc_ctl.stop_US_out();
    usleep(1000000);
    /*//get trigger time
    rtc_ctl.read_trigger_time();
    current_time = rtc_ctl.read_time();

    rtc_ctl.stop_US_out();
    printf("counting time: %u\n", current_time);

    distance = calc_distance(rtc_ctl.US_start_time,current_time);

    printf("\ncurrent distance is %d\n", distance);

    usleep(500000);*/
    in_time=rtc_ctl.read_trigger_time();
    printf("\ntrigger time %u", in_time);
    usleep(50000);
    in_time=rtc_ctl.read_trigger_time();
    printf("\ntrigger time %u", in_time);
    usleep(50000);

    usleep(1000000);
  }

  return 0;
}
