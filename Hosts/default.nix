{lib, ...}: {
  imports = [
    ./../modules/stylix/stylix.nix
    ./../modules/graphics/nvidia.nix
    ./../modules/packages/base_packages.nix
    ./../modules/packages/gaming.nix
    ./../modules/packages/kernel.nix
    ./../modules/desktops/gnome.nix
    ./../modules/desktops/kde.nix
    ./../modules/packages/flatpak.nix
    ./../modules/common/time.nix
    ./../modules/common/nix-nh.nix
    ./../modules/desktops/sway/sway.nix
  ];

  #optional modules

  #networking
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
    extraGroups = ["networkmanager" "wheel" "video" "audio" "render"];
  };

  services.libinput.enable = true;

  #sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #state dont change unless ness
  system.stateVersion = "24.05";
}
