{ config, pkgs, ... }:

{
  imports = [
    ./server.nix
    ./common/programs/gaming.nix
    ./common/Desktop/niri.nix
  ];
}
