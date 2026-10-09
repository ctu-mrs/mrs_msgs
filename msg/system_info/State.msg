builtin_interfaces/Time stamp

uint8 state

uint8 STATE_UNKNOWN    = 0  # no data yet (HW API status or ControlManager diagnostics missing)
uint8 STATE_DISARMED   = 1  # connected, not armed
uint8 STATE_ARMED      = 2  # armed, not offboard, not known to be airborne
uint8 STATE_OFFBOARD   = 3  # armed and offboard, no tracker active yet -- on the ground
uint8 STATE_MANUAL     = 4  # armed, not offboard, HW reports airborne: a pilot or the autopilot flies the UAV, not MRS
uint8 STATE_TAKEOFF    = 5  # MRS is taking off
uint8 STATE_LAND       = 6  # MRS is landing
uint8 STATE_RC_MODE    = 7  # MRS flies the UAV, commanded from an RC joystick
uint8 STATE_HOVER      = 8  # MRS hovers in place
uint8 STATE_GOTO       = 9  # MRS flies to a reference
uint8 STATE_TRAJECTORY = 10 # MRS follows a trajectory
uint8 STATE_MIDAIR     = 11 # MRS is taking over a UAV already in the air (mid-air activation in progress)
uint8 STATE_EHOVER     = 12 # emergency hover: MRS holds the position after an error (ControlManager ehover)
uint8 STATE_ELAND      = 13 # emergency landing (ControlManager eland)
uint8 STATE_FAILSAFE   = 14 # failsafe: blind descent without position feedback (ControlManager failsafe)
uint8 STATE_NO_LINK    = 15 # HW API lost the connection to the autopilot
