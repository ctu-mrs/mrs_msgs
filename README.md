# mrs_msgs

![](.fig/thumbnail.jpg)

This packages provides custom messages and services for the CORE of [MRS UAV system](https://github.com/ctu-mrs/mrs_uav_system).

## Documentation

[https://ctu-mrs.github.io/mrs_msgs](https://ctu-mrs.github.io/mrs_msgs).


## Modifications from master branch

### Bugs Encountered & Fixes

#### Missing Header: `GripperDiagnostics.msg`
- **Issue**: Header for `GripperDiagnostics.msg` was missing.
- **Cause**: The message was located in `msg/mrs_gripper/` but not declared in `CMakeLists.txt`.
- **Fix**:
  - Added the following line to `bridge-noetic` CMakeLists.txt:
    ```cmake
    add_message_files(DIRECTORY msg/mrs_gripper FILES GripperDiagnostics.msg)
    ```
  - Rebuilt using `catkin_make_isolated --install`.

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
