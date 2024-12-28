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

    environment.systemPackages = with pkgs; [

        swaylock

       # polkit_gnome
        greetd.greetd
        nwg-hello
        swaynotificationcenter
        swaybg
        gnome-keyring
        fuzzel

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
