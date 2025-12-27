{pkgs, ...}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
 