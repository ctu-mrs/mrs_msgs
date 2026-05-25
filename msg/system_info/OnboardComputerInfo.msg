float32 cpu_load                -1.0  # [%]
float32 cpu_ghz                 -1.0  # [GHz] average frequency across cores
float32 cpu_temperature         -1.0  # [°C] maximum across thermal zones
float32 free_ram                -1.0  # [GiB]
float32 total_ram               -1.0  # [GiB]
int32   free_hdd                -1    # [GiB]
mrs_msgs/CpuLoad[] node_cpu_loads

# WiFi information
string  wifi_interface          ""      # interface name (e.g. "wlp2s0"), empty if unavailable
float32 wifi_signal_dbm         -200.0  # [dbm] wifi rssi (e.g. -46, -200 if unavailable)
int32   wifi_link_quality       -1      # link quality (0-70 typical, -1 if unavailable)
