{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    #flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    #home-manager till i decide to nuke it again
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    niri.url = "github:sodiboo/niri-flake";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    #waveforms
    waveforms.url = "github:liff/waveforms-flake";

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
      inputs.dms-cli.follows = "dms-cli";
    };

    #dms
  };

  outputs =
    {
      self,
      dgop,
      dms-cli,
      dankMaterialShell,
      nixpkgs,
      nix-flatpak,
      nixos-hardware,
      home-manager,
      stylix,
      niri,
      sops-nix,
      waveforms,
      ...
    #waveforms,
    }:
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          #niri
          niri.nixosModules.niri
          #hardware imports for amd gpu and laptop drivers
          nixos-hardware.nixosModules.lenovo-thinkpad-z
          stylix.nixosModules.stylix

          nix-flatpak.nixosModules.nix-flatpak
          sops-nix.nixosModules.sops
          waveforms.nixosModule
          { users.users.howard.extraGroups = [ "plugdev" ]; }
          ./Hosts/laptop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            #home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.howard =
              { pkgs, ... }:
              {
                imports = [
                  dankMaterialShell.homeModules.dankMaterialShell.default
                  dankMaterialShell.homeModules.dankMaterialShell.niri
                  ./Hosts/laptop/home.nix
                ];
              };

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };

      nixosConfigurations.deskbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # niri
          waveforms.nixosModule
          { users.users.howard.extraGroups = [ "plugdev" ]; }
          niri.nixosModules.niri
          stylix.nixosModules.stylix

          #sets scheduling things for kernel
          nixos-hardware.nixosModules.common-cpu-amd
          #ssd trim
          nixos-hardware.nixosModules.common-pc-ssd
          nix-flatpak.nixosModules.nix-flatpak
          sops-nix.nixosModules.sops
          ./Hosts/desktop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            #home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.howard =
              { pkgs, ... }:
              {
                imports = [
                  dankMaterialShell.homeModules.dankMaterialShell.default
                  dankMaterialShell.homeModules.dankMaterialShell.niri
                  ./Hosts/desktop/home.nix
                ];
              };

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
}
