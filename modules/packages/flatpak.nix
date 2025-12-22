{pkgs, ...}: {
  #flatpak setup
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://www.flathub.org/repo/flathub.flatpakrepo
    '';
  };

  services.flatpak.packages = [
    #{appId = ""; origin = "flathub";}
    "io.github.flattool.Warehouse"
    "camp.nook.nookdesktop"
    "com.github.tchx84.Flatseal"
  ];

  # using https://github.com/gmodena/nix-flatpak

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "daily"; # Default value
  };

  services.flatpak.update.onActivation = true;
}
