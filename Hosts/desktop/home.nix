{
  config,
  pkgs,
  lib,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  imports = [
    ./../../modules/default-hm.nix
  ];

  #defining monitors for me niri
  programs.niri.settings.outputs."DP-2" = {
    position.x = 0;
    position.y = 0;
    variable-refresh-rate = false;
    mode = "2560x1440@164.958";
  };
  programs.niri.settings.outputs."DP-1" = {
    position.x = -1920;
    position.y = 0;
  };
}
