#include <time_sync.hpp>
#include <stdio.h>


time_sync::time_sync(int32_t *base_addr_, fpga_mode *modef_){
  rtc_base=base_addr_;

  if (!ros::isInitialized()) {
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "time_sync");
  }
  nh = ros::NodeHandlePtr(new ros::NodeHandle);

  //TODO: set init mode via
  module_mode_sub = nh->subscribe("/triangulation/" + std::to_string(modef_->id) + "/mode", 1, &time_sync::get_mode, this);
  time_pub        = nh->advertise<triangulation_msg::time_sync_msg>("/triangulation/" + std::to_string(modef_->id) + "/time_data", 1);

}

void time_sync::get_mode(const triangulation_msg::mode_msg::ConstPtr& msg){
    ROS_INFO("current mode: %d", msg->mode);
    ROS_INFO("sync enable: %d", msg->sync_enable);
}

void time_sync::update_time(Time *time_data){
  triangulation_msg::time_sync_msg msg_pub;

  msg_pub.sync_time_div.push_back(time_data->sync_time_div);
  msg_pub.time_div.push_back(time_data->time_div);
  msg_pub.sys_time.push_back(time_data->sys_time);

  time_pub.publish(msg_pub);
}
