{lib, ...}: {
  imports = [
    ./packages/base_server.nix
    ./common/time.nix
    ./common/nix-nh.nix
  ];

  #networking
  networking.hostName = lib.mkDefault "default-hostname";
  networking.networkmanager.enable = true;

  users.users.howard = {
    isNormalUser = true;
    description = "Howard";
    extraGroups = ["networkmanager" "wheel" "video" "audio" "render" "docker"];
  };


  home-manager.backupFileExtension = "backup";

  virtualisation.docker = {
    enable = true;
  };

  #sound
  #no sound

  #state dont change unless ness
  system.stateVersion = "24.11";
}
