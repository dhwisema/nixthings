{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    #home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #catpuccin
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    catppuccin,
  }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-hardware.nixosModules.lenovo-thinkpad-z

        ./Hosts/laptop/configuration.nix

        home-manager.nixosModules.home-manager
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.howard = {
            imports = [
              ./Hosts/desktop/home.nix
              catppuccin.homeManagerModules.catppuccin
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
        nixos-hardware.nixosModules.common-cpu-amd
        nixos-hardware.nixosModules.common-pc-ssd

        ./Hosts/desktop/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.howard = {
            imports = [
              ./Hosts/desktop/home.nix
              catppuccin.homeManagerModules.catppuccin
            ];
          };

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
    };
    ## more configs
    #  nixosConfigurations = {
    #  newdevice = nixpkgs.lib.nixosSystem {
    #modules = [];
    #};
  };
}
