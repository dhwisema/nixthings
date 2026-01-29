{ pkgs, ... }:
{

  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    # distrobox-tui
    # distrobox #dont need this currently will reneable if i have to use code composer again.
    qtcreator
    uv
    python314
    vesktop
    zellij
    ghostty
    alejandra
    kicad
    nil
    signal-desktop
    element-desktop
    obsidian
    nixd
    zoxide
    vicinae
  ];
  programs.vicinae = {
    enable = true;
  };

}
