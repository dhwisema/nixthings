{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";



    #waveforms
    waveforms.url = "github:liff/waveforms-flake";

  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    waveforms
  }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-hardware.nixosModules.lenovo-thinkpad-z
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
