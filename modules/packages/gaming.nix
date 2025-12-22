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
      gamemode
      wine
      steam-run
      steam
      protonup-qt
      min-ed-launcher
    ];
    programs.nix-ld = {
      enable = true;
    };
  };
}
