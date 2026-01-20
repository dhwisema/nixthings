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
          format = "{:%I:%M%p %D}";
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
   * {  min-width: 10px;
        min-height: 2px;
        font-size: 14px;
        font-family: monospace;
        padding:  1px;
        margin: 0px 0px;
      }
      window#waybar {
        background: @base00;
         border-radius: 8px;
         border: 1px;
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
      
      #battery {
        color: @base00;
      }
      #battery.discharging.warning {
        color: @base09;
        }
      #battery.discharging.critical {
        color: @base08;
      } 
      #workspaces button.active {
        color: @base03;
      }
      
    '';

  };
}
