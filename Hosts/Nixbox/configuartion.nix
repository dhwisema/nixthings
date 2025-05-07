{ ... }: {
  imports = [
    ./hardware-configuration.nix
    
    
  ];

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.hostName = "nixbox";
  networking.domain = "";
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEOpf39CFo3U9gJBxb1DaIPrp3/NCfelkTN+yMSNPNt4 dhwisema@ncsu.edu''];
  system.stateVersion = "23.11";
}



