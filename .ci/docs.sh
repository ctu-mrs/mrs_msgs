#!/bin/bash
set -e

echo "Generating docs"
curl -sl https://ctu-mrs.github.io/ppa2-stable/add_ros_ppa.sh | bash
sudo apt-get -y install python3-rosdoc2

# generate the documentation and parse the project name
rosdoc2 build -p . -o doc
line=$(cat CMakeLists.txt | grep "project(.*)" -o); tmp=${line:8}; proj_name=${tmp:0:${#tmp}-1};
mv doc/$proj_name doc/html
