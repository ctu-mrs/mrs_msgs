string  name
string  status

uint8 type
uint8 TYPE_AUTOPILOT    = 0
uint8 TYPE_RANGEFINDER  = 1
uint8 TYPE_GPS          = 2 
uint8 TYPE_IMU          = 3
uint8 TYPE_BAROMETER    = 4
uint8 TYPE_MAGNETOMETER = 5
uint8 TYPE_LIDAR        = 6
uint8 TYPE_CAMERA       = 7

bool    ready
float32 rate  # [hz]
