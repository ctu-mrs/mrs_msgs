std_msgs/Header header

# These msgs are in the local frame (the one specified in the header
# Pose in the local estimation frame (frame_id specified in header).
# position: [m] in the local coordinate system.
# heading: [rad] 
mrs_msgs/Reference local_pose
geometry_msgs/Twist velocity
geometry_msgs/Accel acceleration

float64 above_ground_level_height #[meters]

# this is in the global coordinates (lat/lon/alt)
# Pose in global geodetic coordinates.
# position.x = latitude [deg], position.y = longitude [deg], position.z = altitude [m] (WGS84).
# heading: [rad] 
mrs_msgs/Reference global_pose

string current_estimator
string[] running_estimators
string[] switchable_estimators
