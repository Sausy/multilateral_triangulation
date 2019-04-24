/*
 * main.cpp
 * Author       : Michael Sausmikat
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ros/ros.h>
#include "piezo_ctl.hpp"
#include "fpga_interface.hpp"
#include "time_controll.hpp"
#include "time_sync.hpp"
#include <math.h>

#include <unistd.h>

using namespace std;

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
  Time time_data = {0,0,0};

  addr_base addr_base;
  piezo_ctl piezo_ctl(addr_base.virtual_base);
  rtc_ctl rtc_ctl(addr_base.rtc_base_addr);

  fpga_mode modef(addr_base.sw_base, &rtc_ctl);
  //time_sync ptp(addr_base.ptp_base, modef);

  //void (fpga_mode::*start_conversation) () = modef.fpga_mode::start_conversation;
  //void (fpga_mode::*conversation) () =  modef.fpga_mode::conversation;

  //init ros
  if (!ros::isInitialized()){
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "triangulation system");
  }
  ros::NodeHandle n;
  ros::Rate loop_rate(10);


  piezo_ctl.stop_piezo_out();

  //TODO add PTP time sync
  time_data.sys_time = 100;
  printf("set rtc to ini\n\n");
  rtc_ctl.set_time(time_data.sys_time);
  //time_sync.update_time(&time_data);

  while (1) {
    modef.start_conversation();
    modef.conversation();

    /*distance = calc_distance(rtc_ctl.US_start_time,in_time);

    printf("\ncurrent distance is %lf", distance);
    printf("\ncurrent distance is %g\n", distance);
    printf("=====================================");*/

    usleep(100000);
  }

  return 0;
}
