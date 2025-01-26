{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./desktops/niri/niri-hm.nix
    ./desktops/niri/rofi-wayland/rofi-wayland.nix
    ./waybar/waybar.nix
    ./desktops/niri/swaylock.nix
  ];

  # Electron Application Patches

  home.packages = with pkgs; [
    ghostty
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    art
  ];
}
