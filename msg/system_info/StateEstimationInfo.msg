std_msgs/Header header

# These messages are in the local frame (the one specified in the header
# Pose in the local estimation frame (frame_id specified in header).
# position: [m] in the local coordinate system.
# heading: [rad] 
mrs_msgs/Reference local_pose
geometry_msgs/Twist velocity
geometry_msgs/Accel acceleration

float64 above_ground_level_height # [m]

# This is in the global coordinates (lat/lon/alt)
# Pose in global geodetic coordinates.
# position.x = latitude [deg], position.y = longitude [deg], position.z = altitude [m] (WGS84).
# heading: [rad] 
mrs_msgs/Reference global_pose

string current_estimator
string[] running_estimators
string[] switchable_estimators

# Per-axis active estimator names
string   horizontal_estimator  "unknown"
string   vertical_estimator    "unknown"
string   heading_estimator     "unknown"
string   agl_estimator         "unknown"

# Maximum allowed Z coordinate of the UAV [m]
float32  max_flight_z          -1.0
