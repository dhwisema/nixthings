{lib, ...}: {
  imports = [
    ./graphics/nvidia.nix
    ./packages/base_packages.nix
    ./packages/power.nix
    ./packages/gaming.nix
    ./packages/kernel.nix
    ./packages/flatpak.nix
    ./common/time.nix
    ./common/nix-nh.nix
    ./desktops/niri/niri.nix
    ./stylix/stylix.nix
    ./packages/tailscale.nix
   ];
  nixpkgs.config.allowUnfree = true;

  #optional modules
  stylix.enable = true;
  #networking
  networking.hostName = lib.mkDefault "default-hostname";
  networking.networkmanager.enable = true;

  services.fwupd.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Most Electron Applications
    USE_WAYLAND = "1"; # ArmCord
  };
  services.printing.enable = true;

  users.users.howard = {
    isNormalUser = true;
    description = "Howard";
    extraGroups = ["networkmanager" "wheel" "video" "audio" "render" "docker" "plugdev"];
  };

  services.libinput.enable = true;

  home-manager.backupFileExtension = "backup";

  virtualisation.docker = {
    enable = true;
  };

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
