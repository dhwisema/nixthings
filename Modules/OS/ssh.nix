{
  config,
  pkgs,
  username,
  ...
}:{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # Enable passwordless sudo.
  security.sudo.extraRules = [
    {
      users = [ username ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  users = {
    mutableUsers = true;
    users.${username} = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      openssh.authorizedKeys.keys = [

        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFmXsOd9g4b2fLApvFsqtUOhlSQCxbBX54Cn+RgiB/Sy howard@laptop"
      ];
    };
  };
}
