{
  pkgs,
  lib,
  config,
  ...
}: {
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
      keybindings = lib./mkOptionDefault {
        #can pass multiple options via ''
        "${modifier}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";
        "${modifier}+b" = "flatpak run com.google.Chrome '--ozone-platform-hint=auto'";
        "${modifier}+c" = "exec ${pkgs.vscodium}/bin/vscodium '--ozone-platform-hint=auto'";
      };
      modifier = "Mod4";
      terminal = "ghostty";
      startup = [
      ];
    };
  }; #end config
}
