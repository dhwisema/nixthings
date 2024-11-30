{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome-software
    usbmuxd
    git
    lazygit
    libreoffice-fresh
    libimobiledevice
    kitty
    kitty-themes

    yazi
    alejandra
    nil
  ];

  fonts.packages = with pkgs; [nerdfonts];
  #enable and make fish defaultUserShell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  
}
