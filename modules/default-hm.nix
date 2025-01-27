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
  nixpkgs.config.firefox = {
    enableTridactylNative = true;
    enableFxCastBridge = true;
    speechSynthesisSupport = true;
  };
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = with pkgs; [tridactyl-native fx-cast-bridge];
    package = pkgs.firefox-bin;
  };

  home.packages = with pkgs; [
    ghostty
    art
  ];
}
