{
  #only dealing with packages to install
  config,
  pkgs,
  lib,
  ...
}: {

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
      sway-contrib.grimshot
      xwayland-satellite
      pavucontrol
      waypaper
      swww
      adwaita-icon-theme-legacy
      adwaita-icon-theme
      bluetuith
      file-roller
      gnome-keyring

    ];
    hardware.brillo.enable = true;
    programs.thunar.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
    services.gvfs.enable = true;
    services.tumbler.enable = true;

    programs.niri.enable = true;

    services.displayManager.gdm.enable = true;
    services.displayManager.gdm.wayland = true;
}
