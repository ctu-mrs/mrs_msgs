# This reports on the state of the UavManager

builtin_interfaces/Time stamp

string uav_name

# home position latitude and longitude, if available
float64 home_latitude
float64 home_longitude

# current latitude and longitude, if available
float64 cur_latitude
float64 cur_longitude

float64 flight_time # [s]

# current tracker state
uint8 state
uint8 STATE_INVALID    = 0
uint8 STATE_IDLING     = 1
uint8 STATE_TAKING_OFF = 2
uint8 STATE_FLYING     = 3
uint8 STATE_LANDING    = 4
uint8 STATE_EMERGENCY  = 5
