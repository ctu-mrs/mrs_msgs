builtin_interfaces/Time stamp
string robot_name
string robot_ip_address

# Identifier of the robot type, e.g., "drone: 0", "boat: 1", "ground robot: 2". 
uint8  robot_type
bool ready_to_start

# List of problems preventing the robot from starting, reported by the diagnostics node. 
string[] problems_preventing_start
# List of problems that occurred during operation, reported by the diagnostics node.
string[] errors

#Current battery state, voltage, percentage, wh_drained. 
mrs_msgs/BatteryState battery_state
