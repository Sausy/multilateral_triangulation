#ifndef MASTER_LIST_HPP_
#define MASTER_LIST_HPP_

#include <ros/ros.h>
#include <stdint.h>
#include <stdio.h>
#include <vector>
#include "time_controll.hpp"
#include <triangulation_msg/mode_msg.h>
#include <triangulation_msg/system_ctl.h>
#include <triangulation_msg/time_msg.h>
#include <triangulation_msg/time_sync_msg.h>
#include <triangulation_msg/master_list.h>

#define MASTER_LIST_SIZE 20

class master_list{
  public:
    master_list(uint8_t member_amount = 2);
    void time_sync_tgl(bool is_enable_);
    //std::vector<int> master_list;

    ros::NodeHandlePtr  nh;
    ros::Subscriber     ;//module_mode_sub; //system_sub[MAX_CLIENTS + 1]
    ros::Publisher      master_pub;


    triangulation_msg::master_list   master_list;
}

#endif
