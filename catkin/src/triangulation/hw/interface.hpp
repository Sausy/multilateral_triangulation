#ifndef INTERFACE_HP_
#define INTERFACE_HP_

class net{
  public :
    net();
    void spin();
};

#ifndef COMPILE_DEVICE
    //#define COMPILE_DEVICE "vidor"
    #include "vidor.hpp"
    #include <MQTT.h>

    void net::spin(){
      client.loop();
    }
#else
    #include <ros/ros.h>
    #include "de0.hpp"

    void net::spin(){
      ros::spinOnce();
    }
#endif



#endif
