{
  pkgs,
  lib,
  config,
  ...
}: {
  wayland.windowManager.sway = {
    extraOptions = "--unsupported-gpu";
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty";
      startup = [
        # Launch mako on start
        {command = "mako";}
        {command = "fuzzel";}

      ];
    };
  }; #end config
}
