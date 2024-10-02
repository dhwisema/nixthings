{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-xilinx = {
      url = "gitlab:doronbehar/nix-xilinx";
    };
  };

  outputs = { self, nixpkgs, nix-xilinx, ... }: {

      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./desktop/configuration.nix
            ./desktop/hardware-configuration.nix
          ];
        };
      };

    let
      flake-overlays = [
        nix-xilinx.overlay
      ];
    in
        nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (import ./laptop/configuration.nix { inherit flake-overlays; })
            ./laptop/hardware-configuration.nix
          ];
        };
      };

  };
}

