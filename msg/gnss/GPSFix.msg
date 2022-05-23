# A more complete GPS fix to supplement sensor_msgs/NavSatFix.
# modified version of http://docs.ros.org/kinetic/api/gps_common/html/msg/GPSFix.html
Header header

# Satellites used in solution
uint8 num_satellites_used_in_solution # Number of satellites

# Satellites visible
uint8 num_satellites_tracked

# Measurement status
GpsStatus status

# Latitude (degrees). Positive is north of equator; negative is south.
float64 latitude

# Longitude (degrees). Positive is east of prime meridian, negative west.
float32 longitude

# Altitude (meters). Positive is above reference (e.g., sea level).
float64 altitude

# Direction (degrees from north)
float64 track

# Ground speed (meters/second)
float64 speed

# GPS time
float64 time

## Dilution of precision; Xdop<=0 means the value is unknown

# Horizontal dilution of precision
float32 hdop

## Uncertainty of measurement, 95% confidence

# Position covariance [m^2] defined relative to a tangential plane
# through the reported position. The components are East, North, and
# Up (ENU), in row-major order.

float64[9] position_covariance

uint8 COVARIANCE_TYPE_UNKNOWN = 0
uint8 COVARIANCE_TYPE_APPROXIMATED = 1
uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2
uint8 COVARIANCE_TYPE_KNOWN = 3
uint8 position_covariance_type
