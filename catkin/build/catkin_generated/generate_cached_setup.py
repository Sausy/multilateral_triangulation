# -*- coding: utf-8 -*-
from __future__ import print_function
import argparse
import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/kinetic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/kinetic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
<<<<<<< HEAD
    for workspace in "/opt/ros/melodic".split(';'):
=======
    for workspace in "/home/roboy/workspace/roboy_control/devel;/home/roboy/DriverlessDriver/catkin_ws/devel;/opt/ros/kinetic".split(';'):
>>>>>>> f5c5d347ea491d5d2e681b04277e0476d00bba9e
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/devel/env.sh')

output_filename = '/home/roboy/BikeToRikshaw/old_git_stuff/multilateral_triangulation/catkin/build/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    #print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
