{ pkgs,... }: {
  environment.systemPackages = with pkgs; [
    gnome-software
    vesktop
    git
    lazygit
    vscode
    usbmuxd
    ranger
    libreoffice-fresh
    libimobiledevice
    boxbuddy
    distrobox
    xterm
    filezilla
    nixd
    bitwarden
  ];
  #enable and make fish defaultUserShell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}

