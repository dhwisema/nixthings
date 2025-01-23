{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./desktops/niri/niri-hm.nix
    ./desktops/niri/rofi-wayland/rofi-wayland.nix
    ./waybar/waybar.nix
    ./desktops/niri/swaylock.nix
  ];

  home.packages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
