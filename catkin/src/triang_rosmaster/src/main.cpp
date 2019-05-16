#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ros/ros.h>
#include <math.h>

#include "menu.hpp"
#include "master_gen.hpp"
#include "common.hpp"

#include <curses.h>

#include <unistd.h>

using namespace std;

int main(int argc, char *argv[]) {

  if (!ros::isInitialized()){
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "triangulation_system_GRAND_MASTER");
  }
  ros::NodeHandle n;
  ros::Rate loop_rate(10);

  menu menu;
  master_gen masterctl(3);

  char input_key = 0;
  while(input_key!=27){
    //menu.options_menu(menu.select());
    //input_key = getch();
    cin >> input_key;
    cout << input_key;
    switch (input_key){
      case '1':
        break;
      case '2':
        //activate burst
        cout<<"\nactivate burst mode";
        masterctl.start_burst_mode();
        break;
      case '3':
        //start ptp sync
        cout<<"\nstart ptp sync";
        masterctl.time_sync_tgl(true);
        break;
      case '4':
          //start ptp sync
          cout<<"\nstart continouse mode";
          masterctl.tgl_continiouse_mode();
          break;
      default:
        break;
    }


  }

  return 0;
}
