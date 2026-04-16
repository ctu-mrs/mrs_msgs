# TO REMOVE: This message is deprecated. 
float32 cpu_load                -1.0  # [%]
float32 free_ram                -1.0  # [GiB]
float32 total_ram               -1.0  # [GiB]
int32   free_hdd                -1    # [GiB]
mrs_msgs/CpuLoad[] node_cpu_loads
string  wifi_interface          ""      # interface name (e.g. "wlp2s0"), empty if unavailable
float32 wifi_signal_dbm         -200.0  # [dbm] wifi rssi (e.g. -46, -200 if unavailable)
int32   wifi_link_quality       -1      # link quality (0-70 typical, -1 if unavailable)

# Onboard computer information
mrs_msgs/OnboardComputerInfo onboard_computer_info

# MRS system health information message
float32 hw_api_rate             -1.0  # [Hz]
float32 control_manager_rate    -1.0  # [Hz]
float32 state_estimation_rate   -1.0  # [Hz]

mrs_msgs/SensorStatus[] available_sensors
