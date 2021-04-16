# desired velocity [m/s], optional
geometry_msgs/Vector3 velocity

# height above ground, optional
float64 height

# desired heading and its rate, optional
# heading is "the azimuth of the body-x axis of the drone, a.k.a, the aircraft's front"
float64 heading
float64 heading_rate

# set to "true" if you want to control that state
bool use_velocity

# overrides vertical velocity
bool use_height

bool use_heading

# overrides heading
bool use_heading_rate
