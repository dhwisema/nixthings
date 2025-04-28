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

   services.fprintd.enable = lib.mkDefault true;
#  boot.kernelParams = ["amdgpu.dcdebugmask=0x200"]; #disable psr-su

  #iso use only networking.networkmanager.enable = lib.mkForce false;

  #boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
}
