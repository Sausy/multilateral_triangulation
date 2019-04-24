#include <mode_ctl.hpp>
#include <string>

fpga_mode::fpga_mode(int32_t *base_addr_,rtc_ctl *pctl_){

  id = (uint8_t)(IORD(base_addr_, (uint32_t)(0x00<<8|0)));
  mode = id;
  pctl = pctl_;

  printf("\nID: %d", id);


  if (!ros::isInitialized()) {
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "mode");
  }
  nh = ros::NodeHandlePtr(new ros::NodeHandle);

  pctl->stop_US_out();

  if(mode == MODE_MASTER)
    fp_start_conv = &fpga_mode::master_init;  //default &fpga_mode::slave_init
}

//==============================
//Interface
//==============================
void fpga_mode::start_conversation(){
  ((*this).*(fp_start_conv))();
}
void fpga_mode::conversation(){
  ((*this).*(fp_conv))();
}

//==============================
//Init routins
//==============================
void fpga_mode::master_init(){
  std::cout << "\n MASTER Init";
  fp_conv = &fpga_mode::master_conv;

  system_ctl_msg_pub.master_id=id;
  system_ctl_msg_pub.enable_slave_input=false;
  push_vec(system_ctl_msg_pub.trigger_time, 20);

  system_pub  = nh->advertise<triangulation_msg::system_ctl>("/triangulation/all/ctl", 1);

  for(uint8_t id_cnt = 0; id_cnt < MAX_CLIENTS; id_cnt++)
    system_sub[id_cnt] = nh->subscribe("/triangulation/" + std::to_string(id_cnt) + "/trigger_time", 1, &fpga_mode::get_slav_time, this);

  system_pub.publish(system_ctl_msg_pub);
}

void fpga_mode::slave_init(){
  std::cout << "\nSLAVE Init";
  fp_conv = &fpga_mode::slave_conv;

  time_msg_pub.id=id;
  time_msg_pub.trigger_time=0;
  push_vec(time_msg_pub.input_trigger_time, 123);

  system_pub  = nh->advertise<triangulation_msg::time_msg>("/triangulation/" + std::to_string(id) + "/time_data", 1);

  system_sub[MAX_CLIENTS] = nh->subscribe("/triangulation/all/ctl", 1, &fpga_mode::get_syst_ctl, this); //Todo add sub function

  system_pub.publish(time_msg_pub);
}

//==============================
//conversation routin
//==============================
void fpga_mode::master_conv(){
  std::cout << "\nstart master conversation: ";

  //enable slave
  system_ctl_msg_pub.enable_slave_input=true;
  //TODO: wait for response over ROS;
  //...
  pctl->start_US_out();

  push_vec(system_ctl_msg_pub.trigger_time, pctl->US_start_time);
  system_pub.publish(system_ctl_msg_pub);
}

//-------------------------------
void fpga_mode::slave_conv(){
  std::cout << "\nstart slave conversation: ";

  //TODO: wait till slave allow;
  //....

  pctl->allow_input_trigger();
  for(;;)
    if(pctl->rdy_to_read())
      break;

  push_vec(time_msg_pub.input_trigger_time, pctl->read_trigger_time());
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

//ring bufferd vector push
void fpga_mode::push_vec(vector<float>& vec, float data){
  for (uint8_t vec_cnt = 0; vec_cnt < vec.size()/2; vec_cnt++){
    int buff;
    buff = vec[vec.size()-1-vec_cnt];
    vec[vec.size()-1-vec_cnt]=vec[vec_cnt];
    vec[vec_cnt]=buff;
  }
  vec.resize(MAX_TIME_STAMPS);
  for (uint8_t vec_cnt = 0; vec_cnt < vec.size()/2; vec_cnt++){
    int buff;
    buff = vec[vec.size()-1-vec_cnt];
    vec[vec.size()-1-vec_cnt]=vec[vec_cnt];
    vec[vec_cnt]=buff;
  }

  vec.push_back(data);
}
