{pkgs, ...}: {

  #flatpak setup
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };



  # services.flatpak.packages = [
  #   { appId = "com.brave.Browser"; origin = "flathub";  }
  #   "com.obsproject.Studio"
  #   "im.riot.Riot"
  # ];


  services.flatpak.package = [
    #{appId = ""; origin = "flathub";}
    {appId = "io.github.equicord.equibop"; origin = "flathub";}
    {appId = "com.google.Chrome"; origin = "flathub";}
    {appId = "camp.nook.nookdesktop"; origin = "flathub";}
    
  ];

  # using https://github.com/gmodena/nix-flatpak

  services.flatpak.update.auto = {
  enable = true;
  onCalendar = "daily"; # Default value
  };

  services.flatpak.update.onActivation = true;
  
}