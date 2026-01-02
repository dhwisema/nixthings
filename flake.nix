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
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };
  outputs =
    inputs:
    with inputs; # weird syntax thing.... i think its neat apparantly this would work but
    # outputs =
    #   {
    #     self,
    #     nixpkgs,
    #     agenix,
    #     disko,
    #     nixos-hardware,
    #     home-manager,
    #     stylix,
    #     niri,
    #     waveforms,
    #     ...
    #   #waveforms,
    #   }:
    let
      username = "irrelevancy";
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
          nvidia ? false,
          disko-use ? true,
          hostname,
          args ? { },
          modules,
        }:
        let
          default-conf =
            if role == "server" then
              [
                ./Modules/OS/Base-config.nix
                quadlet-nix.nixosModules.quadlet
              ]
            else
              [
                ./Modules/OS/desktop-config.nix
                stylix.nixosModules.stylix
                niri.nixosModules.niri
                waveforms.nixosModule
                ({ users.users.howard.extraGroups = [ "plugdev" ]; })
              ];
          disko-path = ./. + "/Host/${hostname}/disk-config.nix";
          disko-conf =
            if disko-use == true then
              [
                disko.nixosModules.disko
                disko-path
              ]
            else
              [ ];
          default-hm = if role == "server" then [ ./Home/server.nix ] else [ ./Home/desktop.nix ];
          hw-conf = ./. + "/Host/${hostname}/hardware-configuration.nix";
          specialArgs = {
            inherit hostname;
          }
          // args;
        in
        nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            default-conf
            (configurationDefaults specialArgs)
            home-manager.nixosModules.home-manager
            {
              home-manager.users.${username} = default-hm;
            }
            # hw-conf
            # disko-conf
            #disko will go here soon
          ]
          ++ modules
          ++ default-conf
          ++ hw-conf
          ++ disko-conf;
        };
    in

    {
      
      nixosConfigurations = {
        Jester = mkNixosConfiguration {
          hostname = "Jester";
          disko-use = false;
          modules = [ ];
        }; # thinkpad z16
        Fjord = mkNixosConfiguration {
          hostname = "Beau";
          disko-use = false;
          nvidia = true;
          modules = [ ];
        }; # 7800x3d gaming pc
        Stacy-Fakename = mkNixosConfiguration {
          hostname = "Stacy-Fakename";
          system = "aarch64-linux";
          modules = [ ];
        }; # oracle cloud box
        Pumat = mkNixosConfiguration {
          hostname = "Pumat";
          modules = [ ];
        }; # dell optiplex
        Yasha = mkNixosConfiguration {
          hostname = "Yasha";
          modules = [ ];
        }; # lenovo mq90
      };
    };
}
