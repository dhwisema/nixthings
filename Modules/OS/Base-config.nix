{pkgs,lib,config,...}:
{
  imports = [./nix-config.nix];
  
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  services.getty.autologinUser = null;
    
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
}
