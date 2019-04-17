#include <mode_ctl.hpp>
#include <string>

fpga_mode::fpga_mode(int32_t *base_addr_,rtc_ctl *pctl_){
  id = (IORD(base_addr_, (uint32_t)(0x01<<8|0)));
  mode = id;

  pctl = pctl_;

  if (!ros::isInitialized()) {
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "mode");
  }
  nh = ros::NodeHandlePtr(new ros::NodeHandle);

  pctl->stop_US_out();

  switch (mode) {
    case MODE_MASTER:
        start_conversation = &fpga_mode::master_init;
      break;
    default:
        start_conversation = &fpga_mode::slave_init;
      break;
  }
}

//==============================
//Init routins
//==============================
void fpga_mode::master_init(){
  conversation = &fpga_mode::master_conv;

  system_ctl_msg_pub.master_id=id;
  system_ctl_msg_pub.enable_slave_input=false;
  system_ctl_msg_pub.trigger_time.push_back(20);

  system_pub  = nh->advertise<triangulation_msg::system_ctl>("/triangulation/all/ctl", 1);

  for(uint8_t id_cnt = 0; id_cnt < MAX_CLIENTS; id_cnt++)
    system_sub[id_cnt] = nh->subscribe("/triangulation/" + std::to_string(id_cnt) + "/trigger_time", 1, &fpga_mode::get_slav_time, this);

  system_pub.publish(system_ctl_msg_pub);
}

void fpga_mode::slave_init(){
  conversation = &fpga_mode::slave_conv;

  time_msg_pub.id=id;
  time_msg_pub.trigger_time=0;
  time_msg_pub.input_trigger_time.push_back(123);

  system_pub  = nh->advertise<triangulation_msg::time_msg>("/triangulation/" + std::to_string(id) + "/time_data", 1);

  system_sub[MAX_CLIENTS] = nh->subscribe("/triangulation/all/ctl", 1, &fpga_mode::get_syst_ctl, this); //Todo add sub function

  system_pub.publish(time_msg_pub);
}

//==============================
//conversation routin
//==============================
void fpga_mode::master_conv(){
  //TODO: creat Ring Buffer
  if(system_ctl_msg_pub.trigger_time.size() >= 20){
    while (!system_ctl_msg_pub.trigger_time.empty()) {
          system_ctl_msg_pub.trigger_time.pop_back();
    }
  }
  //enable slave
  uint8_t debug_start_master;
  std::cout << "\nstart master: ";
  std::cin >> debug_start_master;


  system_ctl_msg_pub.enable_slave_input=true;
  //TODO: wait for response over ROS;
  //...
  pctl->start_US_out();
  system_ctl_msg_pub.trigger_time.push_back(pctl->US_start_time);

  system_pub.publish(system_ctl_msg_pub);
}

void fpga_mode::slave_conv(){
  //TODO: creat Ring Buffer
  if(time_msg_pub.input_trigger_time.size() >= 20){
    while (!time_msg_pub.input_trigger_time.empty()) {
          time_msg_pub.input_trigger_time.pop_back();
    }
  }

  //TODO: wait till slave allow;
  //....

  pctl->allow_input_trigger();
  for(;;)
    if(pctl->rdy_to_read())
      break;

  time_msg_pub.input_trigger_time.push_back(pctl->read_trigger_time());

  system_pub.publish(time_msg_pub);
}


//==============================
//common routin for ros
//==============================
void fpga_mode::get_slav_time(const triangulation_msg::time_msg::ConstPtr& msg){
  std::cout << "\n" << msg->id;
}
void fpga_mode::get_syst_ctl(const triangulation_msg::system_ctl::ConstPtr& msg){
  std::cout << "\nmaster ID: " << msg->master_id;
}
