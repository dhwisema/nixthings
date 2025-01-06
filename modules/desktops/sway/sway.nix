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

    security.polkit.enable = true; #AUTH STUFF

    environment.systemPackages = with pkgs; [
      mako #notif
      alacritty #default term will change later
      gebaar-libinput # touchpad gesture daemon
      i3status-rust # i3status
      imv # image viewer
      kanshi # display config
      swww #wakkoaoer
      waybar
      wldash
      #wofi
      fuzzel
      perl540Packages.Apppapersway

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
