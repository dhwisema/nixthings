{...}: {
  imports = [
    ./hardware-configuration.nix
    ./../default.nix
  ];
  gnome.enable = true;
  gaming.enable = true;
  hardware.bluetooth.enable = true;
  networking.hostName = "laptop";


  hardware.graphics.extraPackages = with pkgs; [
  amdvlk
  ];
  # For 32 bit applications 
  hardware.graphics.extraPackages32 = with pkgs; [
  driversi686Linux.amdvlk
  ];
}
