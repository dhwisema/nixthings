{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    sway.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable sway.";
    };
  };

  config = lib.mkIf config.sway.enable {
    environment.systemPackages = with pkgs; [
      brightnessctl
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      mako # notification system developed by swaywm maintainer
      grimshot # screenshot functions
      sww #wallpapers and shi
      wl-clipboard-history #clipboard history
      fuzzel #launcher
      waybar # bar
      kanshi #displau
      rofi-wayland # launcher as well???abort
      wl
      sunset # white temp control
      imv #image view
    ];

    # Enable the gnome-keyring secrets vault.
    # Will be exposed through DBus to programs willing to store secrets.
    services.gnome.gnome-keyring.enable = true;

    # enable sway window manager
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

    #enable light for backligh control
    programs.light.enable = true;
  };
}
