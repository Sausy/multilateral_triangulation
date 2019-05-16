# Install script for directory: /home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triang_communication/triangulation_msg

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/triangulation_msg/msg" TYPE FILE FILES
    "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triang_communication/triangulation_msg/msg/mode_msg.msg"
    "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triang_communication/triangulation_msg/msg/time_msg.msg"
    "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triang_communication/triangulation_msg/msg/time_sync_msg.msg"
    "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triang_communication/triangulation_msg/msg/system_ctl.msg"
    "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triang_communication/triangulation_msg/msg/master_list.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/triangulation_msg/cmake" TYPE FILE FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/build/triang_communication/triangulation_msg/catkin_generated/installspace/triangulation_msg-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/devel/include/triangulation_msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/devel/share/roseus/ros/triangulation_msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/devel/share/common-lisp/ros/triangulation_msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/devel/share/gennodejs/ros/triangulation_msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/devel/lib/python2.7/dist-packages/triangulation_msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/devel/lib/python2.7/dist-packages/triangulation_msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/build/triang_communication/triangulation_msg/catkin_generated/installspace/triangulation_msg.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/triangulation_msg/cmake" TYPE FILE FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/build/triang_communication/triangulation_msg/catkin_generated/installspace/triangulation_msg-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/triangulation_msg/cmake" TYPE FILE FILES
    "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/build/triang_communication/triangulation_msg/catkin_generated/installspace/triangulation_msgConfig.cmake"
    "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/build/triang_communication/triangulation_msg/catkin_generated/installspace/triangulation_msgConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/triangulation_msg" TYPE FILE FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triang_communication/triangulation_msg/package.xml")
endif()

