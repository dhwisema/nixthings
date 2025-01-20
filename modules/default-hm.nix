{lib, ...}: {
  imports = [
    ./desktops/niri/niri-hm.nix
    ./desktops/niri/rofi-wayland/rofi-wayland.nix
    ./waybar/waybar.nix
    ./desktops/niri/swaylock.nix
  ];
}
