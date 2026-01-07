{ config, pkgs, ... }:

{
  imports = [
    ./server.nix
    ./common/programs/gaming.nix
    ./common/programs/home-pkgs-desktop.nix
    ./common/Desktop/niri.nix
  ];
}
