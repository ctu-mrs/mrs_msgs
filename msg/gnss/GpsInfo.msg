## GPS_FIX_TYPE enum

uint8 GPS_FIX_TYPE_NO_GPS     = 0    # No GPS connected
uint8 GPS_FIX_TYPE_NO_FIX     = 1    # No position information, GPS is connected
uint8 GPS_FIX_TYPE_2D_FIX     = 2    # 2D position
uint8 GPS_FIX_TYPE_3D_FIX     = 3    # 3D position
uint8 GPS_FIX_TYPE_DGPS       = 4    # DGPS/SBAS aided 3D position
uint8 GPS_FIX_TYPE_RTK_FLOATR = 5    # TK float, 3D position
uint8 GPS_FIX_TYPE_RTK_FIXEDR = 6    # TK Fixed, 3D position
uint8 GPS_FIX_TYPE_STATIC     = 7    # Static fixed, typically used for base stations
uint8 GPS_FIX_TYPE_PPP        = 8    # PPP, 3D position
uint8 fix_type      # [GPS_FIX_TYPE] GPS fix type

float64 lat              # [deg] Latitude (WGS84, EGM96 ellipsoid)
float64 lon              # [deg] Longitude (WGS84, EGM96 ellipsoid)
float32 alt              # [m] Altitude (MSL). Positive for up. Note that virtually all GPS modules provide the MSL altitude in addition to the WGS84 altitude.
uint16 eph               # GPS HDOP horizontal dilution of position (unitless). If unknown, set to: UINT16_MAX
uint16 epv               # GPS VDOP vertical dilution of position (unitless). If unknown, set to: UINT16_MAX
float32 vel              # [m/s] GPS ground speed. If unknown, set to: UINT16_MAX
float32 cog              # [deg] Course over ground (NOT heading, but direction of movement), 0.0..359.99 degrees. If unknown, set to: UINT16_MAX
uint8 satellites_visible # Number of satellites visible. If unknown, set to 255

float32 alt_ellipsoid    # [m] Altitude (above WGS84, EGM96 ellipsoid). Positive for up.
float32 h_acc            # [m] Position uncertainty. Positive for up.
float32 v_acc            # [m] Altitude uncertainty. Positive for up.
float32 vel_acc          # [m/s] Speed uncertainty. Positive for up.
float32 hdg_acc          # [deg] Heading / track uncertainty
float32 yaw              # [deg] Yaw in earth frame from north.

uint8 dgps_num_sats      # Number of DGPS satellites
float32 dgps_age          # [s] Age of DGPS info
float32 baseline_dist     # [m] distance to the basestation
