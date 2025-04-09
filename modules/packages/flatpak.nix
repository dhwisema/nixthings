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

  services.flatpak.packages = [
    #{appId = ""; origin = "flathub";}
    "com.calibre_ebook.calibre"
    "com.github.corna.Vivado"
    "io.github.flattool.Warehouse"
    "camp.nook.nookdesktop"
    "com.usebottles.bottles"
    "com.github.tchx84.Flatseal"
    "com.jetbrains.CLion"
    "im.riot.Riot"
    "dev.zed.Zed"
    "com.visualstudio.code"
  ];

  # using https://github.com/gmodena/nix-flatpak

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "daily"; # Default value
  };

  services.flatpak.update.onActivation = true;
}
