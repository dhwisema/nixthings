{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    #flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    ghostty.url = "github:ghostty-org/ghostty";

    #home-manager till i decide to nuke it again
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nixpkgs-wayland.inputs.nixpkgs.follows = "nixpkgs";
  

    #waveforms
    #waveforms.url = "github:liff/waveforms-flake";
  };

  outputs = {
    self,
    ghostty,
    nixpkgs,
    nix-flatpak,
    nixos-hardware,
    home-manager,
    stylix,
    nixpkgs-wayland,
    ...
    #waveforms,
  }: 
  let
  overlays.nixpkgs = [nixpkgs-wayland];
  in
  {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        #hardware imports for amd gpu and laptop drivers
        nixos-hardware.nixosModules.lenovo-thinkpad-z
        stylix.nixosModules.stylix

        {
          environment.systemPackages = [
            ghostty.packages.x86_64-linux.default
          ];
        }
        nix-flatpak.nixosModules.nix-flatpak

        #waveforms.nixosModule
        #{users.users.howard.extraGroups = ["plugdev"];}
        ./Hosts/laptop/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
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
        #lix
        #lix-module.nixosModules.default
        #sets scheduling things for kernel
        nixos-hardware.nixosModules.common-cpu-amd
        #ssd trim
        nixos-hardware.nixosModules.common-pc-ssd
        nix-flatpak.nixosModules.nix-flatpak

        ./Hosts/desktop/configuration.nix

        {
          environment.systemPackages = [
            ghostty.packages.x86_64-linux.default
          ];
        }

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
    };
  };
}
