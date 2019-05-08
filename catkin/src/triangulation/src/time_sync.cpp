#include <time_sync.hpp>
#include <stdio.h>


time_sync::time_sync(int32_t *base_addr_, uint8_t id){
  time_sync_base=base_addr_;

  //Stop every conversation
  IOWR(time_sync_base, (uint32_t)(0x01<<8|0), 0);
  usleep(10000);
  IOWR(time_sync_base, (uint32_t)(0x02<<8|0), 1);
  usleep(10000);

  if (!ros::isInitialized()) {
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "time_sync"+ std::to_string(id));
  }
  nh = ros::NodeHandlePtr(new ros::NodeHandle);

  //TODO: set init mode via
  //module_mode_sub = nh->subscribe("/triangulation/" + std::to_string(modef_->id) + "/mode", 1, &time_sync::get_mode, this);
  time_pub        = nh->advertise<triangulation_msg::time_sync_msg>("/triangulation/" + std::to_string(id) + "ID/time_sync_data", 1);

}

void time_sync::update_time(bool is_master_mode_){
  triangulation_msg::time_sync_msg msg_pub;

  time_data.cycle_cnt = start_time_sync(is_master_mode_);

  //convert cycle cnt to time formate
  time_data.sync_time_div = (double)(FPGA_CLK_T * time_data.cycle_cnt);

  msg_pub.sync_time_div.push_back(time_data.sync_time_div);
  msg_pub.cycle_cnt.push_back(time_data.cycle_cnt);
  msg_pub.sys_time.push_back(time_data.sys_time);

  time_pub.publish(msg_pub);
}



uint32_t time_sync::start_time_sync(bool is_master_mode_){
  //Start with Reset
  cout << "\nreset";
  IOWR(time_sync_base, (uint32_t)(0x02<<8|0), 1);
  cout << "\nset mode";
  set_sync_mode(is_master_mode_);

  cout << "\nstart sync";
  IOWR(time_sync_base, (uint32_t)(0x01<<8|0), 1);

  uint32_t delay=0;
  while (delay <= 1000) {
    delay ++;
  }
  cout << "\nstop sync";
  //Stop conversation after X TIME
  IOWR(time_sync_base, (uint32_t)(0x01<<8|0), 0);

  cout << "\nread out";
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  //TODO: add in quartus read enable flag to wait till ptp conv is finished
  return (read_sync_data(is_master_mode_));

}
uint32_t time_sync::read_sync_data(bool is_master_mode_){
  if(is_master_mode_)
    return (IORD(time_sync_base, (uint32_t)(0x00<<8|0)));

  uint32_t time_sync_;
  time_sync_ = IORD(time_sync_base, (uint32_t)(0x01<<8|0));
  cout << "\n----time sync: " << time_sync_;
  time_sync_ = IORD(time_sync_base, (uint32_t)(0x01<<8|0));
  cout << "\n----time sync: " << time_sync_;

  usleep(100000);
  time_sync_ = IORD(time_sync_base, (uint32_t)(0x01<<8|0));
  cout << "\n----time sync: " << time_sync_;

  return (IORD(time_sync_base, (uint32_t)(0x01<<8|0)));
}
void time_sync::set_sync_mode(bool is_master_mode_){
  if(is_master_mode_){
    IOWR(time_sync_base, (uint32_t)(0x00<<8|0), 1);
  }
  else{
    IOWR(time_sync_base, (uint32_t)(0x00<<8|0), 0);
  }
}
