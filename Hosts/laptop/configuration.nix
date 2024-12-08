{...}: {
  imports = [
    ./hardware-configuration.nix
    ./../default.nix
  ];

  gaming.enable = true;
  networking.hostName = "laptop";
}
