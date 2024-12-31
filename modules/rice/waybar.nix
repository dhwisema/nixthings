{...}:{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passtrough = false;
      gtk-layer-shell = true;
      height = 0;
      modules-right = [
        "tray"
        "network"
        "custom/divider"
        "backlight"
        "custom/divider"
        "battery"
        "custom/divider"
        "clock"
      ];

      battery = { format = "󰁹 {}%"; };
      cpu = {
        interval = 10;
        format = "󰻠 {}%";
        max-length = 10;
        on-click = "";
      };
      memory = {
        interval = 30;
        format = "  {}%";
        format-alt = " {used:0.1f}G";
        max-length = 10;
      };
      backlight = {
        format = "󰖨 {}";
        device = "acpi_video0";
      };
      tray = {
        icon-size = 13;
        tooltip = false;
        spacing = 10;
      };
      network = {
        format = "󰖩 {essid}";
        format-disconnected = "󰖪 disconnected";
      };
      clock = {
        format = " {:%I:%M %p   %m/%d} ";
        tooltip-format = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>'';
      };
            "custom/divider" = {
        format = " | ";
        interval = "once";
        tooltip = false;
      };


    }];
  };
}