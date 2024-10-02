{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./desktop/configuration.nix
          ./desktop/hardware-configuration.nix
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./laptop/configuration.nix
          ./laptop/hardware-configuration.nix
        ];
      };
    };
  };
}
