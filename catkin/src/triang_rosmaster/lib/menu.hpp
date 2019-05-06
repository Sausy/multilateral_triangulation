#ifndef MENU_HPP_
#define MENU_HPP_

#include <ros/ros.h>
#include <stdint.h>
#include <stdio.h>
#include <triangulation_msg/mode_msg.h>
#include <triangulation_msg/system_ctl.h>
#include <triangulation_msg/time_msg.h>
#include <triangulation_msg/time_sync_msg.h>
#include <triangulation_msg/master_list.h>

class menu{
  public:
    menu();
    void print_menu();
    void options_menu(uint8_t option_key);
    void print_init_header();

    uint8_t select();

//insert common global definitions
};

#endif
