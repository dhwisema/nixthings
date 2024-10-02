{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-xilinx = {
    # Recommended if you also override the default nixpkgs flake, common among
    # nixos-unstable users:
    #inputs.nixpkgs.follows = "nixpkgs";
    url = "gitlab:doronbehar/nix-xilinx";
    };

  };

  outputs = { self, nixpkgs, nix-xilinx}:
  let
    flake-overlays = [
        nix-xilinx.overlay
    ];
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (import ./laptop/configuration.nix
           flake-overlays)
        ];
      };
    };

    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./desktop/configuration.nix
        ];
      };
    };
  };
}
