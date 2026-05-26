{ pkgs, ... }:
let
  ros = pkgs.rosPackages.jazzy;
  deps = [ ros.ros-core ros.sensor-msgs /* ... */ ];
in
{
  packages = [ pkgs.colcon (ros.buildEnv { paths = deps; }) ];
  enterShell = ''
    echo "🔧 Welcome to the mrs_msgs devenv environment!"
  '';
}
