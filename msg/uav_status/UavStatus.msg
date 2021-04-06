Header header

float32 control_manager_diag_hz
string[] controllers
string[] gains
string[] trackers
string[] constraints
string fly_state

float32 odom_hz
float32 odom_x
float32 odom_y
float32 odom_z
float32 odom_hdg
string odom_frame
string[] odom_estimators_hori
string[] odom_estimators_vert
string[] odom_estimators_hdg

float32 cpu_load
float32 cpu_ghz
float32 free_ram
int32 free_hdd

float32 mavros_hz
string mavros_state
string mavros_mode
string mavros_GPS_state
string mavros_GPS_qual
float32 battery_volt
float32 battery_curr
float32 thrust
float32 mass_estimate
float32 mass_set

string[] custom_topic_names
float32[] custom_topic_hz
float32[] custom_topic_hz_expected
string[] custom_string_outputs
string[] custom_services

bool flying_normally
bool have_goal
bool callbacks_enabled
