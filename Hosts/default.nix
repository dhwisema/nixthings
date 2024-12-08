{lib, ...}: {
  imports = [
    ./../modules/graphics/nvidia.nix
    ./../modules/packages/base_packages.nix
    ./../modules/packages/gaming.nix
    ./../modules/packages/kernel.nix
    ./../modules/display_managers/gnome.nix
    ./../modules/display_managers/kde.nix
    ./../modules/flatpak.nix
    ./../modules/common/sound.nix
    ./../modules/common/time.nix
    ./../modules/common/nix-nh.nix
  ];

  #optional modules
  hardware.bluetooth.enable = true;
  sound.enable = true;
  kde.enable = true;

  #everything else
  networking.hostName = lib.mkDefault "default-hostname";
  networking.networkmanager.enable = true;

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  users.users.howard = {
    isNormalUser = true;
    description = "Howard";
    extraGroups = ["networkmanager" "wheel"];
  };

  nixpkgs.config.allowUnfree = true;

  services.libinput.enable = true;

  system.stateVersion = "24.05";
}
