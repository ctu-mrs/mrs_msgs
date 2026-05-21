{
  description = "Essential custom messages used by different parts of the mrs-uav-system";

  inputs = {
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs";
  };

  outputs = { self, nixpkgs, nix-ros-overlay }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-ros-overlay.overlays.default ];
      };

      # Using Jazzy, but you can swap this to humble if needed
      ros = pkgs.rosPackages.jazzy;
    in {

      packages.${system}.default = ros.buildRosPackage {
        pname = "mrs_msgs";
        version = "2.0.0";
        src = ./.;

        buildType = "ament_cmake";

        # Maps to <buildtool_depend>
        nativeBuildInputs = [
          ros.ament-cmake
          ros.rosidl-default-generators
        ];

        # Maps to <depend> and <exec_depend>
        buildInputs = [
          ros.builtin-interfaces
          ros.geometry-msgs
          ros.rosidl-default-runtime
          ros.sensor-msgs
          ros.std-msgs
          ros.std-srvs
        ];
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.colcon
          (ros.buildEnv {
            packages = [
              ros.ros-core
              # Tools needed to compile locally
              ros.ament-cmake
              ros.rosidl-default-generators
              # Message dependencies needed locally
              ros.builtin-interfaces
              ros.geometry-msgs
              ros.rosidl-default-runtime
              ros.sensor-msgs
              ros.std-msgs
              ros.std-srvs
            ];
          })
        ];
      };
    };
}
