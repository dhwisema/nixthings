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

  services.tuned = {
    enable = true;
    settings = {
      dynamic_tuning = true;
      recommend_command = true;
    };
  };

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

}
