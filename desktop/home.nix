{config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    
  ];


    # This needs to actually be set to your username
    home.username = "howard";
    home.homeDirectory = "/home/howard";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;
  
}