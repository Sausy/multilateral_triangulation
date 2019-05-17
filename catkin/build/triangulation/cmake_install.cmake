# Install script for directory: /home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triangulation

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
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/build/triangulation/catkin_generated/installspace/triangulation.pc")
endif()

<<<<<<< HEAD
=======
if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/triangulation/cmake" TYPE FILE FILES
    "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/build/triangulation/catkin_generated/installspace/triangulationConfig.cmake"
    "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/build/triangulation/catkin_generated/installspace/triangulationConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/triangulation" TYPE FILE FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triangulation/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/triangulation/triangulation" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/triangulation/triangulation")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/triangulation/triangulation"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/triangulation" TYPE EXECUTABLE FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/devel/lib/triangulation/triangulation")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/triangulation/triangulation" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/triangulation/triangulation")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/triangulation/triangulation"
         OLD_RPATH "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triangulation/arm/opt/ros/kinetic/lib:/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triangulation/arm/usr/lib/arm-linux-gnueabihf:/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triangulation/arm/lib/arm-linux-gnueabihf:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/triangulation/triangulation")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/triangulation" TYPE FILE FILES "/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/src/triangulation/package.xml")
endif()

>>>>>>> f5c5d347ea491d5d2e681b04277e0476d00bba9e
