{ config, pkgs, lib, ... }: {
  imports = [
      ./../modules/nvidia.nix       
      ./../nixos-hardware/common/cpu/amd/default.nix
      ./../nixos-hardware/common/cpu/amd/pstate.nix
      ./../nixos-hardware/common/cpu/amd/zenpower.nix
      ./../nixos-hardware/common/pc/ssd/default.nix
  ];
  gaming.enable = true;
  nvidia.enable = true;
  networking.hostName = "deskbox";
  time.hardwareClockInLocalTime = true;
}