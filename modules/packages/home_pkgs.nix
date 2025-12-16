{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
    yazi
    kdePackages.konsole
    distrobox-tui
    distrobox
    goofcord
    cmake
    gnumake
    obsidian
    zellij
    eza
  ];
}
