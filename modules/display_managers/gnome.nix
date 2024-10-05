{ config, pkgs, lib, ... }: {
    options = {
    gnome.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable gnome";
    };
  };
  config = lib.mkIf config.gnome.enable {



    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  };
}