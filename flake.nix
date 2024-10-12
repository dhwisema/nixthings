{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nix-xilinx = {
    # Recommended if you also override the default nixpkgs flake, common among
    # nixos-unstable users:
    #inputs.nixpkgs.follows = "nixpkgs";
    url = "gitlab:doronbehar/nix-xilinx";
    };

  };

  outputs = { self, nixpkgs, nix-xilinx, nixos-hardware, ...}:
  
{
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          
          nixos-hardware.nixosModules.lenovo-thinkpad-z
          ./laptop/configuration.nix
      
        ];
      };
    };

    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-hardware.nixosModules.common-cpu-amd
          ./desktop/configuration.nix
          
        ];
      };
    };
  };
}
