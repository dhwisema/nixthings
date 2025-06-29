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

    stylix.url = "github:danth/stylix";

    niri.url = "github:sodiboo/niri-flake";

    #waveforms
    #waveforms.url = "github:liff/waveforms-flake";
  };

  outputs = {
    self,
    nixpkgs,
    nix-flatpak,
    nixos-hardware,
    home-manager,
    stylix,
    niri,
    ...
    #waveforms,
  }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        #niri
        niri.nixosModules.niri
        #hardware imports for amd gpu and laptop drivers
        nixos-hardware.nixosModules.lenovo-thinkpad-z
        stylix.nixosModules.stylix

        nix-flatpak.nixosModules.nix-flatpak

        #waveforms.nixosModule
        #{users.users.howard.extraGroups = ["plugdev"];}
        ./Hosts/laptop/configuration.nix

        home-manager.nixosModules.home-manager
        {
          #home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.howard = {pkgs, ...}: {
            imports = [
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
        niri.nixosModules.niri
        stylix.nixosModules.stylix

        #sets scheduling things for kernel
        nixos-hardware.nixosModules.common-cpu-amd
        #ssd trim
        nixos-hardware.nixosModules.common-pc-ssd
        nix-flatpak.nixosModules.nix-flatpak

        ./Hosts/desktop/configuration.nix

        home-manager.nixosModules.home-manager
        {
          #home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.howard = {pkgs, ...}: {
            imports = [
              ./Hosts/laptop/home.nix
            ];
          };

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
    };
  };
}
