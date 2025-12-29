{config,lib,pkgs,...}:{
  imports = [
  ./hardware/nvidia.nix
  ./themeing/stylix.nix
  ./Niri/niri.nix
  ];
}