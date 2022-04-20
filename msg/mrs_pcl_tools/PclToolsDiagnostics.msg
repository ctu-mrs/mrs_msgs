time   stamp
string sensor_name
uint8  sensor_type

float32 frequency   # [Hz]
float32 vfov        # [deg]
uint16  rows_before # height of input data
uint16  cols_before # width of input data
uint16  rows_after  # height of output data
uint16  cols_after  # width of output data

# Sensor type
int8 SENSOR_TYPE_NONE=-1
int8 SENSOR_TYPE_LIDAR_3D=0
int8 SENSOR_TYPE_DEPTH_CAMERA=1
