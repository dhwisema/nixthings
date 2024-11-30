{
  pkgs,
  ...
}: {
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

  services.flatpak.packages = [
    #{appId = ""; origin = "flathub";}

    "com.google.Chrome"
    "camp.nook.nookdesktop"
    "io.github.equicord.equibop"
  ];

  # using https://github.com/gmodena/nix-flatpak

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "daily"; # Default value
  };

  services.flatpak.update.onActivation = true;
}
