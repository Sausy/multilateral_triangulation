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
  cout << "\n 1: Options\n";
  cout << "\n 2: geather burst data\n";
  cout << "\n 3: start ptp time sync\n";
}
uint8_t menu::select(){
  uint8_t ret;
  cout << "\n: ";
  cin >> ret;
  return ret;
}
void menu::options_menu(uint8_t option_key){
  switch (option_key){
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;
    default:
      break;
  }
}
