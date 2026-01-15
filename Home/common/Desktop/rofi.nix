{ config, pkgs, inputs, ... }:{

  programs.rofi= {
    enable = true;
    extraConfig = {
      modi = "window,drun,combi";


    };
  };
 home.packages = with pkgs; [
   rofi-bluetooth
   rofi-power-menu
 ];
}
