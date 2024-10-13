{ config, pkgs, lib, ... }: {
  imports = [
      ./hardware-configuration.nix
      ./../default.nix

  ];
  gaming.enable = true;
  nvidia.enable = true;
  networking.hostName = "deskbox";
  time.hardwareClockInLocalTime = true;
}