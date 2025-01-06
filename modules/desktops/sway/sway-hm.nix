{
  pkgs,
  lib,
  config,
  ...
}:

    let
    modifier = config.wayland.windowManager.sway.config.modifier;
    in lib.mkOptionDefault {
 

    "${modifier}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel '--dmenu' '--prompt=select window: '";
    "${modifier}+b" = "flatpak run com.google.Chrome";
    "${modifier}+c" = "exec ${pkgs.codium}/bin/codium";
  }
{
  programs.swaylock.enable = true;
  programs.swaylock.settings = {
    color = "808080";
    font-size = 24;
    indicator-idle-visible = false;
    indicator-radius = 100;
    line-color = "ffffff";
    show-failed-attempts = true;
  };

  
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "Mod4";
      terminal = "ghostty";
      startup = [
      ];
    };
  }; #end config
}
