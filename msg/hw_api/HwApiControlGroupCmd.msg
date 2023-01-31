time stamp

# 4DOF control vector, in the Front-Left-Up body frame
# roll [-1, 1]
# pitch [-1, 1]
# yaw [-1, 1]
# throttle [0, 1]
#
# The control group signals are first passed through a mixer matrix,
# then desaturated and applied to the motor outputs [0, 1].
float32[4] controls
