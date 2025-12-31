{ pkgs, ... }:
{
  
  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    # distrobox-tui
    # distrobox #dont need this currently will reneable if i have to use code composer again.
    goofcord
    zellij
    ghostty
  ];

}
