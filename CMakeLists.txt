cmake_minimum_required(VERSION 2.8.3)
project(mrs_msgs)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  std_srvs
  geometry_msgs
  message_generation
  dynamic_reconfigure
  )

###############################################
## Declare ROS messages, services and actions ##
################################################

# messages for MPC_TRACKER
add_message_files(DIRECTORY msg/mpc_tracker FILES

  TrackerPoint.msg
  TrackerPointStamped.msg
  TrackerTrajectory.msg
  TrackerDiagnostics.msg
  FuturePoint.msg
  FutureTrajectory.msg
  )

# messages for MPC_TRACKER
add_service_files(DIRECTORY srv/mpc_tracker FILES

  Vec1.srv
  Gains.srv
  TrackerTrajectorySrv.srv
  )

# messages for MRS_MULTIMASTER
add_service_files(DIRECTORY srv/mrs_multimaster FILES

  ChangeState.srv
  )

# messages for MRS_MULTIMASTER
add_service_files(DIRECTORY msg/nmea_navsat_driver FILES

  RtkGpsLocal.srv
  )

## Generate added messages and services with any dependencies listed here
generate_messages(DEPENDENCIES

  std_msgs
  geometry_msgs
  )

################################################
## Declare ROS dynamic reconfigure parameters ##
################################################

## Generate dynamic reconfigure parameters in the 'cfg' folder
# generate_dynamic_reconfigure_options(
#   cfg/DynReconf1.cfg
#   cfg/DynReconf2.cfg
# )


###################################
## catkin specific configuration ##
###################################

catkin_package(
  #  INCLUDE_DIRS include
  #  LIBRARIES data_exporter
  CATKIN_DEPENDS roscpp std_msgs message_runtime
  #  DEPENDS system_lib
  #   DEPENDS Eigen
  )

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
  #  include
  )

## Declare a C++ library
#add_library(detector
#   src/detector.cpp
#)

## Declare a C++ executable
#add_executable(mrs_msgs src/dummy.cpp)

## Add cmake target dependencies of the executable
## same as for the library above
add_dependencies( ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS} ${PROJECT_NAME}_generate_messages_cpp)

## Specify libraries to link a library or executable target against

#target_link_libraries(mrs_msgs
#   ${catkin_LIBRARIES}
#)
