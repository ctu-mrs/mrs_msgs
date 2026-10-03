builtin_interfaces/Time stamp

# true if the interface is connected to the HW
bool connected

# motors can be spinned
bool armed

# under the control of the companion computer
bool offboard

# string describing a particular mode
string mode

# whether the vehicle is in the air, as the HW knows it
# AIRBORNE_UNKNOWN when the HW API can't tell, including whenever connected is false;
# consumers must not assume either
uint8 AIRBORNE_UNKNOWN = 0
uint8 AIRBORNE_NO      = 1
uint8 AIRBORNE_YES     = 2
uint8 airborne 0 # AIRBORNE_UNKNOWN (msg defaults must be literals)
