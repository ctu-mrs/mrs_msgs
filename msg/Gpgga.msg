# Message from GPGGA NMEA String
std_msgs/Header header

string message_id

# UTC seconds from midnight
float64 utc_seconds

float64 latitude
float64 longitude

string latitude_dir
string longitude_dir

GpsStatus gps_quality

uint32 num_sats
float32 hdop
float32 altitude
string altitude_units

float32 undulation
string undulation_units
uint32 diff_age
string station_id
