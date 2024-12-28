{pkgs,lib,...}: {
  imports = [
    ./hardware-configuration.nix
    ./../default.nix
  ];
  gnome.enable = true;
  gaming.enable = true;
  hardware.bluetooth.enable = true;
  networking.hostName = "laptop";

  #iso use only networking.networkmanager.enable = lib.mkForce false;

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
}
