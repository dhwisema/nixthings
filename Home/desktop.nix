{ config, pkgs, ... }:

{
  imports = [
    ./server.nix
    ./programs/gaming.nix
    ./Desktop/niri.nix
  ];
}
