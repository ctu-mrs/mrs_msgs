bool active
bool callbacks_enabled

# current tracker state
uint8 state
uint8 STATE_INVALID     = 0
uint8 STATE_IDLE        = 1
uint8 STATE_TAKEOFF     = 2
uint8 STATE_HOVER       = 3
uint8 STATE_REFERENCE   = 4
uint8 STATE_TRAJECTORY  = 5
uint8 STATE_LAND        = 6

# is true whenever the tracker is doing something
# in other words, not idling
bool have_goal

# is true only then a trajectory is being tracked
bool tracking_trajectory

int32 trajectory_length
int32 trajectory_idx

# only when following trajectory
# the current reference in the trajectory UNINTERPOLATED
mrs_msgs/ReferenceStamped trajectory_reference
