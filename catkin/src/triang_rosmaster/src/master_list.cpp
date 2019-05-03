#include <master_list.hpp>

master_list::master_list(uint8_t member_amount){

  master_list.start_ptp_sync = true;
  for(uint8_t cnt=0; cnt <= member_amount-1; cnt++){
    master_list.master_id_list.push_back(cnt);
  }

  master_pub  = nh->advertise<triangulation_msg::master_list>("/triangulation/all/master_list", 1);
  master_pub.publish(system_ctl_msg_pub);
}

void master_list::add_list_member(){
  uint8_t new_master_id = 0;
  //TODO:assign new master id's
  push_vec(master_list.master_id_list, new_master_id)
}
void master_list::time_sync_tgl(bool is_enable_){
  master_list.start_ptp_sync = is_enable_;
  master_pub.publish(system_ctl_msg_pub);
}


//ring bufferd vector push
void master_list::push_vec(vector<uint32_t>& vec, uint32_t data){
  for (uint8_t vec_cnt = 0; vec_cnt < vec.size()/2; vec_cnt++){
    int buff;
    buff = vec[vec.size()-1-vec_cnt];
    vec[vec.size()-1-vec_cnt]=vec[vec_cnt];
    vec[vec_cnt]=buff;
  }
  vec.resize(MASTER_LIST_SIZE);
  for (uint8_t vec_cnt = 0; vec_cnt < vec.size()/2; vec_cnt++){
    int buff;
    buff = vec[vec.size()-1-vec_cnt];
    vec[vec.size()-1-vec_cnt]=vec[vec_cnt];
    vec[vec_cnt]=buff;
  }

  vec.push_back(data);
}
