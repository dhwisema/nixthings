{
  config,
  lib,
  stylix,
  pkgs,
  ...
}: {
  stylix.enable = true;
  stylix.image = ./wallpapers/tokyo_night/03.png;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/vice.yaml";
  stylix.polarity = "dark";
  stylix.autoEnable = true;
}
