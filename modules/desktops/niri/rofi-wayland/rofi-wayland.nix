{ config, pkgs, inputs, ... }:{

  programs.rofi= {
    enable = true;
    package= pkgs.rofi-wayland;
    extraConfig = {
      modi = "window,drun,combi";


    };
  };

}