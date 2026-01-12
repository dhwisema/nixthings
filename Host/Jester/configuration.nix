{
  pkgs,
  lib,
  ...
}:
{

  services.tlp.enable = pkgs.lib.mkForce false;

  services.fprintd = {
    enable = true;
    package = pkgs.fprintd-tod;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };
  boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ]; # disable psr-su

  #iso use only networking.networkmanager.enable = lib.mkForce false;

  #boot.kernelPackages = lib.mkForce pkgs.linuxPackages;

}
