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
      steam
      gamemode
      heroic
      protonup-qt
      legendary-gl
      wine
      steam-run
      vulkan-tools
      lutris
    ];

  };
}

