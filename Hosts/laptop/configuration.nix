{...}: {
  imports = [
    ./hardware-configuration.nix
    ./../default.nix
  ];
  gnome.enable = true;
  gaming.enable = true;
  hardware.bluetooth.enable = true;
  networking.hostName = "laptop";
}
