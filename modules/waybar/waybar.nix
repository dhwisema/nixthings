{
  config,
  lib,
  ...
}: {
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;

      modules-center = ["clock"];
      modules-right = ["battery"];
      modules-left = ["niri/workspaces" "niri-window"];
    };
  };
}
