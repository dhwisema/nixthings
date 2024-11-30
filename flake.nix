{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.0"; # unstable branch. Use github:gmodena/nix-flatpak/?ref=<tag> to pin releases.

    #waveforms
    waveforms.url = "github:liff/waveforms-flake";

  };

  outputs = {
    self,
    nixpkgs,
    nix-flatpak,
    nixos-hardware,
    waveforms
  }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-hardware.nixosModules.lenovo-thinkpad-z
        
        nix-flatpak.nixosModules.nix-flatpak

        waveforms.nixosModule
        ({users.users.howard.extraGroups = ["plugdev"];})
        ./Hosts/laptop/configuration.nix
      ];
    };

    nixosConfigurations.deskbox = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-hardware.nixosModules.common-cpu-amd
        nixos-hardware.nixosModules.common-pc-ssd
        
        nix-flatpak.nixosModules.nix-flatpak

        ./Hosts/desktop/configuration.nix

      ];
    };
    ## more configs
    #  nixosConfigurations = {
    #  newdevice = nixpkgs.lib.nixosSystem {
    #modules = [];
    #};
  };
}
