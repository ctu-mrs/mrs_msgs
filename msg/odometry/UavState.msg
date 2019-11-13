std_msgs/Header header

# text names of the used estimators
string estimator_horizontal
string estimator_vertical
string estimator_heading

# initiated with 0
# increases if any estimator changes frame of reference
# or if any estimator is resetted
uint32 estimator_iteration

geometry_msgs/Pose pose
geometry_msgs/Twist velocity
geometry_msgs/Accel acceleration
geometry_msgs/Accel acceleration_disturbance
