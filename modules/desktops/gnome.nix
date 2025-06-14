{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    gnome.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable gnome";
    };
  };
  config = lib.mkIf config.gnome.enable {
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-maps
      epiphany # web browser
      geary # email reader. Up to 24.05. Starting from 24.11 the package name is just geary.
      evince # document viewer
      gnome-music
      totem
    ];
    environment.systemPackages = with pkgs; [
      adwaita-icon-theme-legacy
      adwaita-icon-theme
      gnome-tweaks
    ];

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };
}
