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
include esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/depend.make

# Include the progress variables for this target.
include esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/flags.make

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/flags.make
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj: /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_api.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj -c /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_api.cpp

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_api.cpp > CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.i

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_api.cpp -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.s

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj.requires:

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj.requires

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj.provides: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj.requires
	$(MAKE) -f esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build.make esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj.provides.build
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj.provides

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj.provides.build: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj


esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/flags.make
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj: /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_encr.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj -c /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_encr.cpp

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_encr.cpp > CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.i

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_encr.cpp -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.s

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj.requires:

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj.requires

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj.provides: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj.requires
	$(MAKE) -f esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build.make esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj.provides.build
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj.provides

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj.provides.build: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj


esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/flags.make
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj: /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_item_hash_list.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj -c /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_item_hash_list.cpp

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_item_hash_list.cpp > CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.i

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_item_hash_list.cpp -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.s

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj.requires:

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj.requires

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj.provides: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj.requires
	$(MAKE) -f esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build.make esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj.provides.build
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj.provides

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj.provides.build: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj


esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/flags.make
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj: /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_ops.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj -c /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_ops.cpp

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_ops.cpp > CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.i

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_ops.cpp -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.s

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj.requires:

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj.requires

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj.provides: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj.requires
	$(MAKE) -f esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build.make esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj.provides.build
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj.provides

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj.provides.build: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj


esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/flags.make
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj: /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_page.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj -c /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_page.cpp

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_page.cpp > CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.i

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_page.cpp -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.s

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj.requires:

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj.requires

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj.provides: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj.requires
	$(MAKE) -f esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build.make esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj.provides.build
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj.provides

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj.provides.build: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj


esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/flags.make
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj: /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_pagemanager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj -c /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_pagemanager.cpp

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_pagemanager.cpp > CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.i

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_pagemanager.cpp -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.s

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj.requires:

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj.requires

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj.provides: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj.requires
	$(MAKE) -f esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build.make esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj.provides.build
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj.provides

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj.provides.build: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj


esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/flags.make
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj: /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_storage.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj -c /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_storage.cpp

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_storage.cpp > CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.i

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_storage.cpp -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.s

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj.requires:

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj.requires

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj.provides: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj.requires
	$(MAKE) -f esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build.make esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj.provides.build
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj.provides

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj.provides.build: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj


esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/flags.make
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj: /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_types.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj -c /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_types.cpp

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.i"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_types.cpp > CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.i

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.s"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && /home/sausy/esp/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sausy/esp/esp-idf/components/nvs_flash/src/nvs_types.cpp -o CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.s

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj.requires:

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj.requires

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj.provides: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj.requires
	$(MAKE) -f esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build.make esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj.provides.build
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj.provides

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj.provides.build: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj


# Object files for target __idf_nvs_flash
__idf_nvs_flash_OBJECTS = \
"CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj" \
"CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj" \
"CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj" \
"CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj" \
"CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj" \
"CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj" \
"CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj" \
"CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj"

# External object files for target __idf_nvs_flash
__idf_nvs_flash_EXTERNAL_OBJECTS =

esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj
esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj
esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj
esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj
esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj
esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj
esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj
esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj
esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build.make
esp-idf/nvs_flash/libnvs_flash.a: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX static library libnvs_flash.a"
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && $(CMAKE_COMMAND) -P CMakeFiles/__idf_nvs_flash.dir/cmake_clean_target.cmake
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_nvs_flash.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build: esp-idf/nvs_flash/libnvs_flash.a

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/build

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/requires: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_api.cpp.obj.requires
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/requires: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_encr.cpp.obj.requires
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/requires: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_item_hash_list.cpp.obj.requires
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/requires: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_ops.cpp.obj.requires
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/requires: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_page.cpp.obj.requires
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/requires: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_pagemanager.cpp.obj.requires
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/requires: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_storage.cpp.obj.requires
esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/requires: esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/src/nvs_types.cpp.obj.requires

.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/requires

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/clean:
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash && $(CMAKE_COMMAND) -P CMakeFiles/__idf_nvs_flash.dir/cmake_clean.cmake
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/clean

esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/depend:
	cd /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt /home/sausy/esp/esp-idf/components/nvs_flash /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash /home/sausy/Projects/multilateral_triangulation/Cpp/triang_mqtt/build/esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/nvs_flash/CMakeFiles/__idf_nvs_flash.dir/depend

