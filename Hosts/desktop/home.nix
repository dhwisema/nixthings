{
  config,
  pkgs,
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "howard";
  home.homeDirectory = "/home/howard";
  imports = [
    ./../../modules/default-hm.nix
  ];

  #defining monitors for me niri
  programs.niri.settings.outputs."LG Electronics LG ULTRAGEAR 403MXEZ81564" = {
    position.x = 0;
    position.y = 0;
    variable-refresh-rate = "on-demand";
    mode = "2560x1440@164.958";
  };
  programs.niri.settings.outputs."Lenovo Group Limited T24i-2L VKMR655" = {
    position.x = -1080;
    position.y = 0;
  };
}
