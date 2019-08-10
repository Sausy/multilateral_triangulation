# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build

# Include any dependencies generated for this target.
include esp-idf/ulp/CMakeFiles/__idf_ulp.dir/depend.make

# Include the progress variables for this target.
include esp-idf/ulp/CMakeFiles/__idf_ulp.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/ulp/CMakeFiles/__idf_ulp.dir/flags.make

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/flags.make
esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj: /home/sausy/esp/esp-idf/components/ulp/ulp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_ulp.dir/ulp.c.obj   -c /home/sausy/esp/esp-idf/components/ulp/ulp.c

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_ulp.dir/ulp.c.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sausy/esp/esp-idf/components/ulp/ulp.c > CMakeFiles/__idf_ulp.dir/ulp.c.i

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_ulp.dir/ulp.c.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sausy/esp/esp-idf/components/ulp/ulp.c -o CMakeFiles/__idf_ulp.dir/ulp.c.s

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj.requires:

.PHONY : esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj.requires

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj.provides: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj.requires
	$(MAKE) -f esp-idf/ulp/CMakeFiles/__idf_ulp.dir/build.make esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj.provides.build
.PHONY : esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj.provides

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj.provides.build: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj


esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/flags.make
esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj: /home/sausy/esp/esp-idf/components/ulp/ulp_macro.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj   -c /home/sausy/esp/esp-idf/components/ulp/ulp_macro.c

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_ulp.dir/ulp_macro.c.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sausy/esp/esp-idf/components/ulp/ulp_macro.c > CMakeFiles/__idf_ulp.dir/ulp_macro.c.i

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_ulp.dir/ulp_macro.c.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sausy/esp/esp-idf/components/ulp/ulp_macro.c -o CMakeFiles/__idf_ulp.dir/ulp_macro.c.s

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj.requires:

.PHONY : esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj.requires

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj.provides: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj.requires
	$(MAKE) -f esp-idf/ulp/CMakeFiles/__idf_ulp.dir/build.make esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj.provides.build
.PHONY : esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj.provides

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj.provides.build: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj


# Object files for target __idf_ulp
__idf_ulp_OBJECTS = \
"CMakeFiles/__idf_ulp.dir/ulp.c.obj" \
"CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj"

# External object files for target __idf_ulp
__idf_ulp_EXTERNAL_OBJECTS =

esp-idf/ulp/libulp.a: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj
esp-idf/ulp/libulp.a: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj
esp-idf/ulp/libulp.a: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/build.make
esp-idf/ulp/libulp.a: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libulp.a"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp && $(CMAKE_COMMAND) -P CMakeFiles/__idf_ulp.dir/cmake_clean_target.cmake
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_ulp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/ulp/CMakeFiles/__idf_ulp.dir/build: esp-idf/ulp/libulp.a

.PHONY : esp-idf/ulp/CMakeFiles/__idf_ulp.dir/build

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/requires: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp.c.obj.requires
esp-idf/ulp/CMakeFiles/__idf_ulp.dir/requires: esp-idf/ulp/CMakeFiles/__idf_ulp.dir/ulp_macro.c.obj.requires

.PHONY : esp-idf/ulp/CMakeFiles/__idf_ulp.dir/requires

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/clean:
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp && $(CMAKE_COMMAND) -P CMakeFiles/__idf_ulp.dir/cmake_clean.cmake
.PHONY : esp-idf/ulp/CMakeFiles/__idf_ulp.dir/clean

esp-idf/ulp/CMakeFiles/__idf_ulp.dir/depend:
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt /home/sausy/esp/esp-idf/components/ulp /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/ulp/CMakeFiles/__idf_ulp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/ulp/CMakeFiles/__idf_ulp.dir/depend
