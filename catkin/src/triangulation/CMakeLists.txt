cmake_minimum_required(VERSION 2.8.3)
project(triangulation)

add_definitions(-DCOMPILE_DEVICE="de0")

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99 -g")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

SET(CMAKE_BUILD_TYPE Debug)
if (DEFINED "ENV{SOCEDS_DEST_ROOT}")
    message(STATUS "cross compiling for arm")
    # we are cross compiling for arm (make sure to be in embedded_command_shell.sh)
    set(CMAKE_SYSTEM_NAME Linux)

    #==============================================================================
    # ARM compiler
    #==============================================================================
    set(compiler_path /usr/bin)
    set(CMAKE_C_COMPILER ${compiler_path}/arm-linux-gnueabihf-gcc-5)
    set(CMAKE_CXX_COMPILER ${compiler_path}/arm-linux-gnueabihf-g++-5)

    #==============================================================================
    # Dependencies
    #==============================================================================
    find_package(catkin REQUIRED COMPONENTS
            roscpp
            std_msgs
            triangulation_msg
    )
    include(findros)
    #find_package(PkgConfig REQUIRED)
    #pkg_check_modules(EIGEN3 REQUIRED eigen3)
    #include_directories(${EIGEN3_INCLUDE_DIRS})

    # yaml-cpp
    #pkg_check_modules(yaml-cpp REQUIRED yaml-cpp)
    #include_directories(${yaml-cpp_INCLUDE_DIRS})

    catkin_package(CATKIN_DEPENDS
            message_runtime
            triangulation_msg
            )

    SET(ALT_DEVICE_FAMILY soc_cv_av)
    add_definitions(-D${ALT_DEVICE_FAMILY})
    MESSAGE(STATUS "fpga include dir: $ENV{SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/${ALT_DEVICE_FAMILY}")
    MESSAGE(STATUS "objectdic dir: ${OPLK_BASE_DIR}/apps/common/objdicts/${OBJDICT}")

    include_directories(
            include/
            lib/
            hw/
            ${catkin_INCLUDE_DIRS}
            $ENV{SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/${ALT_DEVICE_FAMILY}
            $ENV{SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/include
            $ENV{SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/include/${ALT_DEVICE_FAMILY}
    )
    #==============================================================================
    # Application
    #==============================================================================
    FILE(GLOB_RECURSE SRC_FILES "src/*.cpp")
    FILE(GLOB_RECURSE SRC_FILES_HW "hw/*.cpp")
    #FILE(GLOB_RECURSE MAIN_SRC_FILES "*.cpp")
    FILE(GLOB_RECURSE INCLUDE_FILES "lib/*.h*")
    FILE(GLOB_RECURSE INCLUDE_FILES_HW "hw/*.h*")

    add_executable( triangulation
        ${SRC_FILES}
        ${SRC_FILES_HW}
        #${MAIN_SRC_FILES}
        ${INCLUDE_FILES}
        ${INCLUDE_FILES_HW}
        )
    #add_dependencies(roboy_plexus triangulation_msg_gencpp)
    target_link_libraries( triangulation -lpthread -lrt -lm ${ros_LIBRARIES})


    #==============================================================================
    # Installation
    #==============================================================================
    install(TARGETS
            triangulation
            DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
            )
    install(FILES
            package.xml
            DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
            )
else ()
    message(STATUS "cannot cross compile, are you in an embedded_command_shell.sh?!")
endif ()
