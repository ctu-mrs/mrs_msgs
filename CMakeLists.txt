cmake_minimum_required(VERSION 3.5)
project(mrs_msgs)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(ament_cmake REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)
find_package(std_srvs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

set(msg_files
  msg/bumper/Histogram.msg
  msg/bumper/ObstacleSectors.msg
  msg/errorgraph/ErrorgraphElement.msg
  msg/errorgraph/ErrorgraphElementArray.msg
  msg/errorgraph/ErrorgraphError.msg
  msg/errorgraph/ErrorgraphNodeID.msg
  msg/gazebo_simulation/GazeboSpawnerDiagnostics.msg
  msg/general/Float64.msg
  msg/general/Float64ArrayStamped.msg
  msg/general/Float64MultiArrayStamped.msg
  msg/general/Float64Stamped.msg
  msg/general/ImageLabeled.msg
  msg/general/ImageLabeledArray.msg
  msg/general/Point2D.msg
  msg/general/PoseWithCovarianceArrayStamped.msg
  msg/general/PoseWithCovarianceIdentified.msg
  msg/general/Prism.msg
  msg/general/RangeWithCovarianceArrayStamped.msg
  msg/general/RangeWithCovarianceIdentified.msg
  msg/general/Sphere.msg
  msg/general/StringStamped.msg
  msg/general/Track.msg
  msg/general/TrackArrayStamped.msg
  msg/general/TrackStamped.msg
  msg/gimbal/GimbalState.msg
  msg/gnss/GpsData.msg
  msg/gnss/GpsInfo.msg
  msg/gnss/RtkFixType.msg
  msg/gnss/RtkGps.msg
  msg/hw_api/HwApiAccelerationHdgCmd.msg
  msg/hw_api/HwApiAccelerationHdgRateCmd.msg
  msg/hw_api/HwApiActuatorCmd.msg
  msg/hw_api/HwApiAltitude.msg
  msg/hw_api/HwApiAttitudeCmd.msg
  msg/hw_api/HwApiAttitudeRateCmd.msg
  msg/hw_api/HwApiCapabilities.msg
  msg/hw_api/HwApiControlGroupCmd.msg
  msg/hw_api/HwApiPositionCmd.msg
  msg/hw_api/HwApiRcChannels.msg
  msg/hw_api/HwApiStatus.msg
  msg/hw_api/HwApiVelocityHdgCmd.msg
  msg/hw_api/HwApiVelocityHdgRateCmd.msg
  msg/landoff_tracker/LandoffDiagnostics.msg
  msg/mpc_tracker/FuturePoint.msg
  msg/mpc_tracker/FutureTrajectory.msg
  msg/mpc_tracker/MpcPredictionFullState.msg
  msg/mpc_tracker/MpcTrackerDiagnostics.msg
  msg/mrs_gripper/GripperDiagnostics.msg
  msg/profiler/ProfilerUpdate.msg
  msg/robot_diagnostics/UavDiagnostics.msg
  msg/se3_controller/Se3Gains.msg
  msg/speed_tracker/SpeedTrackerCommand.msg
  msg/stamped_msgs/BoolStamped.msg
  msg/stamped_msgs/UInt16Stamped.msg
  msg/trajectory_generation/Path.msg
  msg/trajectory_generation/PathWithVelocity.msg
  msg/trajectory_generation/ReferenceWithVelocity.msg
  msg/uav_managers/ConstraintManagerDiagnostics.msg
  msg/uav_managers/ControlError.msg
  msg/uav_managers/ControlManagerDiagnostics.msg
  msg/uav_managers/ControllerDiagnostics.msg
  msg/uav_managers/ControllerStatus.msg
  msg/uav_managers/DynamicsConstraints.msg
  msg/uav_managers/EstimationDiagnostics.msg
  msg/uav_managers/EstimatorCorrection.msg
  msg/uav_managers/EstimatorDiagnostics.msg
  msg/uav_managers/EstimatorInput.msg
  msg/uav_managers/EstimatorOutput.msg
  msg/uav_managers/EulerAngles.msg
  msg/uav_managers/GainManagerDiagnostics.msg
  msg/uav_managers/PathReference.msg
  msg/uav_managers/Reference.msg
  msg/uav_managers/ReferenceArray.msg
  msg/uav_managers/ReferenceStamped.msg
  msg/uav_managers/SafetyAreaManagerDiagnostics.msg
  msg/uav_managers/SafetyBorder.msg
  msg/uav_managers/TrackerCommand.msg
  msg/uav_managers/TrackerStatus.msg
  msg/uav_managers/TrajectoryReference.msg
  msg/uav_managers/UavManagerDiagnostics.msg
  msg/uav_managers/UavState.msg
  msg/uav_managers/VelocityReference.msg
  msg/uav_managers/VelocityReferenceStamped.msg
  msg/uav_managers/WorldOrigin.msg
  msg/uav_status/CustomTopic.msg
  msg/uav_status/NodeCpuLoad.msg
  msg/uav_status/UavStatus.msg
  msg/uav_status/UavStatusShort.msg
)

set(srv_files
  srv/general/Float64Srv.srv
  srv/general/Float64StampedSrv.srv
  srv/general/GetBoolSrv.srv
  srv/general/GetFloat64.srv
  srv/general/SetInt.srv
  srv/general/String.srv
  srv/general/Vec1.srv
  srv/general/Vec4.srv
  srv/multirotor_simulator/Kill.srv
  srv/multirotor_simulator/Spawn.srv
  srv/trajectory_generation/GetPathSrv.srv
  srv/trajectory_generation/PathSrv.srv
  srv/uav_managers/ConstraintsOverride.srv
  srv/uav_managers/DynamicsConstraintsSrv.srv
  srv/uav_managers/GetReferenceStampedSrv.srv
  srv/uav_managers/ReferenceSrv.srv
  srv/uav_managers/ReferenceStampedSrv.srv
  srv/uav_managers/SetObstacleSrv.srv
  srv/uav_managers/SetSafetyBorderSrv.srv
  srv/uav_managers/TrajectoryReferenceSrv.srv
  srv/uav_managers/TransformPoseSrv.srv
  srv/uav_managers/TransformReferenceArraySrv.srv
  srv/uav_managers/TransformReferenceSrv.srv
  srv/uav_managers/TransformVector3Srv.srv
  srv/uav_managers/ValidatePathToPointSrv.srv
  srv/uav_managers/ValidateReference.srv
  srv/uav_managers/ValidateReferenceArray.srv
  srv/uav_managers/VelocityReferenceSrv.srv
  srv/uav_managers/VelocityReferenceStampedSrv.srv
)

set(action_files "")

# Run the script to create the flat symlinks in the root msg/, srv/, and action/ folders
execute_process(
  COMMAND /bin/bash "${CMAKE_CURRENT_SOURCE_DIR}/scripts/link_msg_files.sh" ${msg_files} ${srv_files} ${action_files}
  WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  RESULT_VARIABLE SCRIPT_RESULT
  ERROR_VARIABLE SCRIPT_ERROR
)

if(NOT SCRIPT_RESULT EQUAL 0)
  message(FATAL_ERROR 
    "Symlink script failed with exit code ${SCRIPT_RESULT}.\n"
    "Error details: ${SCRIPT_ERROR}"
    )
endif()

# We transform the list: "msg/folder/File.msg" -> "msg/File.msg"
set(flat_msg_files "")
foreach(msg_path ${msg_files})
    get_filename_component(msg_name ${msg_path} NAME)
    list(APPEND flat_msg_files "msg/${msg_name}")
endforeach()

set(flat_srv_files "")
foreach(srv_path ${srv_files})
    get_filename_component(srv_name ${srv_path} NAME)
    list(APPEND flat_srv_files "srv/${srv_name}")
endforeach()

set(flat_action_files "")
foreach(action_path ${action_files})
    get_filename_component(action_name ${action_path} NAME)
    list(APPEND flat_action_files "action/${action_name}")
endforeach()

rosidl_generate_interfaces(${PROJECT_NAME}
  ${flat_msg_files}
  ${flat_srv_files}
  ${flat_action_files}
  DEPENDENCIES builtin_interfaces geometry_msgs std_msgs sensor_msgs std_srvs
)

## --------------------------------------------------------------
## |                           Testing                          |
## --------------------------------------------------------------

if(ENABLE_TESTS)

  add_subdirectory(test)

endif()

## --------------------------------------------------------------
## |                           Install                          |
## --------------------------------------------------------------

ament_package()
