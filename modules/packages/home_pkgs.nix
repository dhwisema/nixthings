{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
    yazi
    onlyoffice-desktopeditors
    kdePackages.konsole
    distrobox-tui
    distrobox
    goofcord
    zellij
    eza
  ];
}
