#include <ros/package.h>
#include <ros/ros.h>

int main(int argc, char** argv) {

  ros::init(argc, argv, "trackers_manager");

  ROS_INFO("It works!");

  return 0;
}