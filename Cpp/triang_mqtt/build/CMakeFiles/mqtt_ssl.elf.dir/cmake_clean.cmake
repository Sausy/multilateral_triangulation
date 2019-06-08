file(REMOVE_RECURSE
  "config/sdkconfig.h"
  "config/sdkconfig.cmake"
  "bootloader/bootloader.elf"
  "bootloader/bootloader.bin"
  "bootloader/bootloader.map"
  "mqtt_ssl.map"
  "project_elf_src.c"
  "project_elf_src.c"
  "CMakeFiles/mqtt_ssl.elf.dir/project_elf_src.c.obj"
  "mqtt_ssl.elf.pdb"
  "mqtt_ssl.elf"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/mqtt_ssl.elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
