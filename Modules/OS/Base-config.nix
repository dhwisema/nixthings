{
  pkgs,
  lib,
  config,
  hostname,
  ...
}:
{
  imports = [
    ./nix-config.nix
    ./users.nix
    ./ssh.nix
    ./../hardware/nvidia.nix
  ];

  networking.hostName = hostname;
  #enable and make fish defaultUserShell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  #set locale
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  systemd.targets.multi-user.enable = true;
  hardware.enableRedistributableFirmware = true;
  #systemd boot enable and also set latest kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
    initrd.systemd.enable = true;
  };
  #network manager default
  networking.networkmanager.enable = true;
  #tuned powermanagement
  services.tuned = {
    enable = true;
    settings = {
      dynamic_tuning = true;
    };
  };
  services.firewalld.enable = true;
  #tailscale
  services.tailscale.enable = true;
  system.stateVersion = "25.11";
}
