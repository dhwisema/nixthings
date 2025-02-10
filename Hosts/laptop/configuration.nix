{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/default.nix
  ];
  gaming.enable = true;
  hardware.bluetooth.enable = true;
  niri.enable = true;
  networking.hostName = "laptop";
  boot.kernelParams = ["amdgpu.dcdebugmask=0x200"]; #disable psr-su
  gnome.enable = true;

  #iso use only networking.networkmanager.enable = lib.mkForce false;

  #boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
}
