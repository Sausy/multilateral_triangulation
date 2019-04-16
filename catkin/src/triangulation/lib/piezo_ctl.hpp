/*
 * PIEZO_CTL_H_.
 *
 * Author       : Léa Strobino
 * Revision     : 1.0
 * Last updated : Sat, 02 Jun 2018 11:04:22 +0200
 */

#ifndef PIEZO_CTL_H_
#define PIEZO_CTL_H_

#include <stdint.h>
#include "trap.h"

#define DEFAULT_X   0 // mm
#define DEFAULT_Y   0 // mm
#define DEFAULT_Z  20 // mm
#define DEFAULT_V  20 // mm/s

#define DEFAULT_VORTEX_HELICITY    1
#define DEFAULT_TWIN_ANGLE         0 // rad
#define DEFAULT_BOTTLE_RADIUS     10 // mm
#define DEFAULT_N                200 // 40 kHz / (200+200) = 100 Hz

#define LED_VORTEX  2
#define LED_TWIN    1
#define LED_BOTTLE  3

#define ANSI_ED  "\33[2J\33[H"
#define ANSI_EL  "\33[2K\r"

#define GCODE "GgMmFfSsTtXxYyZzUuVvWwRr"

typedef enum {
  VORTEX,
  TWIN,
  BOTTLE
} trap_t;

void init_signal();

class piezo_ctl
{
  public:
    piezo_ctl(void *virtual_base = nullptr);
    void start_piezo_out();
    void stop_piezo_out();
    void get_piezo_conf(const char *file);
    void set_phase_zero();
    void set_trap_vortex(point_t p, uint8_t helicity);
    void set_trap_twin(point_t p, double angle);
    void set_trap_bottle(point_t p, double radius);
    void move(point_t *p, point_t q, double velocity);
    void print_info(point_t p, double velocity);
    void cleanup();
    void handle_signal(int sig);
    char *strword(char **stringp);

  private:
    double vortex_sig[N_PIEZO];
    uint8_t vortex_helicity = DEFAULT_VORTEX_HELICITY;
    double twin_sig[N_PIEZO], twin_angle = DEFAULT_TWIN_ANGLE;
    double bottle_sig[N_PIEZO], bottle_radius = DEFAULT_BOTTLE_RADIUS;
    point_t piezo_xyz[N_PIEZO];
    trap_t trap = TWIN;
    uint16_t n_a = DEFAULT_N, n_b = DEFAULT_N;
    uint8_t tty;
    volatile uint8_t sigint = 0;
};

#endif
