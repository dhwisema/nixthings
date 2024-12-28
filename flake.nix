{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    #flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    #home-manager till i decide to nuke it again
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #waveforms
    #waveforms.url = "github:liff/waveforms-flake";

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
    home-manager,
    #waveforms,
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

        #waveforms.nixosModule
        #{users.users.howard.extraGroups = ["plugdev"];}
        ./Hosts/laptop/configuration.nix



        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jdoe = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }

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


        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jdoe = import ./Hosts/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
  };
}
