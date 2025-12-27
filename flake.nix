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
    inputs@{
      self,
      nixpkgs,
      home-manager,
      disko,
      agenix,
      nixos-hardware,
      stylix,
      niri,
      waveforms,
      ...
    }:
    let
      lib = nixpkgs.lib;

      # Defaults you want
      defaultSystem = "x86_64-linux";
      defaultRole = "server";
      defaultUser = "irrelevancy";

      # Single base dir for all hosts
      hostsDir = ./host;

      # Stacks
      desktopStack = [
        niri.nixosModules.niri
        stylix.nixosModules.stylix
        waveforms.nixosModule
        (
          { ... }:
          {
            users.users.${defaultUser}.extraGroups = [ "plugdev" ];
          }
        )
      ];

      serverStack = [
        # nothing by default; add common server modules here if you want
      ];

      # Feature modules (reused)
      hmModule = role: hostHomePath: {
        imports = [ home-manager.nixosModules.home-manager ];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${defaultUser} =
          if hostHomePath != null then
            hostHomePath
          else if role == "desktop" then
            ./modules/desktop-home.nix
          else
            ./modules/server-home.nix;
      };

      agenixModule =
        { pkgs, ... }:
        {
          imports = [ agenix.nixosModules.default ];
          environment.systemPackages = [ agenix.packages.${pkgs.system}.default ];
        };

      # Only include disko if the disk-config file exists OR if forced on.
      diskoModulesFor =
        hostDir: force:
        let
          disk = hostDir + "/disk-config.nix";
        in
        lib.optionals (force || builtins.pathExists disk) [
          disko.nixosModules.disko
          disk
        ];

      # Host declarations: minimal overrides only.
      #
      # Defaults:
      # - system = x86_64-linux
      # - role   = server
      # - home   = role-based default (server-home / desktop-home)
      # - disko  = enabled if disk-config.nix exists
      hostsRaw = {
        laptop = {
          role = "desktop";
          extraModules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-z
          ];
        };

        deskbox = {
          role = "desktop";
          extraModules = [
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-pc-ssd
          ];
        };

        Nixbox = {
          system = "aarch64-linux";
          # role defaults to server
          # disko auto by presence
        };

        Optiplex = { };
        MQ90 = { };

        generic = {
          extraModules = [
            (hostsDir + "/generic/hardware-configuration.nix")
          ];
        };
      };

      # Apply defaults to each host
      hosts = lib.mapAttrs (_: h: {
        name = h.name or null; # unused; kept harmless
        system = h.system or defaultSystem;
        role = h.role or defaultRole;
        # Optional overrides
        home = h.home or null; # override HM path per host if desired
        forceDisko = h.forceDisko or false; # force disko even if file missing
        extraModules = h.extraModules or [ ];
      }) hostsRaw;

      mkHost =
        hostname: h:
        let
          hostDir = hostsDir + "/${hostname}";
          cfg = hostDir + "/configuration.nix";
        in
        lib.nixosSystem {
          system = h.system;

          specialArgs = {
            inherit inputs hostname;
            role = h.role;
            isServer = (h.role == "server");
            username = defaultUser;
          };

          modules = [
            (
              { ... }:
              {
                networking.hostName = hostname;
              }
            )

            # Host config (always)
            cfg

            # Shared: agenix everywhere
            agenixModule

            # HM (role-based default unless overridden)
            (hmModule h.role h.home)
          ]
          # Role stacks
          ++ (if h.role == "desktop" then desktopStack else serverStack)
          # Disko if present/forced
          ++ (diskoModulesFor hostDir h.forceDisko)
          # Host-specific extras
          ++ h.extraModules;
        };
    in
    {
      nixosConfigurations = lib.mapAttrs mkHost hosts;
    };
}
