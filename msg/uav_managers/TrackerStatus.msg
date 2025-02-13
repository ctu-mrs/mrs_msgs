bool active
bool callbacks_enabled

# current tracker state
uint8 state
uint8 state_invalid     = 0
uint8 state_idle        = 1
uint8 state_takeoff     = 2
uint8 state_hover       = 3
uint8 state_reference   = 4
uint8 state_trajectory  = 5
uint8 state_land        = 6

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
