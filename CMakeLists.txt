cmake_minimum_required(VERSION 2.8.3)
project(mrs_msgs)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -fno-diagnostics-color")

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

  MpcTrackerDiagnostics.msg
  FuturePoint.msg
  FutureTrajectory.msg
  )

# messages for LANDOFF_TRACKER
add_message_files(DIRECTORY msg/landoff_tracker FILES

  LandoffDiagnostics.msg
  )

# services for MRS_MULTIMASTER
add_service_files(DIRECTORY srv/multimaster FILES

  ChangeState.srv
  )

# services for GAZEBO_ROS_INTERFACE
add_service_files(DIRECTORY srv/gazebo_ros_interface FILES

  GazeboApplyForce.srv
  GazeboAttach.srv
  GazeboAttachTyped.srv
  GazeboDeleteModel.srv
  )

# messages for MRS_ODOMETRY
add_message_files(DIRECTORY msg/odometry FILES

  GpsData.msg
  RtkGps.msg
  RtkFixType.msg
  Float64ArrayStamped.msg
  Float64MultiArrayStamped.msg
  Float64Stamped.msg
  ModelState.msg
  Fusing.msg
  EstimatorType.msg
  OdometryDiag.msg
  EspOdometry.msg
  EstimatedState.msg
  LkfStates.msg
  Altitude.msg
  AltitudeStateNames.msg
  AltitudeType.msg
  Heading.msg
  HeadingStateNames.msg
  HeadingType.msg
  UavState.msg
  )

# messages for the CONTROL_MANAGER
add_message_files(DIRECTORY msg/control_manager FILES

  PositionCommand.msg
  AttitudeCommand.msg
  TrackerStatus.msg
  ControllerStatus.msg
  EulerAngles.msg
  BoolStamped.msg
  ControlManagerDiagnostics.msg
  BumperStatus.msg
  Reference.msg
  TrajectoryReference.msg
  ReferenceList.msg
  ReferenceStamped.msg
  Float64.msg
  TrackerConstraints.msg
  ControlError.msg
  ConstraintManagerDiagnostics.msg
  GainManagerDiagnostics.msg
  So3Gains.msg
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

# messages for TERSUS_GPS
add_message_files(DIRECTORY msg/tersus_gps FILES

  Bestpos.msg
  Bestvel.msg
  Gpgga.msg
  Gpgsa.msg
  Gpgsv.msg
  Gprmc.msg
  GPSFix.msg
  GpsStatus.msg
  RangeInformation.msg
  Range.msg
  Satellite.msg
  TersusMessageHeader.msg
  Time.msg
  TrackstatChannel.msg
  Trackstat.msg
  )

# services for CONTROL_MANAGER
add_service_files(DIRECTORY srv/control_manager FILES

  String.srv
  Vec4.srv
  Vec1.srv
  Float64Srv.srv
  GetFloat64.srv
  Float64StampedSrv.srv
  PlannerTask.srv
  TrackerConstraintsSrv.srv
  ReferenceSrv.srv
  ReferenceStampedSrv.srv
  TrajectoryReferenceSrv.srv
  TransformReferenceSrv.srv
  TransformPoseSrv.srv
  TransformVector3Srv.srv
  ValidateReference.srv
  ValidateReferenceList.srv
  BumperParamsSrv.srv
  )

# messages for the MRS_SERIAL
add_message_files(DIRECTORY msg/mrs_serial FILES

  BacaProtocol.msg
  SerialRaw.msg
  )

# messages for the GRIPPER
add_message_files(DIRECTORY msg/mrs_gripper FILES

  GripperDiagnostics.msg
  )

# messages for the PROFILER
add_message_files(DIRECTORY msg/profiler FILES

  ProfilerUpdate.msg
  )

# services for the MRS_ODOMETRY
add_service_files(DIRECTORY srv/odometry FILES

  ChangeEstimator.srv
  ChangeHdgEstimator.srv
  ChangeAltEstimator.srv
  OffsetOdom.srv
  )

# messages for the MRS_BUMPER
add_message_files(DIRECTORY msg/bumper FILES

  Histogram.msg
  ObstacleSectors.msg
  )

# messages for SPEED_TRACKER
add_message_files(DIRECTORY msg/speed_tracker FILES

  SpeedTrackerCommand.msg
  )

# messages for FIRE_DETECT
add_message_files(DIRECTORY msg/fire_detect FILES

  PoseWithCovarianceArrayStamped.msg
  )

# general services
add_service_files(DIRECTORY srv/general FILES

  SetInt.srv
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
