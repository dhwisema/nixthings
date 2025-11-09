{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/default.nix
  ];

  niri.enable = true;
  gaming.enable = true;
  nvidia.enable = true;


  hardware.bluetooth.enable = true;
  # boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
  networking.hostName = "deskbox";
  # time.hardwareClockInLocalTime = true;

  systemd.services."systemd-suspend" = {
    serviceConfig = {
      Environment = ''"SYSTEMD_SLEEP_FREEZE_USER_SESSIONS=false"'';
    };
  };
}
