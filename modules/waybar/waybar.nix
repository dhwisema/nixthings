{
  config,
  lib,
  ...
}: {
  programs.waybar.setting = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
    };
  };
}
