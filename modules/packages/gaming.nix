{
  config,
  pkgs,
  lib,
  ...
}: {
  # Add an option to enable or disable gaming-related configurations
  options = {
    gaming.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable gaming-specific configurations.";
    };
  };

  # Conditionally apply gaming packages and services if enabled
  config = lib.mkIf config.gaming.enable {
    programs.steam.enable = true;
    environment.systemPackages = with pkgs; [
      winetricks
      gamemode
      wine
      steam-run
      vulkan-tools
      steam
      gamescope
      protonup-qt
      min-ed-launcher
    ];
    programs.nix-ld = {
      enable = true;
      libraries =
        (pkgs.steam.args.multiPkgs pkgs)
        ++ (with pkgs; 
        [
        xorg.libxcb 
        libxkbcommon 
        wayland 
        protonup-qt 
        alsa-lib
        stdenv.cc.cc
        zlib
        fuse3
        icu
        nss
        openssl
        curl
        expat
        ]);
    };
  };
}
