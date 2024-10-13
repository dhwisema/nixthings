{ config, pkgs, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./../default.nix
  
  ];

  gaming.enable = false;
  networking.hostName = "laptop";
  
}