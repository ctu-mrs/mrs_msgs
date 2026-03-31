cmake_minimum_required(VERSION 3.28)
project(mrs_msgs)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(ENABLE_TESTS "Enable tests building" ON)
option(ENABLE_MRS_MSGS_DOCS_BUILD "Allow documentation generation" OFF)
option(MRS_MSGS_DOCS_BUILD_ONLY "Set documentation generation build only" OFF)

## --------------------------------------------------------------
## |               Custom ROS messages definitions              |
## --------------------------------------------------------------

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

## --------------------------------------------------------------
## |                Generating the build symlinks               |
## --------------------------------------------------------------

# Set the base directory for custom msgs in the BUILD folder
set(GEN_INTERFACE_BASE_DIR "${CMAKE_CURRENT_BINARY_DIR}/gen_interfaces")
file(MAKE_DIRECTORY "${GEN_INTERFACE_BASE_DIR}/msg")
file(MAKE_DIRECTORY "${GEN_INTERFACE_BASE_DIR}/srv")
file(MAKE_DIRECTORY "${GEN_INTERFACE_BASE_DIR}/action")

# Run the script to create the flat symlinks in the root msg/, srv/, and action/ folders
execute_process(
  COMMAND /bin/bash "${CMAKE_CURRENT_SOURCE_DIR}/scripts/link_msg_files.sh" "${GEN_INTERFACE_BASE_DIR}" ${msg_files} ${srv_files} ${action_files}
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
  RESULT_VARIABLE SCRIPT_RESULT
  ERROR_VARIABLE SCRIPT_ERROR
)

if(NOT SCRIPT_RESULT EQUAL 0)
  message(FATAL_ERROR 
    "link_msg_files.sh script failed with exit code ${SCRIPT_RESULT}.\n"
    "Error details: ${SCRIPT_ERROR}"
    )
endif()

## --------------------------------------------------------------
## |                     Documentation build                    |
## --------------------------------------------------------------

find_program(ROSDOC2_EXECUTABLE rosdoc2)

# Always register the manual docs target
add_custom_target(docs
    COMMAND /bin/bash "${CMAKE_CURRENT_SOURCE_DIR}/scripts/generate_docs.sh" "${GEN_INTERFACE_BASE_DIR}"
    COMMENT "Generating documentation with rosdoc2..."
    VERBATIM
)

# If automatic build is requested, validate and link to 'ALL'
if(ENABLE_MRS_MSGS_DOCS_BUILD OR MRS_MSGS_DOCS_BUILD_ONLY)

    if(NOT ROSDOC2_EXECUTABLE)
        message(FATAL_ERROR
            "rosdoc2 not found! Documentation build is enabled but the tool is missing.\n"
            "Please install it: sudo apt install python3-rosdoc2\n"
            "Or disable docs: --cmake-args -DENABLE_MRS_MSGS_DOCS_BUILD=OFF -DMRS_MSGS_DOCS_BUILD_ONLY=OFF"
        )
    endif()

    message(STATUS "mrs_msgs: Documentation will build automatically ('docs_auto' linked to 'ALL')")

    add_custom_target(docs_auto ALL)
    add_dependencies(docs_auto docs)
endif()

if(MRS_MSGS_DOCS_BUILD_ONLY)
  message(STATUS "mrs_msgs: Documentation-only mode active. Exiting.")
  return()
endif()

## --------------------------------------------------------------
## |                     ROS messages build                     |
## --------------------------------------------------------------

find_package(ament_cmake REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)
find_package(std_srvs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

set(rosidl_files "")

foreach(msg_path ${msg_files})
    cmake_path(GET msg_path FILENAME msg_name)
    list(APPEND rosidl_files "${GEN_INTERFACE_BASE_DIR}:msg/${msg_name}")
endforeach()

foreach(srv_path ${srv_files})
    cmake_path(GET srv_path FILENAME srv_name)
    list(APPEND rosidl_files "${GEN_INTERFACE_BASE_DIR}:srv/${srv_name}")
endforeach()

foreach(action_path ${action_files})
    cmake_path(GET action_path FILENAME action_name)
    list(APPEND rosidl_files "${GEN_INTERFACE_BASE_DIR}:action/${action_name}")
endforeach()

rosidl_generate_interfaces(${PROJECT_NAME}
  ${rosidl_files}
  DEPENDENCIES builtin_interfaces geometry_msgs std_msgs sensor_msgs std_srvs
)

## --------------------------------------------------------------
## |                           Testing                          |
## --------------------------------------------------------------

if(ENABLE_TESTS)

  add_subdirectory(test)

endif()

## --------------------------------------------------------------
## |                         ROS install                        |
## --------------------------------------------------------------

ament_export_dependencies(rosidl_default_runtime)
ament_package()
