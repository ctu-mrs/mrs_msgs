# MRS ROS messages

![](.fig/thumbnail.jpg)

| Build status | [![Build Status](https://github.com/ctu-mrs/mrs_msgs/workflows/Melodic/badge.svg)](https://github.com/ctu-mrs/mrs_msgs/actions) | [![Build Status](https://github.com/ctu-mrs/mrs_msgs/workflows/Noetic/badge.svg)](https://github.com/ctu-mrs/mrs_msgs/actions) | [![Build Status](https://github.com/ctu-mrs/mrs_msgs/workflows/Docs/badge.svg)](https://github.com/ctu-mrs/mrs_msgs/actions) |
|--------------|---------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|

## Documentation

[https://ctu-mrs.github.io/mrs_msgs](https://ctu-mrs.github.io/mrs_msgs).

## General points

* This packages provides definitions of custom messages and services for the whole [MRS system](https://github.com/ctu-mrs/mrs_uav_system).
* No package from within the [system](https://github.com/ctu-mrs/mrs_uav_system) should define custom messages for the following reasons:
  * Dependency graph would be much more interconnected than if all packages depend on this single package.
  * When replaying old rosbags: the only package needed to be compiled in the particular version is this one (which has no other dependencies other than the generic ROS message packages). On the other hand, if all the packages within the system generate the messages, it might be complicated to make them compile in the particular version, given their dependencies might not be satisfied anymore.


## Modifications for `ros1_bridge`

### Functional Modifications

To make the ROS 2 version of `mrs_msgs` detectable by `ros1_bridge`, the following additions were made:

- **Created a `bridge_mapping.yaml` file** in the root of the package:
```yaml
-
  ros1_package_name: 'mrs_msgs'
  ros2_package_name: 'mrs_msgs'
```

- **Installed the mapping file** in `CMakeLists.txt`:
```cmake
install(
  FILES bridge_mapping.yaml
  DESTINATION share/${PROJECT_NAME}
)
```

- **Declared the mapping in `package.xml`**:
```xml
<ros1_bridge mapping_rules="bridge_mapping.yaml"/>
```

These changes are essential for enabling `ros1_bridge` to automatically recognize and handle the custom `mrs_msgs` package.

### Bugs Encountered & Fixes (ROS 1 & ROS 2)

#### ROS 2 `.msg` and `.srv` Files Not Found
- **Issue**: ROS 2 `mrs_msgs` only installed `.idl` files, not `.msg`/`.srv`, breaking bridge generation.
- **Fix**: Added `CMake` blocks to install flattened `.msg` and `.srv` files:
```cmake
file(GLOB_RECURSE all_srv_files RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}/srv" "${CMAKE_CURRENT_SOURCE_DIR}/srv/*.srv")
foreach(srv_file ${all_srv_files})
  get_filename_component(srv_filename ${srv_file} NAME)
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/srv/${srv_file} ${CMAKE_CURRENT_BINARY_DIR}/${srv_filename} COPYONLY)
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${srv_filename} DESTINATION share/${PROJECT_NAME}/srv)
endforeach()

file(GLOB_RECURSE all_msg_files RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}/msg" "${CMAKE_CURRENT_SOURCE_DIR}/msg/*.msg")
foreach(msg_file ${all_msg_files})
  get_filename_component(msg_filename ${msg_file} NAME)
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/msg/${msg_file} ${CMAKE_CURRENT_BINARY_DIR}/${msg_filename} COPYONLY)
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${msg_filename} DESTINATION share/${PROJECT_NAME}/msg)
endforeach()
```

#### Invalid `bool[]` Fields (std::vector<bool> bridge issue)
- **Issue**: `ros1_bridge` cannot bridge `bool[]` fields, which are compiled as `std::vector<bool>` (a non-standard, problematic specialization).
- **Fix**: Replaced all `bool[]` fields with `int8[]` for safe and consistent bridging.
- **Affected file**:
  - `msg/uav_managers/ControlManagerDiagnostics.msg`
    - **Before**:
      ```
      bool[] human_switchable_controllers
      bool[] human_switchable_trackers
      ```
    - **After**:
      ```
      int8[] human_switchable_controllers
      int8[] human_switchable_trackers
      ```
  - `srv/uav_managers/TrajectoryReferenceSrv.srv`
    - **Before** (response):
      ```
      bool[] tracker_successes
      ```
    - **After**:
      ```
      int8[] tracker_successes
      ```
  - `srv/uav_managers/ValidateReferenceArray.srv`
    - **Before** (response):
      ```
      bool[] success
      ```
    - **After**:
      ```
      int8[] success
      ```

#### Incompatible `float64[4]` Arrays (boost::array vs std::array)
- **Issue**: `Vec4.srv` failed due to `boost::array` vs `std::array` incompatibility.
- **Fix**: Changes `float64[4]` to `float64[]` for safe and consistent bridging.
- **Affected files**:
  - `srv/general/Vec4.srv`
    - **Before** (response):
      ```
      float64[4] goal
      ```
    - **After**:
      ```
      float64[] goal
      ```
