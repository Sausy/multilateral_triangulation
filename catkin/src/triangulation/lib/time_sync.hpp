#ifndef TIME_SYNC_HPP_
#define TIME_SYNC_HPP_
#include <ros/ros.h>
#include <vector>
#include <triangulation_msg/mode_msg.h>
#include <triangulation_msg/system_ctl.h>
#include <triangulation_msg/time_msg.h>
#include <triangulation_msg/time_sync_msg.h>
#include "mode_ctl.hpp"
#include "config.hpp"

using namespace std;

struct time {
    double    sync_time_div;
    double    sys_time;
    uint32_t  cycle_cnt;
};

typedef struct time Time;

class time_sync
{
  public:
    time_sync(int32_t *base_addr_ = nullptr,fpga_mode *modef_ = nullptr);

    uint32_t start_time_sync(bool is_master_mode_);
    uint32_t read_sync_data(bool is_master_mode_);

    struct time time_data = {0,0,0};

    ros::NodeHandlePtr  nh;
    ros::Subscriber     time_ctl_sub,  sync_enable;
    ros::Publisher      time_pub;

    //subs
    void start_sync_mode();

    //pubs
    void update_time(bool is_master_mode_);

  private:
    int32_t *time_sync_base;
    void set_sync_mode(bool is_master_mode_);
};
#endif
