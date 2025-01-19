{
  #only dealing with packages to install
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    niri.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable niri";
    };
  };
  config = lib.mkIf config.niri.enable {
    programs.dconf.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    environment.systemPackages = with pkgs; [
      mako
      waybar
      swaylock
      sway-contrib.grimshot
      xwayland-satellite
      xfce.xfce4-panel
      pavucontrol
      waypaper
      swww
      adwaita-icon-theme-legacy
      adwaita-icon-theme
      #sddm specific files
      catppuccin-sddm-corners
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtsvg
      libsForQt5.qt5.qtquickcontrols
    ];
    programs.niri.enable = true;

    services.displayManager.sddm = {
      package = pkgs.kdePackages.sddm; # qt6 sddm version
      extraPackages = with pkgs;[sddm-astronaut];
    };
  };
}
