{
  lib,
  pkgs,
  config,
  ...
}: {
  services.mako = {
    font = "Fira Code 10";
    layer = "overlay";
    anchor = "top-center";
    width = 300; # Notification width
    height = 100; # Notification height
    margin = "10"; # Screen margin (e.g., "10" or "20,50")
    padding = "5"; # Inner padding
    borderSize = 2; # Border thickness
    borderRadius = 5; # Rounded corners
    defaultTimeout = 10000; # Timeout in milliseconds (10 seconds)

    extraConfig = ''
      [mode=do-not-disturb]
      invisible=1
    '';
  };
}
