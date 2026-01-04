{
  config,
  lib,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    curl
    wget
    yazi
    pkill
    btop
    jq
  
  ];
}
