{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome-software
    usbmuxd
    git
    lazygit
    btop
    pik
    brillo
    alejandra
    nil
    gvfs
    udisks
    labwc
    cmake
    gtest
    nautilus
    vscode-fhs
    verible
    libsecret
    seahorse
    gcc
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];
  #enable and make fish defaultUserShell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
