{lib, ...}: {
  imports = [
    ./graphics/nvidia.nix
    .packages/base_packages.nix
    ./packages/gaming.nix
    ./packages/kernel.nix
    ./desktops/gnome.nix
    ./desktops/kde.nix
    ./packages/flatpak.nix
    ./common/time.nix
    ./common/nix-nh.nix
    ./desktops/niri/niri.nix
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
