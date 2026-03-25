# Detailed information for a specific sensor on the robot.
# Published by sensor handler plugins (e.g., camera_handler) to provide
# sensor-specific data beyond what SensorStatus reports.
#
# The type field uses the same constants as SensorStatus (e.g., TYPE_CAMERA = 7).
# The details field carries a JSON string whose schema depends on the sensor type.

# Sensor type identifier (see SensorStatus for constant definitions).
uint8 type

# JSON-encoded string with sensor-specific details (schema varies by type).
string details
