#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`
cd "$MY_PATH"

ROS1_MSGS_LOCATION="$HOME/git/uav_core/ros_packages/mrs_msgs"

# clean old msgs

echo "Cleaning old messages for ROS2"
rm $MY_PATH/msg/*
rm $MY_PATH/srv/*

# copy msgs

ROS1_MSGS_PATH="$ROS1_MSGS_LOCATION/msg"
ROS1_MSGS_FILES=$( ls "$ROS1_MSGS_PATH" | grep -e "^.*\.msg$" )

for file in $ROS1_MSGS_FILES; do
  FULL_PATH="$ROS1_MSGS_PATH/$file"
  echo "copying msg '$FULL_PATH'"
  cp $FULL_PATH $MY_PATH/msg
done

# copy srvs

ROS1_SRVS_PATH="$ROS1_MSGS_LOCATION/srv"
ROS1_SRVS_FILES=$( ls "$ROS1_SRVS_PATH" | grep -e "^.*\.srv$" )

for file in $ROS1_SRVS_FILES; do
  FULL_PATH="$ROS1_SRVS_PATH/$file"
  echo "copying msg '$FULL_PATH'"
  cp $FULL_PATH $MY_PATH/srv
done

# postproess message files

for file in $ROS1_MSGS_FILES; do
  /usr/bin/vim -E -s -c "%s/^time/builtin_interfaces\/Time/g" -c "wqa" -- $MY_PATH/msg/$file
  /usr/bin/vim -E -s -c "%s/^Header/std_msgs\/Header/g" -c "wqa" -- $MY_PATH/msg/$file
  /usr/bin/vim -E -s -c "%s/\s\+$//g" -c "wqa" -- $MY_PATH/msg/$file
done

for file in $ROS1_SRVS_FILES; do
  /usr/bin/vim -E -s -c "%s/^time/builtin_interfaces\/Time/g" -c "wqa" -- $MY_PATH/srv/$file
  /usr/bin/vim -E -s -c "%s/^Header/std_msgs\/Header/g" -c "wqa" -- $MY_PATH/srv/$file
  /usr/bin/vim -E -s -c "%s/\s\+$//g" -c "wqa" -- $MY_PATH/srv/$file
done

/usr/bin/vim -E -s -c "norm ggdap" -c "wqa" -- $MY_PATH/msg/ObstacleSectors.msg
/usr/bin/vim -E -s -c "%g/\[\w\]/norm f[ldt]" -c "wqa" -- $MY_PATH/msg/GpsFix.msg
/usr/bin/vim -E -s -c "%g/\[\w\]/norm f[ldt]" -c "wqa" -- $MY_PATH/srv/GazeboApplyForce.srv
# /usr/bin/vim -E -s -c "%g/\[\w\]/norm f[ldt]" -c "wqa" -- $MY_PATH/msg/GpsData.msg

# print sections for CMakeLists.txt

OUT_FILE="msg_list.txt"

echo "# This file is generated, do NOT modify it by hand" >> $OUT_FILE

echo "
set(msg_files" >> $OUT_FILE
for file in $ROS1_MSGS_FILES; do
  echo "  msg/$file" >> $OUT_FILE
done
echo ")" >> $OUT_FILE

echo "
set(srv_files" >> $OUT_FILE
for file in $ROS1_SRVS_FILES; do
  echo "  srv/$file" >> $OUT_FILE
done
echo ")" >> $OUT_FILE
