float32 cpu_load                # [%]
float32 free_ram                # [GiB]
float32 total_ram               # [GiB]
int32   free_hdd                # [GiB]
mrs_msgs/CpuLoad[] node_cpu_loads

float32 hw_api_rate             # [Hz]
float32 control_manager_rate    # [Hz]
float32 state_estimation_rate   # [Hz]

float32 mag_strength            # [T]
float32 mag_uncertainty         # [T]

float32 rc_rssi                 #[%] 

string  wifi_interface          # interface name (e.g. "wlp2s0"), empty if unavailable
float32 wifi_signal_dbm         # [dBm] WiFi RSSI (e.g. -46, NaN if unavailable)
int32   wifi_link_quality       # link quality (0-70 typical, -1 if unavailable)

float32 gnss_uncertainty        # [m]
uint8   gnss_fix_type           # Defined in mrs_msgs/GPSInfo
uint8   gnss_num_satellites     # number of satellites used in the solution

mrs_msgs/SensorStatus[] available_sensors
