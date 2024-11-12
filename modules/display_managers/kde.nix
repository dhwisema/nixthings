{ config, pkgs, lib, ... }: {

  options = {
    kde.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable kde.";
    };
  };


    # Enable the KDE Plasma Desktop Environment.
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession="plasma";

}
