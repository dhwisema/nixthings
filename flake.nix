{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";


  };

  outputs = { self, nixpkgs, nixos-hardware, ...}:
  
{
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          
          nixos-hardware.nixosModules.lenovo-thinkpad-z
          ./Hosts/laptop/configuration.nix
      
        ];
      };
    };

    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-hardware.nixosModules.common-cpu-amd
          ./Hosts/desktop/configuration.nix
          ./nixos-hardware/common/pc/ssd/default.nix

          
        ];
      };
    };
  };
}
