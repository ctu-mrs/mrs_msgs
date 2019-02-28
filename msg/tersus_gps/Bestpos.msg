# This is modified version from Novatel
# For original Novatel see: http://docs.ros.org/jade/api/novatel_msgs/html/msg/BESTPOS.html
# For Tersus see section 3.1.3 BESTPOS in https://www.tersus-gnss.com/assets/upload/file/20180608173259349.pdf
# --------------------------------------------------------------------------------------

Header header

# message 42
TersusMessageHeader tersus_msg_header

string solution_status
string position_type

float64 latitude  # (degrees) 
float64 longitude # (degrees) 
float64 height    # Height above mean sea level (meters)

float32 undulation  # Undulation - the relationship between the geoid and the ellipsoid (m) of the chosen datum
string datum_id

float32 latitude_std  # Latitude standard deviation (m) 
float32 longitude_std # Longitude standard deviation (m) 
float32 height_std    # Height standard deviation (m) 

string base_station_id   # Base station ID

float32 diff_age      # Differential age in seconds
float32 solution_age  # Solution age in seconds

uint8 num_satellites_tracked                          # Number of satellites tracked
uint8 num_satellites_used_in_solution                 # Number of satellites used in solution 
uint8 num_gps_and_glonass_l1_used_in_solution         # Number of satellites with L1/E1/B1 signals used in solution
uint8 num_gps_and_glonass_l1_and_l2_used_in_solution  # Number of satellites with multi-frequency signals used in solution
# TODO: define the rest of the message if it is necessary
