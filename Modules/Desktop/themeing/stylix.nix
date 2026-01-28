{
  config,
  lib,
  stylix,
  pkgs,
  ...
}: {
  stylix.targets.vicinae.enable = true;
  stylix.targets.vicinae.opacity.enable = false;
  stylix.enableReleaseChecks = false;
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
  stylix.polarity = "dark";
  stylix.autoEnable = true;
  stylix.cursor = {
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 18;
  };

}
