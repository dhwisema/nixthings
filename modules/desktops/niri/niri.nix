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
      fuzzel
      mako
      waybar
      swaylock
      sway-contrib.grimshot
      xwayland-satellite
      xfce.xfce4-panel
      pavucontrol
      waypaper
      swww
      catppuccin-sddm-cornersgant-sddm
    ];
    programs.niri.enable = true;
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;

    services.displayManager.sddm = {
      theme = "catpuccin-sddm-corners";
    };
  };
}
