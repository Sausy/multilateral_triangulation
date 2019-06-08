#include "fpgainterface.hpp"
#include "esp_log.h"

hardware_interface::hardware_interface(){
  gpio->foo();
  ESP_LOGI("SPI", "Start SPI");
  //spi_interface *spi_i = new spi_interface();
  //spi_i.test();
  spi_i.foo();
  //spi_i->foo();
}

void hardware_interface::master_reset(){
  ;
}



//========================================================================
