{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
    yazi
    onlyofficedesktopeditors
    kdePackages.konsole
    distrobox-tui
    distrobox
    goofcord
    obsidian
    zellij
    eza
  ];
}
