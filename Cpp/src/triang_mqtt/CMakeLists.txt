cmake_minimum_required(VERSION 3.5)
set(PROJECT_NAME "triang_mqtt")
include($ENV{IDF_PATH}/tools/cmake/project.cmake)

get_filename_component(DEV_ROOT "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)
set(PROJECT_ROOT "${DEV_ROOT}/")

set(SUBMODULE_ROOT "${IDF_PATH}/components/mqtt/")


#include_directories(
#        lib/
#        )

#FILE(GLOB SRC_FILES src/*.cpp)
#FILE(GLOB INCLUDE_FILES lib/*.h*)

#add_executable( ${PROJECT_NAME}
#        ${SRC_FILES}
#        ${INCLUDE_FILES}
#        )

set(MAIN_SRCS ${PROJECT_ROOT}/src/app_main.c)
#set(COMPONENT_SRCS src/*.c*)
#set(COMPONENT_ADD_INCLUDEDIRS lib/*.h*)

set(EXTRA_COMPONENT_DIRS "${EXTRA_COMPONENT_DIRS} ${SUBMODULE_ROOT}")
set(BUILD_COMPONENTS "${BUILD_COMPONENTS} espmqtt")

project(${PROJECT_NAME})
