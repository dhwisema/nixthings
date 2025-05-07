{
  config,
  pkgs,
  lib,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "howard";
  home.homeDirectory = "/home/howard";
  home.stateVersion = "24.11";

   # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish.enable = true;


}






