#include <tdoa_triangulation.hpp>

tdoa::tdoa(uint8_t masterID_){

  std::vector<double> r0
  std::vector<double> r1;
  std::vector<double> r2;

  doubel smalles_r[2];

  double a,b,c;

  masterID[0] = masterID_;
  update_pos(r0);
  find_closest(r0, smalles_r);

  a = smalles_r[0];
  b = smalles_r[1];
  c = update_pos_singel(r1, masterID_[1]);

  update_pos(r2);

  M[0].x=0;
  M[0].y=0;
  M[0].z=0;

  M[1].x=0;
  M[1].y=a;
  M[1].z=0;


  M[2].x=-c^2+b^2+a^2;
  M[2].x=M[2].x/(2*a);
  M[2].y=sqrt(b^2-M[2].x^2);
  M[2].z=0;
}

double tdoa::update_pos_singel(){
  return 0.0;
}
void tdoa::update_pos(){

}

void tdoa::find_closest(const vector<double>& r, double smalles_r[2]){
  uint8_t i = 1;
  doubel smalles_r[0] = r[0];
  masterID[1] = 0;
  for(auto const &r_:r){
    if(smalles_r[0] > r[i]){
      masterID[1] = i;
      smalles_r[0] = r[i];
    }
    i++;
  }

  i = 1;
  masterID[2] = 0;
  doubel smalles_r[1] = r[0];
  for(auto const &r_:r){
    if(smalles_r[1]  > r[i]){
      if(smalles_r[1]  != smalles_r[0]){
        smalles_r[1]  = r[i];
        masterID[2] = i;
      }
    }
    i++;
  }
}
