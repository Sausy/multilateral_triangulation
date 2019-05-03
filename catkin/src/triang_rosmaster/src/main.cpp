#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ros/ros.h>
#include <math.h>

#include "common.hpp"

#include <unistd.h>

using namespace std;

int main(int argc, char *argv[]) {

  if (!ros::isInitialized()){
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "triangulation system GRAND MASTER");
  }
  ros::NodeHandle n;
  ros::Rate loop_rate(10);

  menu menu;

  char input_key = 0;
  while(input_key!=27){
    menu.options_menu(menu.select());


  }

  return 0;
}
