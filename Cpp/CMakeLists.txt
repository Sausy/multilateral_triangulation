cmake_minimum_required(VERSION 2.8.3)
project(accustic_levi)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99 -g")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

SET(CMAKE_BUILD_TYPE Debug)
if (DEFINED "ENV{SOCEDS_DEST_ROOT}")
    message(STATUS "cross compiling for arm")
    # we are cross compiling for arm (make sure to be in embedded_command_shell.sh)
    set(CMAKE_SYSTEM_NAME Linux)
    set(CMAKE_SYSTEM_PROCESSOR armv7l)

    set(compiler_path /usr/bin)
    set(CMAKE_C_COMPILER ${compiler_path}/arm-linux-gnueabihf-gcc-5)
    set(CMAKE_CXX_COMPILER ${compiler_path}/arm-linux-gnueabihf-g++-5)

    SET(ALT_DEVICE_FAMILY soc_cv_av)
    add_definitions(-D${ALT_DEVICE_FAMILY})
    MESSAGE(STATUS "fpga include dir: $ENV{SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/${ALT_DEVICE_FAMILY}")
    MESSAGE(STATUS "objectdic dir: ${OPLK_BASE_DIR}/apps/common/objdicts/${OBJDICT}")

    include_directories(
            include/
            lib/
            ${catkin_INCLUDE_DIRS}
            $ENV{SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/${ALT_DEVICE_FAMILY}
            $ENV{SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/include
            $ENV{SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/include/${ALT_DEVICE_FAMILY}
    )
    #==============================================================================
    # Application
    #==============================================================================
    FILE(GLOB_RECURSE SRC_FILES "src/*.cpp")
    FILE(GLOB_RECURSE MAIN_SRC_FILES "*.cpp")
    FILE(GLOB_RECURSE INCLUDE_FILES "lib/*.h*")

    add_executable( accustic_levi
        ${SRC_FILES}
        ${MAIN_SRC_FILES}
        ${INCLUDE_FILES}
        )
    target_link_libraries( accustic_levi -lpthread -lrt -lm)


    #==============================================================================
    # Installation
    #==============================================================================
    install(TARGETS
            accustic_levi
            DESTINATION "build/"
            )
else ()
    message(STATUS "cannot cross compile, are you in an embedded_command_shell.sh?!")
endif ()
