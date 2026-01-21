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
        height = 20;
        spacing = "4";

        modules-center = [ "clock" "niri/window" ];
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

          "niri/window" = {
      "max-length" = 40;
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
   * {
  font-family: "monospaced";
  font-size: 12px;
            }
            
      window#waybar {
        background: @base00;
        color: @base0D; /*maybe base0C this is text color */
        border: 1px solid @base00;
        border-radius: 0px;
      }
      #window {
        color: #d3869b;
      }

      tooltip {
          background: rgba(36, 36, 35, 0.999);
          font-size: 10px;
          border: 1px solid #77767B;
          border-radius: 10px;
      }
      tooltip label {
          color: #FFFFFF;
      } 

      window#waybar.empty #window {
        background-color: transparent;
        border: none;
      }

      #clock {
        margin-right: 3px;
        margin-left: 3px;
        margin-top: 0px;
        margin-bottom: 0px;
        padding-right: 4px;
        padding-left: 4px;
        padding-top: 0px;
        padding-bottom: 0px;
      }
      #battery {
        color: @base0C;
      }
      #battery.discharging.warning:not(.charging) {
        color: @base05;
        }
      #battery.discharging.critical:not(.charging) {
        color: @base08;
      } 
      #workspaces button.active {
        color: @base0C;
      }
      #workspaces button{
        color: @base03;
      }
      
    '';

  };
}
