{ config, pkgs, username, ... }:

{

  programs.git = {
    enable = true;
    settings = {
      user.email = "dhwisema@ncsu.edu";
      user.name = "dhwisema";
    };
  };

  imports = [./programs/home-pkgs-server.nix];
  home.packages = with pkgs; [
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "irrelevancy";
  home.homeDirectory =  ./. + "/${username}/irrelevancy";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
