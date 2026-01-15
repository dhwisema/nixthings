{ config, pkgs, inputs, ... }:{

  programs.rofi= {
    enable = true;
    plugins = with pkgs;[
      rofi-bluetooth
      rofi-power-menu
    ];
    extraConfig = {
      modi = "window,drun,combi,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu,bluetooth:${pkgs.rofi-bluetooth}/bin/rofi-bluetooth";
    };
  };
}
