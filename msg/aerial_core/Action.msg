# The Action for command the UAV

#Take off – localize UAV and fly to predefined safe altitude
#Fly to – fly to specified position in working area according to known model of environment
#Guide to – guide UAV to specified position with respect to position of human
#Land – safe landing on starting position with respect to known obstacles

Header header

# Action type
int8 TAKE_OFF=0
int8 FLY_TO=1
int8 GUIDE_TO=2
int8 LAND=3

# The list of points in the path.
Reference[] points 
