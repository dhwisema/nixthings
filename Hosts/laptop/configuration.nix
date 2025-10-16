{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/default.nix
  ];

  services.power-profiles-daemon.enable = true;
  services.tlp.enable = pkgs.lib.mkForce false;
  gaming.enable = true;
  hardware.bluetooth.enable = true;
  niri.enable = true;
  power.enable = false;
  networking.hostName = "laptop";

  services.fprintd.enable = lib.mkDefault true;
  boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ]; # disable psr-su

  #iso use only networking.networkmanager.enable = lib.mkForce false;

  #boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
  systemd.user.services."exit-ccs" = {

    Description = "Stop distrobox ccs container on logout";
    After = [ "graphical-session.target" ];

    ServiceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.distrobox}/bin/distrobox stop ccs'";
    };

    WantedBy = [ "exit.target" ];

  };

}
