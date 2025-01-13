{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/default.nix
  ];
  gnome.enable = true;
  gaming.enable = true;
  hardware.bluetooth.enable = true;
  niri.enable = true;
  networking.hostName = "laptop";

  #iso use only networking.networkmanager.enable = lib.mkForce false;

 # boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
}
