{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
    art
    libreoffice-fresh
    yazi
    kdePackages.konsole
    distrobox-tui
    distrobox
    goofcord
    cmake
    gnumake
    obsidian
  ];
}
