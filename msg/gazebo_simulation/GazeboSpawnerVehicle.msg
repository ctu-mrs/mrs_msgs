# One vehicle known to the Gazebo spawner

string name

# spawning state of the vehicle
uint8 state
uint8 STATE_UNKNOWN  = 0
uint8 STATE_QUEUED   = 1
uint8 STATE_SPAWNING = 2
uint8 STATE_SPAWNED  = 3
uint8 STATE_FAILED   = 4

string message           # human-readable reason, mainly for STATE_FAILED
string platform_config   # YAML content of the generated per-vehicle platform config; set in STATE_SPAWNED
string mavlink_fcu_url   # MAVROS fcu_url for this vehicle, e.g. udp://127.0.0.1:14005@127.0.0.1:14004 (ID 1)
uint8  mavlink_system_id # PX4 MAV_SYS_ID of this vehicle (= ID + 1), MAVROS target_system_id
