{...}: {
  imports = [
    ./hardware-configuration.nix
    ./../default.nix
  ];
  kde.enable = true;
  sway.enable = true;
  gaming.enable = true;
  nvidia.enable = true;

  hardware.bluetooth.enable = true;

  networking.hostName = "deskbox";
  time.hardwareClockInLocalTime = true;
}
