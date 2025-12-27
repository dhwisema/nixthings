{ config, pkgs, inputs, ... }:{

  programs.rofi= {
    enable = true;
    extraConfig = {
      modi = "window,drun,combi";


    };
  };

}