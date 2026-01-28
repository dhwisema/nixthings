{pkgs,config,lib,username,...}:{
  prgroams.wireshark.enable=true;
  programs.wireshark.package = pkgs.wireshark;
  users.users.${username}.extraGroups = ["wireshark"];
}
