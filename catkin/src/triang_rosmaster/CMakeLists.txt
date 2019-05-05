cmake_minimum_required(VERSION 2.8.3)
project(triangulation_master)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

SET(CMAKE_BUILD_TYPE Debug)

set(CMAKE_SYSTEM_NAME Linux)
set(compiler_path /usr/bin)
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

catkin_package(CATKIN_DEPENDS
        message_runtime
        triangulation_msg
        )
#==============================================================================
# Application
#==============================================================================
FILE(GLOB SRC_FILES src/*.cpp)
FILE(GLOB INCLUDE_FILES include/*.hpp)

add_executable( triangulation_master
        ${SRC_FILES}
        ${INCLUDE_FILES}
        )

#add_dependencies(triangulation_master roboy_control_msgs_gencpp)
target_link_libraries( triangulation_master -lpthread -lrt -lm ${ros_LIBRARIES})
