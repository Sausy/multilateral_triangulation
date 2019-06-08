file(REMOVE_RECURSE
  "config/sdkconfig.h"
  "config/sdkconfig.cmake"
  "bootloader.map"
  "project_elf_src.c"
  "CMakeFiles/bootloader"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/bootloader.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
