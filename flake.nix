{
  description = "combined nixos config for servers and dekstops";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko = {
      # declarative disk management
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    stylix.url = "github:danth/stylix";
    niri.url = "github:sodiboo/niri-flake";
    waveforms.url = "github:liff/waveforms-flake";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      disko,
      nixos-hardware,
      stylix,
      niri,
      agenix,
      ...
    }@inputs:
    let
      configurationDefaults = args: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "hm-backup";
        home-manager.extraSpecialArgs = args;
      };

      mkNixosConfiguration =
        {
          system ? "x86_64-linux",
          role ? "server",
          hostname,
          args ? { },
          modules,
        }:
        let
          specialArgs = {
            inherit hostname;
          }
          // args;
        in
        nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            (configurationDefaults specialArgs)
            home-manager.nixosModules.home-manager
            #disko will go here soon
          ]
          ++ modules;
        };
    in

    {
      nixosConfiguration.Jester = mkNixosConfiguration {
        hostname = "Jester";
        modules = [ ];
      }; # thinkpad z16
      nixosConfiguration.Fjord = mkNixosConfiguration {
        hostname = "Beau";
        modules = [ ];
      }; # 7800x3d gaming pc
      nixosConfiguration.Stacy-Fakename = mkNixosConfiguration {
        hostname = "Stacy-Fakename";
        system = "aarch64-linux";
        modules = [ ];
      }; # oracle cloud box
      nixosConfiguration.Optiplex = mkNixosConfiguration {
        hostname = "Pumat";
        modules = [ ];
      }; # dell optiplex
      nixosConfiguration.MQ90 = mkNixosConfiguration {
        hostname = "Yasha";
        modules = [ ];
      }; # lenovo mq90
    };

}
