string  name
string  message
bool    ready 
string  topic
float32 rate  # [hz]

uint8 level
uint8 OK    = 0
uint8 WARN  = 1
uint8 ERROR = 2
uint8 STALE = 3

uint8 type
uint8 TYPE_AUTOPILOT         = 0
uint8 TYPE_RANGEFINDER       = 1
uint8 TYPE_GPS               = 2 
uint8 TYPE_IMU               = 3
uint8 TYPE_BAROMETER         = 4
uint8 TYPE_MAGNETOMETER      = 5
uint8 TYPE_LIDAR             = 6
uint8 TYPE_CAMERA            = 7
uint8 TYPE_REMOTE_CONTROLLER = 8
uint8 TYPE_UNKNOWN           = 9

diagnostic_msgs/KeyValue[] details
