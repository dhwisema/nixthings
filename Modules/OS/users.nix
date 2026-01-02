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
      hashedPassword = "$y$j9T$tsD8VLtqLhL5a/OIA7Txb1$bpOz8kmMODZVSPITsRMjhKd59m2Wvvhhh7w/ElmFdn1";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOM/XkR4NfhrMX2WcGJ10aYnPGcQHg+Jplw5rHowMOo dhwisema@ncsu.edu"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFmXsOd9g4b2fLApvFsqtUOhlSQCxbBX54Cn+RgiB/Sy howard@laptop"
      ];
    };
  };
}
