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
  niri.enable = true;
  gaming.enable = true;
  nvidia.enable = true;

  hardware.bluetooth.enable = true;
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
  networking.hostName = "deskbox";
  time.hardwareClockInLocalTime = true;
}
