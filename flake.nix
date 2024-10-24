{
  description = "My NixOS Configurations for Desktop and Laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #hardware
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    #home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";


    #waveforms
    waveforms.url = "github:liff/waveforms-flake";

    #stylix
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    stylix,
    waveforms
  }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-hardware.nixosModules.lenovo-thinkpad-z
        waveforms.nixosModule
        ({users.users.howard.extraGroups = ["plugdev"];})
        ./Hosts/laptop/configuration.nix

        home-manager.nixosModules.home-manager
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.howard = {
            imports = [
              ./Hosts/home.nix
              stylix.homeManagerModules.stylix
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
              ./Hosts/home.nix
              stylix.homeManagerModules.stylix
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
