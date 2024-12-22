{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome-software
    usbmuxd
    git
    lazygit
    libreoffice-fresh

    kitty
    kitty-themes

    vscodium
    yazi
    alejandra
    nil
  ];

  fonts.packages = with pkgs; [
    #nerd-fonts.hack
    #nerd-fonts.fira-code
    fira-code-nerdfont
  ];
  #enable and make fish defaultUserShell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
