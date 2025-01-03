{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome-software
    usbmuxd
    git
    lazygit
    libreoffice-fresh

    vscodium
    yazi
    alejandra
    nil
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
    
  ];
  #enable and make fish defaultUserShell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
