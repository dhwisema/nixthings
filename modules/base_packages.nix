{ pkgs,... }: {
  environment.systemPackages = with pkgs; [
    gnome-software
    vesktop
    git
    lazygit
    usbmuxd
    ranger
    libreoffice-fresh
    libimobiledevice
    boxbuddy
    distrobox
    
    filezilla
    nixd
    vscodium
    bitwarden
    google-chrome
   
  ];
  #enable and make fish defaultUserShell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  #flatpak setup
  services.flatpak.enable=true;
    systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };




  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "howard" ];

  

}
