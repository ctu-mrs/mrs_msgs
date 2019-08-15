std_msgs/Header header

geometry_msgs/Point euler_attitude
bool euler_attitude_set

geometry_msgs/Quaternion quter_attitude
bool quater_attitude_set

geometry_msgs/Point attitude_rate
bool attitude_rate_set

geometry_msgs/Point desired_acceleration

float64 thrust
float64 mass_difference
float64 total_mass

float64 disturbance_wx_w
float64 disturbance_wy_w

float64 disturbance_bx_w
float64 disturbance_by_w

float64 disturbance_bx_b
float64 disturbance_by_b

uint8 mode_mask
uint8 MODE_EULER_ATTITUDE=1
uint8 MODE_QUATER_ATTITUDE=2
uint8 MODE_ATTITUDE_RATE=4
