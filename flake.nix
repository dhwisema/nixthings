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
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    awww.url = "git+https://codeberg.org/LGFae/awww";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };
  outputs =
    inputs:
    with inputs; # weird syntax thing.... i think its neat apparantly this would work but,,, 2026 01 06 -> i fear i understand that this way causes me pain
    let
      username = "irrelevancy";
      mkNixosConfiguration =
        {
          system ? "x86_64-linux",
          role ? "server",
          nvidia ? false,
          disko-use ? true,
          hostname,
          modules,
        }@args-os:
        let
          defaultconf =
            if role == "server" then
              [
                ./Modules/OS/Base-config.nix
                comin.nixosModules.comin
          ({
            services.comin = {
              enable = true;
              remotes = [{
                name = "origin";
                url = "https://github.com/dhwisema/nix-config.git";
                branches.main.name = "main";
              }];
            };
          })
                
              ]
            else
              [
                ./Modules/OS/desktop-config.nix
                nix-flatpak.nixosModules.nix-flatpak
                stylix.nixosModules.stylix
                niri.nixosModules.niri
                waveforms.nixosModule
                ({ users.users.${username}.extraGroups = [ "plugdev" ]; })
                nixos-hardware.nixosModules.common-cpu-amd # sets scheduling things for kernel
                nixos-hardware.nixosModules.common-pc-ssd # ssd trim
              ];

          diskopath = ./. + "/Host/${hostname}/disk-config.nix";
          hwconf = ./. + "/Host/${hostname}/hardware-configuration.nix";
          diskoconf =
            if disko-use == true then
              [
                disko.nixosModules.disko
                diskopath
              ]
            else
              [ ];
          default-hm = if role == "server" then [ ./Home/server.nix ] else [ ./Home/desktop.nix ];

          specialArgs = {
         
            inherit inputs username hostname role nvidia;
          }
          // args-os;
        in
        nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            # (specialArgs)
            home-manager.nixosModules.home-manager
            {

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-backup";
              home-manager.extraSpecialArgs = { inherit inputs username; };

              home-manager.users.${username} = {
                imports = default-hm;
              };
            }
            hwconf
          ]
          ++ modules
          ++ defaultconf
          ++ diskoconf;
        };
    in
    {
      nixosConfigurations = {
        Jester = mkNixosConfiguration {
          hostname = "Jester";
          role = "Desktop";
          modules = [
            ./Host/Jester/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-z # i fear lenovo did not cook with this one
            lanzaboote.nixosModules.lanzaboote
            ./Modules/SecureBoot.nix
          ];
        }; # thinkpad z16
        Beau = mkNixosConfiguration {
          hostname = "Beau";
          role = "Desktop";
          disko-use = false;
          nvidia = true;
          modules = [ ./Host/Beau/configuration.nix ];
        }; # 7800x3d gaming pc
        Stacy-Fakename = mkNixosConfiguration {
          hostname = "Stacy-Fakename";
          system = "aarch64-linux";
          modules = [./Modules/Containers/mc.nix ];
        }; # oracle cloud box
        Pumat = mkNixosConfiguration {
          hostname = "Pumat";
          modules = [./Modules/Containers/CWA.nix ];
        }; # dell optiplex
        Yasha = mkNixosConfiguration {
          hostname = "Yasha";
          modules = [ ];
        }; # lenovo mq90
      };
    };
}
