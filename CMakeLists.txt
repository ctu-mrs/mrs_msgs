cmake_minimum_required(VERSION 3.5)
project(mrs_msgs)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CATKIN_DEPENDENCIES
  cmake_modules
  geometry_msgs
  message_generation
  message_runtime
  roscpp
  sensor_msgs
  std_msgs
  std_srvs
  )

find_package(catkin REQUIRED COMPONENTS
  ${CATKIN_DEPENDENCIES}
  )

# messages for MPC_TRACKER
add_message_files(DIRECTORY msg/mpc_tracker FILES

  MpcTrackerDiagnostics.msg
  FuturePoint.msg
  FutureTrajectory.msg
  MpcPredictionFullState.msg
  )

# messages for LANDOFF_TRACKER
add_message_files(DIRECTORY msg/landoff_tracker FILES

  LandoffDiagnostics.msg
  )

# messages for MRS_HW_MODULES
add_message_files(DIRECTORY msg/mrs_hw_modules FILES

  BigDofecStatus.msg
  )

# services for LLCP
add_service_files(DIRECTORY srv/llcp FILES

  SetServo.srv
  SetTrigger.srv
  )

# services for MRS_HW_MODULES
add_service_files(DIRECTORY srv/mrs_hw_modules FILES

  BigDofecArm.srv
  BigDofecLaunch.srv
  BigDofecSetPWM.srv
  BigDofecSetLeds.srv
  BigDofecSalvo.srv
  LedStripDriver.srv
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

# messages for OUSTER
add_message_files(DIRECTORY msg/ouster FILES

  OusterInfo.msg
  )

# messages for the UAV_MANAGERS
add_message_files(DIRECTORY msg/uav_managers FILES

  TrackerCommand.msg
  ControllerDiagnostics.msg
  TrackerStatus.msg
  ControllerStatus.msg
  EulerAngles.msg
  BoolStamped.msg
  ControlManagerDiagnostics.msg
  BumperStatus.msg
  Reference.msg
  VelocityReference.msg
  VelocityReferenceStamped.msg
  TrajectoryReference.msg
  PathReference.msg
  ReferenceList.msg
  ReferenceStamped.msg
  DynamicsConstraints.msg
  ControlError.msg
  ConstraintManagerDiagnostics.msg
  GainManagerDiagnostics.msg
  UavManagerDiagnostics.msg
  EstimationDiagnostics.msg
  EstimatorDiagnostics.msg
  EstimatorOutput.msg
  EstimatorInput.msg
  EstimatorCorrection.msg
  UavState.msg
  )

# messages for the UAV_STATUS
add_message_files(DIRECTORY msg/uav_status FILES

  UavStatus.msg
  UavStatusShort.msg
  CustomTopic.msg
  NodeCpuLoad.msg
  )

# messages for the SE3_CONTROLLER
add_message_files(DIRECTORY msg/se3_controller FILES

  Se3Gains.msg
  )

# messages for the TRAJECTORY_GENERATION
add_message_files(DIRECTORY msg/trajectory_generation FILES

  Path.msg
  PathWithVelocity.msg
  ReferenceWithVelocity.msg
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
add_message_files(DIRECTORY msg/gnss FILES

  Bestpos.msg
  Bestvel.msg
  Gpgga.msg
  Gpgsa.msg
  Gpgst.msg
  Gpgsv.msg
  Gpvtg.msg
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
  RtkGps.msg
  RtkFixType.msg
  GpsData.msg
  )

# services for UAV_MANAGERS
add_service_files(DIRECTORY srv/uav_managers FILES

  String.srv
  Vec4.srv
  Vec1.srv
  Float64Srv.srv
  GetFloat64.srv
  Float64StampedSrv.srv
  PlannerTask.srv
  DynamicsConstraintsSrv.srv
  ReferenceSrv.srv
  VelocityReferenceSrv.srv
  VelocityReferenceStampedSrv.srv
  ReferenceStampedSrv.srv
  TrajectoryReferenceSrv.srv
  TransformReferenceSrv.srv
  TransformPoseSrv.srv
  TransformVector3Srv.srv
  ValidateReference.srv
  ValidateReferenceList.srv
  BumperParamsSrv.srv
  ConstraintsOverride.srv
  )

# messages for the MRS_SERIAL
add_message_files(DIRECTORY msg/mrs_serial FILES

  BacaProtocol.msg
  SerialRaw.msg
  GimbalPRY.msg
  TarotGimbalState.msg
  )

# messages for the GRIPPER
add_message_files(DIRECTORY msg/mrs_gripper FILES

  GripperDiagnostics.msg
  )

# messages for the PARACHUTE
add_message_files(DIRECTORY msg/parachute FILES

  ParachuteDiagnostics.msg
  )

# messages for the PROFILER
add_message_files(DIRECTORY msg/profiler FILES

  ProfilerUpdate.msg
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

# uvdar messages
add_message_files(DIRECTORY msg/uvdar FILES
  Int32MultiArrayStamped.msg
  Point2DWithFloat.msg
  ImagePointsWithFloatStamped.msg
  )

# sxd messages
add_message_files(DIRECTORY msg/sxd FILES
  SxdMeasurement.msg
  SxdHistogram.msg
  SxdDiagnostics.msg
  )

# general messages
add_message_files(DIRECTORY msg/general FILES
  Sphere.msg
  PoseWithCovarianceIdentified.msg
  PoseWithCovarianceArrayStamped.msg
  Track.msg
  TrackStamped.msg
  TrackArrayStamped.msg
  NimbroTest.msg
  ImageLabeled.msg
  ImageLabeledArray.msg
  Float64.msg
  Float64Stamped.msg
  Float64ArrayStamped.msg
  Float64MultiArrayStamped.msg
  StringStamped.msg
  )

# general services
add_service_files(DIRECTORY srv/general FILES

  SetInt.srv
  NimbroTestSrv.srv
  )

# simulation messages
add_message_files(DIRECTORY msg/simulation FILES
  SpawnerDiagnostics.msg
  )

# services for TRAJECTORY_GENERATION
add_service_files(DIRECTORY srv/trajectory_generation FILES

  PathSrv.srv
  GetPathSrv.srv
  )

# pathfinder messages
add_message_files(DIRECTORY msg/pathfinder FILES
  PathfinderDiagnostics.msg
  )

# messages for stamped_msgs
add_message_files(DIRECTORY msg/stamped_msgs FILES

  UInt16Stamped.msg
  )

# messages for mrs_pcl_tools
add_message_files(DIRECTORY msg/mrs_pcl_tools FILES

  PclToolsDiagnostics.msg
  )

add_message_files(DIRECTORY msg/mrs_llcp FILES

  Llcp.msg
  )

add_message_files(DIRECTORY msg/radar FILES

  RadarData.msg
  )

add_message_files(DIRECTORY msg/hw_api FILES

  HwApiActuatorCmd.msg
  HwApiAttitudeCmd.msg
  HwApiAttitudeRateCmd.msg
  HwApiControlGroupCmd.msg
  HwApiStatus.msg
  HwApiCapabilities.msg
  HwApiPositionCmd.msg
  HwApiVelocityHdgCmd.msg
  HwApiVelocityHdgRateCmd.msg
  HwApiAccelerationHdgCmd.msg
  HwApiAccelerationHdgRateCmd.msg
  HwApiRcChannels.msg
  HwApiAltitude.msg
  )

## Generate added messages and services with any dependencies listed here
generate_messages(DEPENDENCIES

  std_msgs
  geometry_msgs
  sensor_msgs
  )

set(LIBRARIES
  MrsMsgs_Main
  )

catkin_package(
  LIBRARIES ${LIBRARIES}
  CATKIN_DEPENDS ${CATKIN_DEPENDENCIES}
  )

include_directories(
  ${catkin_INCLUDE_DIRS}
  )

add_library(MrsMsgs_Main
  src/main.cpp
  )

add_dependencies(MrsMsgs_Main
  ${${PROJECT_NAME}_EXPORTED_TARGETS}
  ${catkin_EXPORTED_TARGETS}
  )

target_link_libraries(MrsMsgs_Main
  ${catkin_LIBRARIES}
  )

add_custom_command(TARGET MrsMsgs_Main
  PRE_BUILD
  WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  COMMAND bash -c "${CMAKE_CURRENT_SOURCE_DIR}/link_msg_files.sh"
  )

## --------------------------------------------------------------
## |                           Install                          |
## --------------------------------------------------------------

install(TARGETS ${LIBRARIES}
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION}
  )

install(DIRECTORY msg srv
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  )

install(DIRECTORY
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  FILES_MATCHING PATTERN "*.xml"
  )
