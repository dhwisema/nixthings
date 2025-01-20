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

      modules-center = ["clock"];
      modules-right = ["battery" "bluetooth" "memory" "network" "pulseaudio"];
      modules-left = ["niri/workspaces" "wlr/taskbar"];
    };
  };
}
