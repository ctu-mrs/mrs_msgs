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
uint8 state_invalid    = 0
uint8 state_idling     = 1
uint8 state_taking_off = 2
uint8 state_flying     = 3
uint8 state_landing    = 4
uint8 state_emergency  = 5
