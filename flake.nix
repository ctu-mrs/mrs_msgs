{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv";
    
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nix-ros-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, devenv, nix-ros-overlay, ... } @ inputs:
    let
      system = "x86_64-linux";
      
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-ros-overlay.overlays.default ];
      };
      
      ros = pkgs.rosPackages.jazzy;
    in
    {
      # Delegate the development environment to devenv.nix
      devShells.${system}.default = devenv.lib.mkShell {
        inherit inputs pkgs;
        modules = [ ./devenv.nix ];
      };

      # Keep the native ROS package builder for downstream flakes
      packages.${system}.default = ros.buildRosPackage {
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

  nixConfig = {
    extra-substituters = [ "https://ros.cachix.org" ];
    extra-trusted-public-keys = [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };
}
