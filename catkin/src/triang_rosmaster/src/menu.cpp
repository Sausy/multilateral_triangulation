#include <menu.hpp>

using namespace std;

menu::menu(){
  print_init_header();
  print_menu();
}
void menu::print_init_header(){
  cout << "\n=====================================";
  cout << "\n  TRIANGULATION GRANDMASTER";
  cout << "\n=====================================";
}

void menu::print_menu(){
  cout << "\n 1: Options";
  cout << "\n 2: start burst data";
  cout << "\n 3: start ptp time sync";
  cout << "\n 4: continouse burst";
}
uint8_t menu::select(){
  uint8_t ret;
  cout << "\n: ";
  cin >> ret;
  return ret;
}
void menu::options_menu(uint8_t option_key){

}
