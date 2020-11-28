#!/bin/bash
set -e

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

echo "Generating docs" 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get -y update
sudo apt-get -y install ros-melodic-rosdoc-lite

line=$(cat CMakeLists.txt | grep "project(.*)" -o); tmp=${line:8}; proj_name=${tmp:0:${#tmp}-1}; # parse the project name
source /opt/ros/melodic/setup.bash
rosdoc_lite . # generate the documentation
grep -rl "mrs_msgs/html" doc | xargs sed -i 's+../../../mrs_msgs/html/+../+g' # remove the html part of paths in the generated files
grep -rl "std_msgs/html" doc | xargs sed -i 's+../../../std_msgs/html/+http://docs.ros.org/melodic/api/std_msgs/html/+g' # remove the html part of paths in the generated files
grep -rl "geometry_msgs/html" doc | xargs sed -i 's+../../../geometry_msgs/html/+http://docs.ros.org/melodic/api/geometry_msgs/html/+g' # remove the html part of paths in the generated files
cd doc/html; ln -s index-msg.html index.html # link index.html to index-msg.html so that a browser opens that by default
