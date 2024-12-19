{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    #flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.0"; # unstable branch. Use github:gmodena/nix-flatpak/?ref=<tag> to pin releases.
    #waveforms
    waveforms.url = "github:liff/waveforms-flake";

    #lix. 
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-2.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-flatpak,
    nixos-hardware,
    waveforms,
    lix-module
  }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        #lix
        lix-module.nixosModules.default
        
        #hardware imports for amd gpu and laptop drivers
        nixos-hardware.nixosModules.lenovo-thinkpad-z

        nix-flatpak.nixosModules.nix-flatpak

        waveforms.nixosModule
        {users.users.howard.extraGroups = ["plugdev"];}
        ./Hosts/laptop/configuration.nix
      ];
    };

    nixosConfigurations.deskbox = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [

        #lix 
        lix-module.nixosModules.default

        #sets scheduling things for kernel
        nixos-hardware.nixosModules.common-cpu-amd
        #ssd trim
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
};
}
