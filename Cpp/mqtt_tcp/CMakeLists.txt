cmake_minimum_required(VERSION 3.5)

set(CMAKE_CXX_STANDARD 11)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g")

#set(compiler_path /usr/bin)
#set(CMAKE_CXX_COMPILER ${compiler_path}/arm-linux-gnueabihf-g++-5)

get_filename_component(DEV_ROOT "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)

set(PROJECT_ROOT "${DEV_ROOT}/")

set(SUBMODULE_ROOT "${DEV_ROOT}/../../../")

set(PROJECT_NAME "mqtt_tcp")

include($ENV{IDF_PATH}/tools/cmake/project.cmake)

set(MAIN_SRCS ${PROJECT_ROOT}/main/app_main.cpp)

add_subdirectory(components/fpgainterface)

set(EXTRA_COMPONENT_DIRS "${EXTRA_COMPONENT_DIRS} ${SUBMODULE_ROOT}")
#set(EXTRA_COMPONENT_DIRS "${EXTRA_COMPONENT_DIRS} ./components")
set(BUILD_COMPONENTS "${BUILD_COMPONENTS} espmqtt")

project(${PROJECT_NAME})
