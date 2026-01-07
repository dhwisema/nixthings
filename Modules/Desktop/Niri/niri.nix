{
  #only dealing with packages to install
  config,
  pkgs,
  lib,inputs,
  ...
}:
{

  programs.dconf.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };
  services.gnome.gnome-settings-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    # sway-contrib.grimshot
    xwayland-satellite
    pavucontrol
    waypaper
    adwaita-icon-theme-legacy
    adwaita-icon-theme
    bluetuith
    nautilus
    gnome-keyring
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    libheif
    libheif.out

  ];
  hardware.brillo.enable = true;
  services.gvfs.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs =
          nprev.buildInputs
          ++ (with pkgs.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
          ]);
      });
    })
  ];
  environment.pathsToLink = [ "share/thumbnailers" ];

  programs.niri.enable = true;

  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
}
