/*
 * main.cpp
 * Author       : Michael Sausmikat
 */

 /*
TODO List;
Also der distance berechner wird nicht auf den fpgas laufen sondern auf dem raspberry
D.H.>
*) es wird eine Ros Msg gepublished die den aktuellen mode jeder id beinhaltet
 und die reihenfolge welche id zum master wird. (die msg dafuer ist inst master_list)

*)PTP time sync in quartus noch so erweitern
das die system clock cnt syncronisiert wird

*)time_sync muss noch ein Warteflag hinzu gefuegt werden
 sowie add in quartus read enable flag to wait till ptp conv is finished


 *) Ueberpruefen ob der hdl code von ptp passt, denn bei der simulation
 gab es unterschiede zwischen master und slave sync um 2 cyclen


 *) start_US_out sollte ohne stop_US_out funktionieren d.h.: hdl code abaendern
    das max 4Takte das Signal uebertragen werden


 Ueberarbeitung des ablauf schematas
 Master sendet impuls; und pushed die master time auf ros setzt sich
 daraufhin als master

 ros published die reihenfolge der Folgenden Masters
 (solte sich eventuell dauerhaft random aendern)
 ein slave der zum master wird wartet auf empfangs impuls, published auf ros
 und setzt sich zum master

 (dieser ablauf sollte zunaechst noch auf dem ARM core umgesetzt werden nich auf der FPGA)


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


  buffer = SOUND_SPEED * div_time;
  return(DISTANCE_FACTOR * buffer);
}

int main(int argc, char *argv[]) {
  uint32_t in_time, trave_time;
  double distance;

  addr_base addr_base;

  piezo_ctl piezo_ctl(addr_base.virtual_base);
  rtc_ctl rtc_ctl(addr_base.rtc_base_addr);
  fpga_mode modef(addr_base.sw_base, &rtc_ctl);
  time_sync ptp(addr_base.ptp_base, modef.id);  //todo

  //void (fpga_mode::*start_conversation) () = modef.fpga_mode::start_conversation;
  //void (fpga_mode::*conversation) () =  modef.fpga_mode::conversation;

  //init ros
  if (!ros::isInitialized()){
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "triangulation system" + std::to_string(modef.id));
  }
  ros::NodeHandle n;
  ros::Rate loop_rate(10);


  piezo_ctl.stop_piezo_out();

  //init time should be given via ntp ...
  ptp.time_data.sys_time = 100;
  printf("set rtc to ini\n\n");
  rtc_ctl.set_time(ptp.time_data.sys_time);

  cout << "\n\n=====================================";
  cout << "\n\n  start loop";
  cout << "\n\n=====================================";

  while (1) {
    modef.start_conversation(); //only does something if master changes
    modef.conversation();

    //ros tells the master to ptp sync
    if(modef.sync_enable){
      modef.sync_enable = false;
      ptp.update_time(modef.id == MASTER);
    }
    cout << "\nCurrentSysTime: " << ptp.time_data.sys_time;
    cout << "\nCurrentClkCycleCntTime: " << ptp.time_data.cycle_cnt;
    cout << "\nCurrentSyncDivTime: " << ptp.time_data.sync_time_div;
    /*distance = calc_distance(rtc_ctl.US_start_time,in_time);

    printf("\ncurrent distance is %lf", distance);
    printf("\ncurrent distance is %g\n", distance);
    printf("=====================================");*/

    usleep(100000);
  }

  return 0;
}
