std_msgs/Header header

geometry_msgs/Point euler_attitude
bool euler_attitude_set

geometry_msgs/Quaternion quter_attitude
bool quater_attitude_set

geometry_msgs/Point attitude_rate
bool attitude_rate_set

float64 thrust
float64 mass_difference

uint8 mode_mask
uint8 MODE_EULER_ATTITUDE=1
uint8 MODE_QUATER_ATTITUDE=2
uint8 MODE_ATTITUDE_RATE=4
