{ config, pkgs, lib, ... }:

{
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
    environment.systemPackages = with pkgs; [
      pkgs.steam
      pkgs.gamemode
      pkgs.heroic
      pkgs.protnup-qt
      pkgs.legendary-gl
      pkgs.wine
      pkgs.steam-run
      pkgs.vulkan-tools
      pkgs.lutris
    ];

  };
}

