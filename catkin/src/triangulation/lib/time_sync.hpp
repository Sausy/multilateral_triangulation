#ifndef TIME_SYNC_HPP_
#define TIME_SYNC_HPP_
#include <ros/ros.h>
#include <vector>
#include <triangulation_msg/mode_msg.h>
#include <triangulation_msg/system_ctl.h>
#include <triangulation_msg/time_msg.h>
#include <triangulation_msg/time_sync_msg.h>
#include "mode_ctl.hpp"

using namespace std;

struct time {
    double    sync_time_div;
    double    time_div;
    double    sys_time;
};

typedef struct time Time;

class time_sync
{
  public:
    time_sync(int32_t *base_addr_ = nullptr,fpga_mode *modef_ = nullptr);

    ros::NodeHandlePtr  nh;
    ros::Subscriber     time_ctl_sub,   module_mode_sub, sync_enable;
    ros::Publisher      time_pub;

    //subs
    void get_mode(const triangulation_msg::mode_msg::ConstPtr& msg);
    void start_sync_mode();

    //pubs
    void update_time(Time *time_data);

  private:
    int32_t *rtc_base;
};
#endif
