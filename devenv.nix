{ rosPkgs, ... }:
let
  ros = rosPkgs.rosPackages.jazzy;
  deps = [ ros.ros-core ros.sensor-msgs ];
in
{
  packages = [ rosPkgs.colcon (ros.buildEnv { paths = deps; }) ];
  enterShell = ''
    echo "🔧 Welcome to the mrs_msgs devenv environment!"
  '';
}
