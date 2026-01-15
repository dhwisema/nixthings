{ config, pkgs, inputs, ... }:{

  programs.rofi= {
    enable = true;
    extraConfig = {
      modi = "window,drun,combi,rofi-power-menu";


    };
  };
 home.packages = with pkgs; [
   rofi-bluetooth
   rofi-power-menu
 ];
}
