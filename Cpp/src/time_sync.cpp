/*#include <time_sync.hpp>
#include <stdio.h>


time_sync::time_sync(int32_t *base_addr_){
  rtc_base=base_addr_;

  if (!ros::isInitialized()) {
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "motor_controll");
  }
  nh = ros::NodeHandlePtr(new ros::NodeHandle);

  //TODO: ADD VARIABLE FOR MULTIBLE BOARDS
  module_mode_sub = nh->subscribe("/triangulation/ID/mode", 1, &time_sync::get_current_mode, this);
  time_pub        = nh->advertise<triangulation_msg::time_msg>("/triangulation/ID/sync_time", 1);

}

void time_sync::get_current_mode(const triangulation_msg::mode_msg::ConstPtr& msg){
    ROS_INFO("current mode: %d", msg->mode);
}

void time_sync::update_time(time *time_data){
  triangulation_msg::time_msg msg_pub;

  msg_pub.sync_time_div.push_back(time_data.sync_time_div);
  msg_pub.time_div.push_back(time_data.time_div);
  msg_pub.sys_time.push_back(time_data.sys_time);

  time_pub.publish(msg_pub);
}
*/
