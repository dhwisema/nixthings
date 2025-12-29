{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Add an option to enable or disable gaming-related configurations
  # Conditionally apply gaming packages and services if enabled

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    gamemode
    wine
    steam-run
    steam
    protonup-rs
  ];
  programs.nix-ld = {
    enable = true;
  };
}
