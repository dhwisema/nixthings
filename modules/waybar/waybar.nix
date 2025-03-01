{
  config,
  lib,
  ...
}: {
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      spacing = "5";

      modules-center = ["clock"];
      modules-right = ["battery" "bluetooth" "memory" "network" "pulseaudio"];
      modules-left = ["niri/workspaces"];

      clock = {
        format = "{:%I:%M %p}";  # AM/PM format
        format-alt = "{:%Y-%m-%d}";
        "tooltip" = "false";
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
        format-wifi = "{essid} ({signalStrength}%) ";
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
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
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
    };
  };
}
