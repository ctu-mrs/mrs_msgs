cmake_minimum_required(VERSION 2.8.3)
project(mrs_msgs)

set(CMAKE_CXX_FLAGS "-std=c++17 -fno-diagnostics-color")

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  std_msgs
  std_srvs
  sensor_msgs
  geometry_msgs
  cmake_modules
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

# services for MPC_TRACKER
add_service_files(DIRECTORY srv/mpc_tracker FILES

  Vec1.srv
  Gains.srv
  TrackerTrajectorySrv.srv
  MpcMatrix.srv
  )

# messages for MRS_MULTIMASTER
add_service_files(DIRECTORY srv/mrs_multimaster FILES

  ChangeState.srv
  )

# messages for MRS_ODOMETRY
add_message_files(DIRECTORY msg/odometry FILES

  GpsData.msg
  RtkGps.msg
  RtkFixType.msg
  Float64Stamped.msg
  ModelState.msg
  Fusing.msg
  EstimatorType.msg
  OdometryDiag.msg
  LkfStates.msg
  )

# messages for the MAV_MANAGER
add_message_files(DIRECTORY msg/mav_manager FILES

  PositionCommand.msg
  AttitudeCommand.msg
  TrackerStatus.msg
  ControllerStatus.msg
  EulerAngles.msg
  )

# messages for MAVROS_INTERFACE
add_message_files(DIRECTORY msg/diagnostics FILES

  MavrosState.msg
  GpsDiagnostics.msg
  SystemDiagnostics.msg
  BatteryDiagnostics.msg
  HeartbeatDiagnostics.msg
  MavrosDiagnostics.msg
  )

# messages for MRS_MULTIMASTER
add_service_files(DIRECTORY srv/mav_manager FILES

  String.srv
  Vec4.srv
  TrackerConstraints.srv
  )

# messages for the PROFILER
add_message_files(DIRECTORY msg/profiler FILES

  ProfilerUpdate.msg
  )

# messages for the MRS_ODOMETRY
add_service_files(DIRECTORY srv/mrs_odometry FILES

  ChangeEstimator.srv
  OffsetOdom.srv
  )

## Generate added messages and services with any dependencies listed here
generate_messages(DEPENDENCIES

  std_msgs
  geometry_msgs
  sensor_msgs
  )

###################################
## catkin specific configuration ##
###################################

catkin_package(
  CATKIN_DEPENDS roscpp std_msgs geometry_msgs message_runtime sensor_msgs
  LIBRARIES mrs_msgs
  )

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
  )

add_library(mrs_msgs src/main.cpp)

add_dependencies(mrs_msgs
  ${${PROJECT_NAME}_EXPORTED_TARGETS}
  ${catkin_EXPORTED_TARGETS}
  )

target_link_libraries(mrs_msgs
  ${catkin_LIBRARIES}
  )

add_custom_command(TARGET mrs_msgs
  PRE_BUILD
  WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  COMMAND bash -c "${CMAKE_CURRENT_SOURCE_DIR}/link_msg_files.sh"
  )
