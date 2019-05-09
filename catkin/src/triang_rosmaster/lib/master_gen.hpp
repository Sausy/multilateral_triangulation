#ifndef MASTER_LIST_HPP_
#define MASTER_LIST_HPP_

#include <ros/ros.h>
#include <stdint.h>
#include <stdio.h>
#include <vector>
#include <triangulation_msg/mode_msg.h>
#include <triangulation_msg/system_ctl.h>
#include <triangulation_msg/time_msg.h>
#include <triangulation_msg/time_sync_msg.h>
#include <triangulation_msg/master_list.h>

using namespace std;

#define MASTER_LIST_SIZE 20
#define MAX_CLIENTS 20

class master_gen{
  public:
    master_gen(uint8_t member_amount = 2);
    void time_sync_tgl(bool is_enable_);
    void push_vec(vector<uint32_t>& vec, uint32_t data);
    void add_list_member();
    void start_burst_mode();
    void tgl_continiouse_mode();
    //std::vector<int> master_list;

    ros::NodeHandlePtr  nh;
    ros::Subscriber     client_sub[MAX_CLIENTS + 1];
    ros::Publisher      master_pub;

    triangulation_msg::master_list   master_list;
};

#endif
