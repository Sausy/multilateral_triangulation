#include <time_sync.hpp>
#include <stdio.h>


time_sync::time_sync(int32_t *base_addr_, uint8_t id){
  time_sync_base=base_addr_;

  //reset ptp sync
  IOWR(time_sync_base, (uint32_t)(0x02<<8|0), 1);
  IOWR(time_sync_base, (uint32_t)(0x04<<8|0), 0);


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

  uint8_t interface_buffer = ((is_master_mode_ << 1)|(1))& 0xff;
  printf("\ninterface_buffer: %d", interface_buffer);
  IOWR(time_sync_base, (uint32_t)(0x03<<8|0), interface_buffer);
  cout << "\nstart sync";


  interface_buffer = ((0x00 | !is_master_mode_) << 8)|0;
  return(IORD(time_sync_base, (uint32_t)(interface_buffer)));
}
