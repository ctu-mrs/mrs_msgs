# This represents an output of a UAV feedback controller (mrs_uav_manager::Controller).
# This message is returned from a controller by means of the update() function, called by the mrs_uav_manager::ControlManager.

std_msgs/Header header

# The name of the controller (implementation-wise).
# Beware, multiple instances of the same controller can be running.
# The ControlManagerDiagnostics message contains the name given them
# by the ControlManager.
string controller

# True if the controller is in the initial rampup phase (just after activation).
bool ramping_up

# The desired orientation produced by the controller.
# This field should be filled every time.
geometry_msgs/Quaternion attitude

# The desired attitude rate produced by the controller.
# This field is optional.
geometry_msgs/Point attitude_rate

# Desired acceleration produced by the controller.
# This field is mandatory if flying with "mrs_odometry".
# The desired acceleration should be without calculate without
# compensation of external forces and disturbances, e.g., without
# the compensation for the gravity vector, wind and internal UAV biases.
geometry_msgs/Point desired_acceleration

# The desired thrust, [0, 1].
float64 thrust

# The estimated mass difference from the nominal mass.
float64 mass_difference

# Total estimated UAV mass.
float64 total_mass

# World-frame disturbances expressed in the world frame.
float64 disturbance_wx_w
float64 disturbance_wy_w

# Body-frame (fcu_untilted) disturbances expressed in the world frame.
float64 disturbance_bx_w
float64 disturbance_by_w

# Body-frame (fcu_untilted) disturbances expressed in the body frame (fcu_untilted).
float64 disturbance_bx_b
float64 disturbance_by_b

# The controller can enforce dynamics constraints over the trackers.
# This can be used when flying with a controller that is limited to
# some maximum speed and acceleration.
bool controller_enforcing_constraints
float64 horizontal_speed_constraint
float64 horizontal_acc_constraint
float64 vertical_asc_speed_constraint
float64 vertical_asc_acc_constraint
float64 vertical_desc_speed_constraint
float64 vertical_desc_acc_constraint

# Defines what output should be used, whether the attitude
# or the attitude rate.
uint8 mode_mask
uint8 MODE_ATTITUDE=1
uint8 MODE_ATTITUDE_RATE=2
