{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
    yazi
    onlyoffice-desktopeditors
    distrobox-tui
    distrobox
    goofcord
    zellij
    eza
    helix
  ];
}
