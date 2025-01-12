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
    environment.gnome.excludePackages = with pkgs; [
    ];
    environment.systemPackages = with pkgs; [
      fuzzel
      mako
      waybar
      swaylock
      sway-contrib.grimshot
    ];
  };
}
