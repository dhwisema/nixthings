{ config, pkgs, lib, ... }: {
  imports = [
      #./hardware-configuration.nix
      ./../default.nix
  ];
  gaming.enable = true;
  nvidia.enable = true;
  networking.hostName = "deskbox";
  time.hardwareClockInLocalTime = true;


    hardware.bluetooth.enable = true;

    hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}