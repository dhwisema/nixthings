{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
    nautilus
    vscode-fhs
    libsecret
    seahorse
    gcc
    jq 
    
  ];


  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];
  #enable and make fish defaultUserShell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
