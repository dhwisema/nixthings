{
  #only dealing with packages to install
  config,
  pkgs,
  lib,
  niri,
  ...
}: {
  options = {
    niri.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable niri";
    };
  };
  config = lib.mkIf config.niri.enable {
    universal.modules = [niri.nixosModules.niri];
    environment.systemPackages = with pkgs; [
      fuzzel
      mako
      waybar
      swaylock
      sway-contrib.grimshot
    ];
    programs.niri.enable = true;
    nixpkgs.overlays = [niri.overlays.niri];
    programs.niri.pkgs = pkgs.niri-stable;
  };
}
