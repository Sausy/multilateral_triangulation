#include "GPIO_trigger.hpp"
#include "esp_log.h"

gpio_trig::gpio_trig(){
  //spi_i = new spi_interface();
  //spi_i->test();
}

void gpio_trig::foo(){
  ESP_LOGI("GPIO","foo data ...\n");
}

