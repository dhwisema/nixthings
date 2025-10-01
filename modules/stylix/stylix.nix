{
  config,
  lib,
  stylix,
  pkgs,
  ...
}: {
  stylix.enable = true;
  stylix.image = ./wallpapers/tokyo_night/03.png;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
  stylix.polarity = "dark";
  stylix.autoEnable = true;
  stylix.cursor = {
    name = rose-pine-cursor;
    package = pkgs.rose-pine-cursor;
    size = 12;
  };
#   stylix.targets.firefox = {
#     profileNames = ["profile_0"];
#     colorTheme.enable = true;
#     enable = true;    
# };
}
