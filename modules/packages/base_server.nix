{pkgs, ...}: {
  environment.systemPackages = with pkgs; [

    git
    lazygit
    btop
    libsecret
    seahorse
    goofcord
    yazi
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];
  #enable and make fish defaultUserShell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
