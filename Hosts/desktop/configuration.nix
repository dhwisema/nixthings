{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../default.nix
  ];

  boot.kernelParams = ["amd_pstate=guided"];
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "schedutil";

  boot.blacklistedKernelModules = ["k10temp"];
  boot.extraModulePackages = [config.boot.kernelPackages.zenpower];
  boot.kernelModules = ["zenpower" "amd-pmc"];

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
