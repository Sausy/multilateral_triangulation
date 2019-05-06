cmake_minimum_required(VERSION 2.8.3)
project(triangulation_master)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

SET(CMAKE_BUILD_TYPE Debug)

#==============================================================================
# Dependencies
#==============================================================================
find_package(catkin REQUIRED COMPONENTS
            roscpp
            nodelet
            std_msgs
            message_generation
            triangulation_msg
        )
find_package(Curses REQUIRED)

catkin_package(CATKIN_DEPENDS
        message_runtime
        triangulation_msg
        )

include_directories(
        lib/
        include/
        ${catkin_INCLUDE_DIRS}
        ${CURSES_INCLUDE_DIR}
      )
#==============================================================================
# Application
#==============================================================================

FILE(GLOB SRC_FILES src/*.cpp)
FILE(GLOB INCLUDE_FILES lib/*.hpp)

add_executable( triangulation_master
        ${SRC_FILES}
        ${INCLUDE_FILES}
        )

add_dependencies(triangulation_master triangulation_msg_gencpp)
target_link_libraries( triangulation_master -lpthread -lrt -lm ${catkin_LIBRARIES} ${CURSES_LIBRARIES})
