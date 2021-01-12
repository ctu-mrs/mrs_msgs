cmake_minimum_required(VERSION 3.5)
project(mrs_msgs)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(ament_cmake REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
find_package(std_srvs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

set(msg_files

  # messages for MPC_TRACKER
  msg/MpcTrackerDiagnostics.msg
  msg/FuturePoint.msg
  msg/FutureTrajectory.msg

  # messages for LANDOFF_TRACKER
  msg/LandoffDiagnostics.msg

  # messages for MRS_ODOMETRY
  msg/GpsData.msg
  msg/RtkGps.msg
  msg/RtkFixType.msg
  msg/Float64ArrayStamped.msg
  msg/Float64MultiArrayStamped.msg
  msg/Float64Stamped.msg
  msg/ModelState.msg
  msg/Fusing.msg
  msg/EstimatorType.msg
  msg/OdometryDiag.msg
  msg/EspOdometry.msg
  msg/EstimatedState.msg
  msg/LkfStates.msg
  msg/Altitude.msg
  msg/AltitudeStateNames.msg
  msg/AltitudeType.msg
  msg/Heading.msg
  msg/HeadingStateNames.msg
  msg/HeadingType.msg
  msg/UavState.msg

  # messages for OUSTER
  msg/OusterInfo.msg

  # messages for the UAV_MANAGERS
  msg/PositionCommand.msg
  msg/AttitudeCommand.msg
  msg/TrackerStatus.msg
  msg/ControllerStatus.msg
  msg/EulerAngles.msg
  msg/BoolStamped.msg
  msg/ControlManagerDiagnostics.msg
  msg/BumperStatus.msg
  msg/Reference.msg
  msg/TrajectoryReference.msg
  msg/PathReference.msg
  msg/ReferenceList.msg
  msg/ReferenceStamped.msg
  msg/Float64.msg
  msg/DynamicsConstraints.msg
  msg/ControlError.msg
  msg/ConstraintManagerDiagnostics.msg
  msg/GainManagerDiagnostics.msg

  # messages for the SE3_CONTROLLER
  msg/Se3Gains.msg

  # messages for the TRAJECTORY_GENERATION
  msg/Path.msg

  # messages for MAVROS_INTERFACE
  msg/MavrosState.msg
  msg/GpsDiagnostics.msg
  msg/SystemDiagnostics.msg
  msg/BatteryDiagnostics.msg
  msg/HeartbeatDiagnostics.msg
  msg/MavrosDiagnostics.msg

  # messages for TERSUS_GPS
  msg/Bestpos.msg
  msg/Bestvel.msg
  msg/Gpgga.msg
  msg/Gpgsa.msg
  msg/Gpgsv.msg
  msg/Gprmc.msg
  msg/GPSFix.msg
  msg/GpsStatus.msg
  msg/RangeInformation.msg
  msg/Range.msg
  msg/Satellite.msg
  msg/TersusMessageHeader.msg
  msg/Time.msg
  msg/TrackstatChannel.msg
  msg/Trackstat.msg

  # messages for the MRS_SERIAL
  msg/BacaProtocol.msg
  msg/SerialRaw.msg

  # messages for the GRIPPER
  msg/GripperDiagnostics.msg

  # messages for the PARACHUTE
  msg/ParachuteDiagnostics.msg

  # messages for the PROFILER
  msg/ProfilerUpdate.msg

  # messages for the MRS_BUMPER
  msg/Histogram.msg
  msg/ObstacleSectors.msg

  # messages for SPEED_TRACKER
  msg/SpeedTrackerCommand.msg

  # messages for UVDAR
  msg/Int32MultiArrayStamped.msg
  msg/Point2DWithFloat.msg
  msg/ImagePointsWithFloatStamped.msg

  # messages for SXD
  msg/SxdMeasurement.msg
  msg/SxdHistogram.msg
  msg/SxdDiagnostics.msg

  # general messages
  msg/PoseWithCovarianceIdentified.msg
  msg/PoseWithCovarianceArrayStamped.msg
)

set(srv_files

  # services for GAZEBO_ROS_INTERFACE
  srv/GazeboApplyForce.srv
  srv/GazeboAttach.srv
  srv/GazeboAttachTyped.srv
  srv/GazeboDeleteModel.srv

  # services for MRS_MULTIMASTER
  srv/ChangeState.srv

  # services for UAV_MANAGERS
  srv/String.srv
  srv/Vec4.srv
  srv/Vec1.srv
  srv/Float64Srv.srv
  srv/GetFloat64.srv
  srv/Float64StampedSrv.srv
  srv/PlannerTask.srv
  srv/DynamicsConstraintsSrv.srv
  srv/ReferenceSrv.srv
  srv/ReferenceStampedSrv.srv
  srv/TrajectoryReferenceSrv.srv
  srv/TransformReferenceSrv.srv
  srv/TransformPoseSrv.srv
  srv/TransformVector3Srv.srv
  srv/ValidateReference.srv
  srv/ValidateReferenceList.srv
  srv/BumperParamsSrv.srv

  # services for the MRS_ODOMETRY
  srv/ChangeEstimator.srv
  srv/ChangeHdgEstimator.srv
  srv/ChangeAltEstimator.srv
  srv/OffsetOdom.srv

  # general services
  srv/SetInt.srv

  # services for TRAJECTORY_GENERATION
  srv/PathSrv.srv
)

rosidl_generate_interfaces(${PROJECT_NAME}
    ${msg_files}
    ${srv_files}
    DEPENDENCIES builtin_interfaces geometry_msgs std_msgs sensor_msgs std_srvs
  )

ament_export_dependencies(rosidl_default_runtime)
ament_package()
