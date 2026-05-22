{
  inputs = {
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs";  # IMPORTANT!!!
  };
  outputs = { self, nix-ros-overlay, nixpkgs }:

    nix-ros-overlay.inputs.flake-utils.lib.eachDefaultSystem (system:

      let

        system = "x86_64-linux";

        pkgs = import nixpkgs {
          inherit system;
          overlays = [ nix-ros-overlay.overlays.default ];
        };

        ros = pkgs.rosPackages.jazzy;

      in {

      packages.${system}.default = ros.buildRosPackage {

        pname = "mrs_msgs";
        version = "2.0.0";
        src = "./.";
        
        buildType = "ament_cmake";
        
        # Maps to <buildtool_depend>
        nativeBuildInputs = [ 
          ros.ament-cmake 
          ros.rosidl-default-generators 
        ];
        
        # Maps to <depend> and <exec_depend>
        buildInputs = [ 
          ros.ros-core
          ros.ament-cmake 
          ros.ament-cmake-core
          ros.builtin-interfaces
          ros.sensor-msgs
          ros.std-srvs
          ros.std-msgs
          ros.geometry-msgs
          ros.python-cmake-module
        ];
      };

        devShells.default = pkgs.mkShell {
          name = "mrs_msgs";
          packages = [
            pkgs.colcon
            # ... ot<depend><depend><depend><depend>her non-ROS packages
            (ros.buildEnv {
              paths = [
                ros.ros-core
                ros.ament-cmake 
                ros.ament-cmake-core
                ros.builtin-interfaces
                ros.sensor-msgs
                ros.std-srvs
                ros.std-msgs
                ros.geometry-msgs
                ros.python-cmake-module
              ];
            })
          ];
        };

      });

  nixConfig = {
    extra-substituters = [ "https://ros.cachix.org" ];
    extra-trusted-public-keys = [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };
}
