{
  config,
  lib,
  stylix,
  pkgs,
  ...
}: {
  stylix.enable = true;
  stylix.image = ./wallpapers/tokyo_night/03.png;
  stylix.polarity = "dark";
  stylix.autoEnable = true;
}
