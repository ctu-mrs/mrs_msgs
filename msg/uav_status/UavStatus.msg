# Standard ROS header with stamp and coordinate frame ID
std_msgs/Header header

# Unique name of the UAV
string uav_name
# Name of the UAV model
string uav_type
# The current estimated UAV's mass as a string for display purposes
string uav_mass

# Frequency of receiving the Control Manager diagnostics
float32 control_manager_diag_hz
# Display color (for TUI visualization purposes)
int16 control_manager_diag_color
# A list of the available control algorithms, the first element is the active controller
string[] controllers
# A list of the available control gain presets for the current controller, the first element is the active preset
string[] gains
# A list of the available trajectory tracking (pre-shaping) algorithms, the first element is the active algorithm
string[] trackers
# A list of the available dynamic constraint presets for the current tracker, the first element is the active preset
string[] constraints
# True if the null (no-output) tracker is active
bool null_tracker
# Flight time
uint32 secs_flown

# Frequency of receiving the Estimation Manager diagnostics
float32 odom_hz
# Display color (for TUI visualization purposes)
int16 odom_color
# X position of the UAV in the current estimation coordinate frame
float32 odom_x
# Y position of the UAV in the current estimation coordinate frame
float32 odom_y
# Z position of the UAV in the current estimation coordinate frame
float32 odom_z
# Heading of the UAV in the current estimation coordinate frame
float32 odom_hdg
# Name of the current estimation coordinate frame
string odom_frame
# A list of the available ego-state estimation sources, the first element is the active source
string[] odom_estimators
# Name of the current source used for estimation of the UAV's horizontal position
string horizontal_estimator
# Name of the current source used for estimation of the UAV's vertical position
string vertical_estimator
# Name of the current source used for estimation of the UAV's heading
string heading_estimator
# Name of the current source used for estimation of the UAV's above ground level
string agl_estimator
# Maximal allowed Z coordinate of the UAV
float32 max_flight_z

# Setpoint X position of the UAV in the current estimation coordinate frame
float32 cmd_x
# Setpoint Y position of the UAV in the current estimation coordinate frame
float32 cmd_y
# Setpoint Z position of the UAV in the current estimation coordinate frame
float32 cmd_z
# Setpoint heading of the UAV in the current estimation coordinate frame
float32 cmd_hdg

# Current load of the CPU in percent relative all CPU cores (i.e. a maximal load of a 2-core CPU is 100.0)
float32 cpu_load
# Current load of the CPU in percent relative to a single CPU core (i.e. a maximal load of a 2-core CPU is 200.0)
float32 cpu_load_total
# Current average frequency of the CPU in gigahertz
float32 cpu_ghz
# Current temperature of the CPU in degrees Celsius (or zero if not supported by the current system)
float32 cpu_temperature
# The amount of free RAM in gigabytes
float32 free_ram
# The total available RAM in gigabytes
float32 total_ram
# The amount of free disk space in gigabytes
int32 free_hdd

# Frequency of receiving the Hardware API diagnostics
float32 hw_api_hz
# Display color (for TUI visualization purposes)
int16 hw_api_color
# Frequency of receiving the battery status from the Hardware API
float32 hw_api_battery_hz
# Frequency of receiving the Hardware API status
float32 hw_api_state_hz
# Frequency of receiving the Hardware API commanded setpoint
float32 hw_api_cmd_hz
# Name of the current mode reported by the Hardware API (e.g.: "OFFBOARD", "AUTO.LAND", etc.)
string hw_api_mode
# True if the vehicle is armed (actuator movement is enabled)
bool hw_api_armed
# True if the GPS data is being received correctly
bool hw_api_gnss_ok
# A measure of the GPS position quality
float32 hw_api_gnss_qual
# Frequency of receiving the magnetic field norm
float32 mag_norm_hz

# Gnss fix type
# 0 -> No GPS connected
# 1 -> No position information, GPS is connected
# 2 -> 2D position
# 3 -> 3D position
# 4 -> DGPS/SBAS aided 3D position
# 5 -> TK float, 3D position
# 6 -> TK Fixed, 3D position
# 7 -> Static fixed, typically used for base stations
# 8 -> PPP, 3D position
uint8 hw_api_gnss_fix_type

# Number of satellites used for gnss solution
uint8 hw_api_gnss_num_sats

# Estimated accuracy of the gnss solution (in meters)
float32 hw_api_gnss_pos_acc

# Rate of the gnss status message
float32 hw_api_gnss_status_hz

# Norm of the  magnetic field (in Gauss, 10Gauss = 1mT)
float32 mag_norm
# Battery voltage in volts
float32 battery_volt
# Battery current in amperes
float32 battery_curr
# Estimate of the drained battery power in watthours
float32 battery_wh_drained
# Current collective thrust relative to max. thrust (i.e. between 0 and 1)
float32 thrust
# Current estimated mass of the vehicle
float32 mass_estimate
# Nominal mass of the vehicle
float32 mass_set

# A list of custom topics to be displayed in the TUI
CustomTopic[] custom_topics
# A list of custom strings to be displayed in the TUI
string[] custom_string_outputs

# A list of node names and a list of their corresponding CPU loads relative to a single CPU core
NodeCpuLoad node_cpu_loads

# True if the UAV is flying and there are no emergency or safety maneuvers taking place
bool flying_normally
# True if the UAV is currently controlled by the RC
bool rc_mode
# True if the UAV is currently flying to a goal waypoint
bool have_goal
# True if the UAV is currently following a trajectory (implies have_goal == true)
bool tracking_trajectory
# True if the control pipeline is ready to receive and execute waypoints and trajectories
bool callbacks_enabled
# True if collision avoidance with other UAVs using the NimbRo network is enabled
bool collision_avoidance_enabled
# True if the UAV is currently performing a maneuver to avoid a collision with another UAV
bool avoiding_collision
# True if the UAV is ready to take off
bool automatic_start_can_takeoff

# The number of other UAVs whose predicted trajectory is available to this one (for collision avoidance purposes)
uint16 num_other_uavs
