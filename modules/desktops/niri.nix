{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    niri-s.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable niri and subsequent system packages";
    };
  };
  config = lib.mkIf config.niri-s.enable {

    programs.niri.enable = true;
    environment.variables.NIXOS_OZONE_WL = "1";
    environment.systemPackages = with pkgs; [

        swaylock

       # polkit_gnome
        greetd.greetd
        nwg-hello
        swaynotificationcenter
        swaybg
        gnome-keyring
        fuzzel
        mako
        waybar

    ];
#   systemd = {
#   user.services.polkit-gnome-authentication-agent-1 = {
#     description = "polkit-gnome-authentication-agent-1";
#     wantedBy = [ "graphical-session.target" ];
#     wants = [ "graphical-session.target" ];
#     after = [ "graphical-session.target" ];
#     serviceConfig = {
#         Type = "simple";
#         ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
#         Restart = "on-failure";
#         RestartSec = 1;
#         TimeoutStopSec = 10;
#       };
#   };
# };

#    systemd.user.services.niri-flake-polkit.enable = false;
#    services.xserver.displayManager.gdm.enable = true; 
    # services.xserver.desktopManager.gnome.enable = true;
  };
}
