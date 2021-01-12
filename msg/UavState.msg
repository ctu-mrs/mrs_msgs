std_msgs/Header header
string child_frame_id

# text names of the used estimators
mrs_msgs/EstimatorType estimator_horizontal
mrs_msgs/AltitudeType estimator_vertical
mrs_msgs/HeadingType estimator_heading

# initiated with 0
# increases if any estimator changes frame of reference
# or if any estimator is resetted
uint32 estimator_iteration

geometry_msgs/Pose pose
geometry_msgs/Twist velocity
geometry_msgs/Accel acceleration
geometry_msgs/Accel acceleration_disturbance
