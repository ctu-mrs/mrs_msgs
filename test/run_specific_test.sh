#!/bin/bash

while [ ! -e "build/COLCON_IGNORE" ]; do
  cd ..
  if [[ `pwd` == "/" ]]; then
    # we reached the root and didn't find the build/COLCON_IGNORE file - that's a fail!
    echo "Cannot compile, probably not in a workspace (if you want to create a new workspace, call \"colcon init\" in its root first)".
    exit 1
  fi
done

export RMS_IMPLEMENTATION=rmw_fastrtps_cpp

colcon test-result --delete-yes

# colcon test --packages-select mrs_msgs --ctest-args -R 'validate_rosidl_definitions'
colcon test --packages-select mrs_msgs --ctest-args -R 'test_name_collisions'

colcon test-result --all --verbose
