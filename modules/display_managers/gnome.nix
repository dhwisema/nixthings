{ config, pkgs, lib, ... }: {
    options = {
    gnome.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable gnome";
    };
  };



  services.xserver.enable = true;
  services.xserver.gdm.enable = true;
  services.xserver.gnome.enable = true;

}