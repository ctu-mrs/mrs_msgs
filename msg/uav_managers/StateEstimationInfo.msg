std_msgs/Header header

# these are in the local frame (the one specified in the header_
mrs_msgs/Reference local_pose
geometry_msgs/Twist velocity
geometry_msgs/Accel acceleration

float64 above_ground_level_height

# this is in the global coordinates (lat/lon/alt)
mrs_msgs/Reference global_pose

string current_estimator
string[] running_estimators
string[] switchable_estimators
