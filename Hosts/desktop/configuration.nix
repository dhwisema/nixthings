{...}: {
  imports = [
    ./hardware-configuration.nix
    ./../default.nix
  ];

  gaming.enable = true;
  nvidia.enable = true;

  hardware.bluetooth.enable = true;

  networking.hostName = "deskbox";
  time.hardwareClockInLocalTime = true;
}
