# flake.nix
{
  inputs = {
# 1. Define the tools
    flake-parts.url = "github:hercules-ci/flake-parts";

    devenv.url = "github:cachix/devenv";
    
    # 2. Define the ROS overlay FIRST
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      
      # 1. Import the devenv module natively
      imports = [
        inputs.devenv.flakeModule
      ];

      # 2. Declare the architectures you support
      systems = [ "x86_64-linux" "aarch64-linux" ];

      # 3. Everything in here is automatically generated for each system above
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          # Apply your ROS overlay for this specific system
          rosPkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.nix-ros-overlay.overlays.default ];
          };
          ros = rosPkgs.rosPackages.jazzy;
        in
        {
          # --- The Local Developer Environment ---
          # devenv.shells handles all the mkShell boilerplate behind the scenes
          devenv.shells.default = {

            _module.args = {
              inherit rosPkgs; # This passes the rosPkgs you defined above
            };

            # Explicitly resolve the directory for the Nix sandbox
            devenv.root =
              let
                folder = builtins.getEnv "PWD";
                isInsideWorkTree = folder != "";
              in
                if isInsideWorkTree
                then folder
                else builtins.toString ./.; # <--- Cast the path to a string here

            imports = [ ./devenv.nix ];
          };

          # --- The C++ Package Builder ---
          packages.default = ros.buildRosPackage {
            pname = "mrs_msgs";
            version = "2.0.0";
            src = ./.;
            buildType = "ament_cmake";
            nativeBuildInputs = [ ros.ament-cmake ros.rosidl-default-generators ];
            propagatedBuildInputs = [ 
              ros.sensor-msgs ros.std-srvs ros.std-msgs ros.geometry-msgs 
            ];
          };
        };
        
      # 4. Global flake configurations live at the bottom
      flake = {
        nixConfig = {
          extra-substituters = [ "https://ros.cachix.org" "https://devenv.cachix.org" ];
          extra-trusted-public-keys = [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=" ];
        };
      };
    };
}
