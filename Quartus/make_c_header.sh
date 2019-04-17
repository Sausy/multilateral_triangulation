#!/bin/sh
echo "!!!!! Embedded comandshell starten falls nicht erfolgreich!!!!"
sopc-create-header-files soc_system.sopcinfo --single soc_system/soc_system.h --module hps_0
cp soc_system/soc_system.h ../catkin/src/triangulation/lib
