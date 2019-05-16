#ifndef TDOA_TRIANGULATION_HPP_
#define TDOA_TRIANGULATION_HPP_

#include <stdint.h>
#include <stdio.h>
#include <vector>

#define MAX_CLIENTS 30

stuct kart_pos(){
  double x;
  double y;
  double z;
};
l
class tdoa{
  public:
    tdoa();

    std::vector<struct kart_pos> M = {0,0,0};


};

#endif
