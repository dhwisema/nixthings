{
  config,
  lib,
  stylix,
  ...
}:
{
  stylix.targets.waybar.colors.enable = true;
  stylix.targets.waybar.addCss = false;
  
  programs.waybar = {
    systemd.enable = true;
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = "5";

        modules-center = [ "clock" ];
        modules-right = [
          "battery"
          "bluetooth"
          "network"
          "pulseaudio"
        ];
        modules-left = [ "niri/workspaces" ];

          bluetooth = {
            format = " {status}";
            format-disbaled = "";
            format-connected =" {num_connections} connected";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
            on-click = "rofi-bluetooth";
          };

        
        clock = {
          format = "{:%r %D}";
          tooltip = false;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󱟢";
          format-alt = "{time} {icon}";
          # format-icons = [ "" "" "" "" "" ];
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%)  ";
          format-ethernet = "{ipaddr}/{cidr} 󰈀";
          tooltip-format = "{ifname} via {gwaddr} 󰈀";
          format-linked = "{ifname} (No IP) 󰈀";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source} ";
          format-source = " {volume}%  ";
          format-source-muted = "  ";
          format-icons = {
            headphone = "";
            hands-free = "󰋎";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
        # "custom/spacer" = {
        #   format = " "; # Insert a blank space
        #   interval = "once"; # Only render once
        #   tooltip = false; # Disable tooltip
        # };
      };
    };
    style = ''
   * {
        font-size: 14px;
        font-family: monospace;
        border-radius: 12px;
        border: solid @Based0D
      }
      window#waybar {
        background: @base00;
      }
      .module {
         border-radius: 8px;
         border: 2px solid @base0D;
         background-color: @base01;
         /*
         padding: 0 16px;
         margin: 8px 4px 0; */
       }
      window#waybar.empty #window {
        background-color: transparent;
        border: none;
      }


      
    '';

  };
}
