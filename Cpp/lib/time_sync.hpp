/*#ifndef TIME_SYNC_HPP_
#define TIME_SYNC_HPP_
#include <ros/ros.h>
#include <vector>


struct time {
    vector<double>    sync_time_div;
    vector<double>    time_div;
    vector<double>    sys_time;
};

class time_sync
{
  public:
    time_sync(int32_t *base_addr_ = nullptr);

    ros::NodeHandle   nh;
    ros::Subscriber   time_ctl_sub,   module_mode_sub;
    ros::Publisher    time_pub;

    //subs
    void get_current_mode(const triangulation_msg::mode_msg::ConstPtr& msg);
    void start_sync_mode();

    //pubs
    void update_time(time *time_data);

  private:
    int32_t *rtc_base;
};

#endif
*/
