{
  pkgs,
  lib,
  config,
  hostname,
  username,
  ...
}:
{
  imports = [
    ./Base-config.nix
    ./../Desktop/Desktop.nix
    ./../Programs/wireshark.nix
  ];

services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};
  hardware.bluetooth.enable = true;
  services.flatpak.enable = true;
  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = true;
  environment.systemPackages = with pkgs; [
    seahorse
    udisks
    gnome-software
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];

    programs.nix-ld = {
    enable = true;
  };
  users.users.${username}.extraGroups = [
    "video"
    "audio"
    "render"
  ];
  services.fwupd.enable = true;
  services.libinput.enable = true;
  zramSwap.enable = true;
}
