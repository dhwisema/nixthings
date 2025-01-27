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

  stylix.enable = true;
  stylix.targets.firefox.enable = true;
  stylix.autoEnable = true;
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "howard";
  home.homeDirectory = "/home/howard";
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;
  };

  home.packages = with pkgs; [
    ghostty
    art
    libreoffice-fresh
    yazi
    vscodium
    webcord-vencord
  ];
}
