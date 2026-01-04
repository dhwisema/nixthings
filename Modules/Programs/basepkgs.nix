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
    lazygit
    yazi
    pkill
    btop
    jq
  
  ];
}
