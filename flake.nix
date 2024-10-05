{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-xilinx = {
    # Recommended if you also override the default nixpkgs flake, common among
    # nixos-unstable users:
    #inputs.nixpkgs.follows = "nixpkgs";
    url = "gitlab:doronbehar/nix-xilinx";
    };

  };

  outputs = { self, nixpkgs, nix-xilinx, nixos-hardware, home-manager, ...}:
  let
    flake-overlays = [
        nix-xilinx.overlay
    ];
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.lenovo-thinkpad-z
          (import ./laptop/configuration.nix
           flake-overlays)
           {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.howard = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      
        ];
      };
    };

    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          ./desktop/configuration.nix
                     {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.howard = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
  };
}
