string    active_controller  "unknown"
string[]  available_controllers

string    active_gains       "unknown"
string[]  available_gains

string    active_tracker     "unknown"
string[]  available_trackers

string    active_constraints "unknown"
string[]  available_constraints

float32   thrust    -1.0  # [%]

# Tracker command setpoint, in the local estimation frame
mrs_msgs/Reference cmd_pose

bool      flying_normally        false
bool      have_goal              false
bool      tracking_trajectory    false
bool      callbacks_enabled      false
