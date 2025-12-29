{
  config,
  lib,
  pkgs,
  ...
}:
{
  #this feels like a bad idea so disabling for now
  # Enable passwordless sudo.
  # security.sudo.extraRules = [
  #   {
  #     users = [ "irrelevancy" ];
  #     commands = [
  #       {
  #         command = "ALL";
  #         options = [ "NOPASSWD" ];
  #       }
  #     ];
  #   }
  # ];

  users = {
    mutableUsers = false;
    users.${"irrelevancy"} = {
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
