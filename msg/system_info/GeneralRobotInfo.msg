builtin_interfaces/Time stamp

string robot_name
string robot_ip_address

# Identifier of the robot type.
uint8 ROBOT_TYPE_DRONE=0
uint8 ROBOT_TYPE_BOAT=1
uint8 ROBOT_TYPE_GROUND_ROBOT=2
uint8 robot_type

# True when automatic takeoff can begin: all preflight checks pass and the UAV is in OFFBOARD.
bool ready_for_automatic_takeoff
mrs_msgs/PreflightStatus preflight_status

# What is still missing before automatic takeoff: failed preflight checks and pending
# safety-pilot steps (arming, switching to OFFBOARD), reported by the diagnostics node.
string[] missing_for_automatic_takeoff
# List of problems that occurred during operation, reported by the diagnostics node.
string[] errors

# Current battery state, voltage, percentage, wh_drained.
mrs_msgs/BatteryState battery_state
