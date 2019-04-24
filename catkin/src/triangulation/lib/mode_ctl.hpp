#ifndef MODE_CTL_HPP_
#define MODE_CTL_HPP_

#include <ros/ros.h>
#include <stdint.h>
#include <stdio.h>
#include <vector>
#include "time_controll.hpp"
#include <triangulation_msg/mode_msg.h>
#include <triangulation_msg/system_ctl.h>
#include <triangulation_msg/time_msg.h>
#include <triangulation_msg/time_sync_msg.h>

using namespace std;

#define MAX_CLIENTS 16
#define MAX_TIME_STAMPS 64

#define MODE_MASTER 0
#define MODE_SLAVE 1
#define SYNC_MASTER 0
#define SYNC_SLAVE 1

#ifndef IORD
  #define IORD(base, reg) (*(((volatile int32_t*)base)+reg))
#endif
#ifndef IOWR
  #define IOWR(base, reg, data) (*(((volatile int32_t*)base)+reg)=data)
#endif

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

    void start_conversation();
    void conversation();

  private:
    rtc_ctl *pctl;

    void (fpga_mode::*fp_start_conv)() = &fpga_mode::slave_init;
    void (fpga_mode::*fp_conv)();

    void slave_init();
    void master_init();

    void master_conv();
    void slave_conv();

    triangulation_msg::system_ctl   system_ctl_msg_pub;
    triangulation_msg::time_msg     time_msg_pub;

    void get_slav_time(const triangulation_msg::time_msg::ConstPtr& msg);
    void get_syst_ctl(const triangulation_msg::system_ctl::ConstPtr& msg);

    //ring bufferd vector push
    void push_vec(vector<float>& vec, float data);
};
#endif
