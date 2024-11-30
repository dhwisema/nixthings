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
      protonup-qt
      gamemode
      wine
      steam-run
      vulkan-tools
    ];
  };
}
