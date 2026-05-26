# devenv.nix
{ pkgs, ... }:

let
  ros = pkgs.rosPackages.jazzy;
  
  deps = [
    ros.ros-core
    ros.sensor-msgs
    ros.std-srvs
    ros.std-msgs
    ros.geometry-msgs
  ];
in
{
  # 1. Provide colcon and the ROS environment for local development
  packages = [
    pkgs.colcon
    (ros.buildEnv {
      paths = deps;
    })
  ];

  # 2. Add a welcome message and automatically source the workspace
  enterShell = ''
    echo "🔧 Welcome to the mrs_msgs devenv environment!"
    
    if [ -f install/setup.bash ]; then
      source install/setup.bash
      echo "✅ Local colcon workspace sourced."
    fi
  '';
}
