float32 cpu_load                # [%]
float32 free_ram                # [GiB]
float32 total_ram               # [GiB]
int32   free_hdd                # [GiB]
mrs_msgs/CpuLoad[] node_cpu_loads

float32 hw_api_rate             # [Hz]
float32 control_manager_rate    # [Hz]
float32 state_estimation_rate   # [Hz]

float32 gnss_uncertainty        # [m]
float32 mag_strength            # [T]
float32 mag_uncertainty         # [T]

mrs_msgs/SensorStatus[] available_sensors
