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
  stylix.enable = true;

  programs.niri.settings.outputs.DP-4 = {
    position.x = 0;
    position.y = 0;
    variable-refresh-rate = true;
  };
  programs.niri.settings.outputs.DP-5 = {
    position.x = -1080;
    position.y = 0;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
