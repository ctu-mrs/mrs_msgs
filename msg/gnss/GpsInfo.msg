builtin_interfaces/Time stamp
## GPS_FIX_TYPE enum

uint8 GPS_FIX_TYPE_NO_GPS     = 0    # no gps connected
uint8 GPS_FIX_TYPE_NO_FIX     = 1    # no position information, gps is connected
uint8 GPS_FIX_TYPE_2D_FIX     = 2    # 2D position
uint8 GPS_FIX_TYPE_3D_FIX     = 3    # 3D position
uint8 GPS_FIX_TYPE_DGPS       = 4    # dgps/sbas aided 3D position
uint8 GPS_FIX_TYPE_RTK_FLOATR = 5    # tk float, 3D position
uint8 GPS_FIX_TYPE_RTK_FIXEDR = 6    # tk fixed, 3D position
uint8 GPS_FIX_TYPE_STATIC     = 7    # static fixed, typically used for base stations
uint8 GPS_FIX_TYPE_PPP        = 8    # ppp, 3D position
uint8 fix_type      # [GPS_FIX_TYPE] gps fix type

float64 lat              # [deg] latitude (WGS84, egm96 ellipsoid)
float64 lon              # [deg] longitude (WGS84, egm96 ellipsoid)
float32 alt              # [m] altitude (MSL). positive for up. note that virtually all gps modules provide the msl altitude in addition to the wgs84 altitude.
uint16 eph               # gps hdop horizontal dilution of position (unitless). if unknown, set to: uint16_max
uint16 epv               # gps vdop vertical dilution of position (unitless). if unknown, set to: uint16_max
float32 vel              # [m/s] gps ground speed. if unknown, set to: uint16_max
float32 cog              # [deg] course over ground (NOT heading, but direction of movement), 0.0..359.99 degrees. if unknown, set to: uint16_max
uint8 satellites_visible # number of satellites visible. if unknown, set to 255

float32 alt_ellipsoid    # [m] altitude (above wgs84, egm96 ellipsoid). positive for up.
float32 h_acc            # [m] position uncertainty. positive for up.
float32 v_acc            # [m] altitude uncertainty. positive for up.
float32 vel_acc          # [m/s] speed uncertainty. positive for up.
float32 hdg_acc          # [deg] heading / track uncertainty
float32 yaw              # [deg] yaw in earth frame from north.

uint8 dgps_num_sats      # number of dgps satellites
float32 dgps_age          # [s] age of dgps info
float32 baseline_dist     # [m] distance to the basestation
