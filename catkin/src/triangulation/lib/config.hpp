#ifndef CONFIG_HPP_
#define CONFIG_HPP_
  #define SLAVE_CNT 1

  #define SOUND_SPEED 340 //m/s
  #define DISTANCE_FACTOR  (1/FPGA_LED_FREQ)

  /*mode_msg.msg
  uint8 id
  #0 master broadcast, 1 slave broadcast
  bool mode
  #0 sync slave,       1 sync master
  bool sync_mode
  bool sync_enable
  */
  #define MODE_MASTER 0
  #define MODE_SLAVE 1
  #define SYNC_MASTER 0
  #define SYNC_SLAVE 1

#endif
