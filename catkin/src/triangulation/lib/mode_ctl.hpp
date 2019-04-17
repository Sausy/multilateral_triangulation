#ifndef MODE_CTL_HPP_
#define MODE_CTL_HPP_

#include <ros/ros.h>
#include <stdint.h>
#include <stdio.h>
#include "time_controll.hpp"
#include <triangulation_msg/mode_msg.h>
#include <triangulation_msg/system_ctl.h>
#include <triangulation_msg/time_msg.h>
#include <triangulation_msg/time_sync_msg.h>

#define MAX_CLIENTS 16

#define MODE_MASTER 0
#define MODE_SLAVE 1
#define SYNC_MASTER 0
#define SYNC_SLAVE 1

class fpga_mode{
  public:
    fpga_mode(int32_t *base_addr_ = nullptr,rtc_ctl *pctl_ = nullptr);
    uint8_t id;
    uint8_t master_id;
    uint8_t mode;
    bool sync_mode;

    ros::NodeHandlePtr  nh;
    ros::Subscriber     system_sub[MAX_CLIENTS + 1];
    ros::Publisher      system_pub;

    void (fpga_mode::*start_conversation)(); //= &fpga_mode::master_init;
    void (fpga_mode::*conversation)();

    void slave_init();
    void master_init();

    void master_conv();
    void slave_conv();

  private:
    rtc_ctl *pctl;

    triangulation_msg::system_ctl   system_ctl_msg_pub;
    triangulation_msg::time_msg     time_msg_pub;

    void get_slav_time(const triangulation_msg::time_msg::ConstPtr& msg);
    void get_syst_ctl(const triangulation_msg::system_ctl::ConstPtr& msg);
};
#endif
