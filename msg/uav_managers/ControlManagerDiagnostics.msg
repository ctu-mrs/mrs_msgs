# This reports on the state of the Control Manager and the currently active tracker and controller.

builtin_interfaces/Time stamp
string uav_name

# If the motors are enabled, in other words, if the output of the Control Manager can pass out.
bool output_enabled

# True if the UAV is flying and no special case occurred (emergency land, failsafe, bumper, joystick override).
bool flying_normally

# True if the joystick is overriding control
bool joystick_active

# True if the obstacle bumper is overriding control
bool bumper_active

# The minimum recommended desired rate of incoming UAV State
float64 desired_uav_state_rate

# The name of the currently active tracker
string active_tracker

# The status of the currently active tracker.
mrs_msgs/TrackerStatus tracker_status

# The name of the currently active controller
string active_controller

# The status of the currently active controller.
mrs_msgs/ControllerStatus controller_status

# list of controllers and trackers that are loaded and can be switched to
string[] available_controllers
string[] available_trackers

# flags reporting on whether the trackers and controller should be "human switchable", meaning,
# whether people should be "just" able to switch to them, e.g., using a GUI or TUI interface
bool[] human_switchable_controllers
bool[] human_switchable_trackers
