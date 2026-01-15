{ config, pkgs, inputs, ... }:{

  programs.rofi= {
    enable = true;
    plugins = with pkgs;[
      rofi-rofi-bluetooth
      rofi-rofi-power-menu
    ];
    extraConfig = {
      modi = "window,drun,combii,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
    };
  };
}
