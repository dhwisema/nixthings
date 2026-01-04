{
  pkgs,
  lib,
  config,
  hostname,
  ...
}:
{
  imports = [
    ./Base-config.nix
    ./../Desktop/Desktop.nix
  ];

  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    seahorse
    udisks
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];
}
