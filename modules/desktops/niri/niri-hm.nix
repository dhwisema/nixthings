{
  config,
  pkgs,
  lib,
  ...
}: {

 
  #defining monitors for me niri
  programs.niri.settings.outputs."DP-1" = {
    position.x = 0;
    position.y = 0;
#    variable-refresh-rate = false;
    # mode = "2560x1440@164.958";
  };
  programs.niri.settings.outputs."DP-2" = {
    position.x = -1920;
    position.y = 0;
  };


  stylix.targets.niri.enable = true;
  programs.niri.settings.spawn-at-startup = [
    {command = ["waybar"];}
    {command = ["mako"];}
    {command = ["swww-daemon"];}
    {command = ["swww img /home/howard/nix_things/modules/stylix/wallpapers/catppuccin/01.png"];}
  ];

  programs.niri.settings.prefer-no-csd = true;
  programs.niri.settings.environment = {
    QT_QPA_PLATFORM = "wayland";
    DISPLAY = ":0"; #may need to be moved to device specific shit bcecause of the fuckery that is my desktop display config
    NIXOS_OZONE_WL = "1";
  };

  programs.niri.settings.layout = {
    gaps = 8;
    always-center-single-column = true;
    default-column-width = {proportion = 0.5;};

    focus-ring = {
      enable = false;
      width = 4;
      # inactive.color = "rgb(88 91 112)";
      # active.color = "rgb(166 227 161)";
    };
    insert-hint = {
      enable = true;
      # display.color = "rgb(166 227 161 20%)";
    };
  };

  programs.niri.settings.cursor = {
    hide-after-inactive-ms = 1000;
    hide-when-typing = true;
    size = 12;
    theme = "rose-pine-cursor";

  };
  programs.niri.settings.window-rules = [
    {
      geometry-corner-radius = {
        bottom-left = 12.0;
        top-right = 12.0;
        bottom-right = 12.0;
        top-left = 12.0;
      };
      clip-to-geometry = true;
    }
  ];

  programs.niri.settings.switch-events = {
    "lid-close".action.spawn = ["sh" "-c" "swaylock --screenshot --clock --effect-pixelate 50 & systemctl suspend"];
  };
  programs.niri.settings.binds = {
    # Keys consist of modifiers separated by + signs, followed by an XKB key name
    # in the end. To find an XKB name for a particular key, you may use a program
    # like wev.
    #
    # "Mod" is a special modifier equal to Super when running on a TTY, and to Alt
    # when running as a winit window.
    #
    # Most actions that you can bind here can also be invoked programmatically with
    # `niri msg action do-something`.

    # Mod-Shift-/, which is usually the same as Mod-?,
    # shows a list of important hotkeys.
    "Mod+Shift+Slash".action.show-hotkey-overlay = {};

    # Suggested binds for running programs: terminal, app launcher, screen locker.
    "Mod+A".action.spawn = "pavucontrol";
    "Mod+N".action.spawn = ["sh" "nmtui"];
    "Mod+T".action.spawn = "ghostty";
    "Mod+S".action.spawn = "goofcord";
    "Mod+B".action.spawn = "firefox";
    "Mod+E".action.spawn = "Thunar";
    "Mod+D".action.spawn = ["rofi" "-show" "drun"];
    "Mod+Shift+D".action.spawn = ["rofi" "-show"];
    "Mod+alt+L".action.spawn = [
      "swaylock"
      "--screenshot"
      "--clock"
      "--indicator"
      "--indicator-radius"
      "100"
      "--indicator-thickness"
      "7"
      "--effect-pixelate"
      "40"
      # "--effect-vignette 0.5:0.5"
      # "--ring-color bb00cc"
      # "--key-hl-color 880033"
      # "--fade-in 0.2"
    ];
    "Mod+alt+V".action = {
      spawn = ["sh" "-c" "swaylock --screenshot --clock --effect-pixelate 50 & systemctl suspend"];

      # "--effect-vignette 0.5:0.5"
      # "--ring-color bb00cc"
      # "--key-hl-color 880033"
      # "--fade-in 0.2"
    };
    #

    # You can also use a shell. Do this if you need pipes, multiple commands, etc.
    # Note: the entire command goes as a single argument in the end.
    # Mod+T { spawn "bash" "-c" "notify-send hello && exec alacritty"; }

    # Example volume keys mappings for PipeWire & WirePlumber.
    # The allow-when-locked=true property makes them work even when the session is locked.
    # Volume
    "XF86AudioRaiseVolume" = {
      action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" "-l" "1.0"];
      repeat = true;
      allow-when-locked = true;
      cooldown-ms = 50;
    };
    "XF86AudioLowerVolume" = {
      action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" "-l" "1.0"];
      repeat = true;
      allow-when-locked = true;
      cooldown-ms = 50;
    };
    "XF86AudioMute" = {
      action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
      allow-when-locked = true;
    };
    "XF86AudioMicMute" = {
      allow-when-locked = true;
      action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];
    };

    # brightness
    "Mod+F5" = {
      action.spawn = ["brillo" "-U" "5"];
      repeat = true;
      cooldown-ms = 50;
    };
    "Mod+F6" = {
      action.spawn = ["brillo" "-A" "5"];
      repeat = true;
      cooldown-ms = 50;
    };

    "Mod+Q".action.close-window = {};

    "Mod+Left".action.focus-column-left = {};
    "Mod+Down".action.focus-window-down = {};
    "Mod+Up".action.focus-window-up = {};
    "Mod+Right".action.focus-column-right = {};
    "Mod+H".action.focus-column-left = {};
    "Mod+J".action.focus-window-down = {};
    "Mod+K".action.focus-window-up = {};
    "Mod+L".action.focus-column-right = {};

    "Mod+Ctrl+Left".action.move-column-left = {};
    "Mod+Ctrl+Down".action.move-window-down = {};
    "Mod+Ctrl+Up".action.move-window-up = {};
    "Mod+Ctrl+Right".action.move-column-right = {};
    "Mod+Ctrl+H".action.move-column-left = {};
    "Mod+Ctrl+J".action.move-window-down = {};
    "Mod+Ctrl+K".action.move-window-up = {};
    "Mod+Ctrl+L".action.move-column-right = {};

    # Alternative commands that move across workspaces when reaching
    # the first or last window in a column.
    # Mod+J     { focus-window-or-workspace-down; }
    # Mod+K     { focus-window-or-workspace-up; }
    # Mod+Ctrl+J     { move-window-down-or-to-workspace-down; }
    # Mod+Ctrl+K     { move-window-up-or-to-workspace-up; }

    "Mod+Home".action.focus-column-first = {};
    "Mod+End".action.focus-column-last = {};
    "Mod+Ctrl+Home".action.move-column-to-first = {};
    "Mod+Ctrl+End".action.move-column-to-last = {};

    "Mod+Shift+Left".action.focus-monitor-left = {};
    "Mod+Shift+Down".action.focus-monitor-down = {};
    "Mod+Shift+Up".action.focus-monitor-up = {};
    "Mod+Shift+Right".action.focus-monitor-right = {};
    "Mod+Shift+H".action.focus-monitor-left = {};
    "Mod+Shift+J".action.focus-monitor-down = {};
    "Mod+Shift+K".action.focus-monitor-up = {};
    "Mod+Shift+L".action.focus-monitor-right = {};

    "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = {};
    "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = {};
    "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = {};
    "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = {};
    "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = {};
    "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = {};
    "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = {};
    "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = {};

    # Alternatively, there are commands to move just a single window:
    # Mod+Shift+Ctrl+Left  { move-window-!-monitor-left; }
    # ...

    # And you can also move a whole workspace to another monitor:
    # Mod+Shift+Ctrl+Left  { move-workspace-to-monitor-left; }
    # ...

    "Mod+Page_Down".action.focus-workspace-down = {};
    "Mod+Page_Up".action.focus-workspace-up = {};
    "Mod+U".action.focus-workspace-down = {};
    "Mod+I".action.focus-workspace-up = {};
    "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = {};
    "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = {};
    "Mod+Ctrl+U".action.move-column-to-workspace-down = {};
    "Mod+Ctrl+I".action.move-column-to-workspace-up = {};

    # Alternatively, there are commands to move just a single window:
    # Mod+Ctrl+Page_Down { move-window-to-workspace-down; }
    # ...

    "Mod+Shift+Page_Down".action.move-workspace-down = {};
    "Mod+Shift+Page_Up".action.move-workspace-up = {};
    "Mod+Shift+U".action.move-workspace-down = {};
    "Mod+Shift+I".action.move-workspace-up = {};

    # You can bind mouse wheel scroll ticks using the following syntax.
    # These binds will change direction based on the natural-scroll setting.
    #
    # To avoid scrolling through workspaces really fast, you can use
    # the cooldown-ms property. The bind will be rate-limited to this value.
    # You can set a cooldown on any bind, but it's most useful for the wheel.
    "Mod+WheelScrollDown" = {
      cooldown-ms = 150;
      action.focus-workspace-down = {};
    };
    "Mod+WheelScrollUp" = {
      cooldown-ms = 150;
      action.focus-workspace-up = {};
    };
    "Mod+Ctrl+WheelScrollDown" = {
      cooldown-ms = 150;
      action.move-column-to-workspace-down = {};
    };
    "Mod+Ctrl+WheelScrollUp" = {
      cooldown-ms = 150;
      action.move-column-to-workspace-up = {};
    };

    "Mod+WheelScrollRight".action.focus-column-right = {};
    "Mod+WheelScrollLeft".action.focus-column-left = {};
    "Mod+Ctrl+WheelScrollRight".action.move-column-right = {};
    "Mod+Ctrl+WheelScrollLeft".action.move-column-left = {};

    # Usually scrolling up and down with Shift in applications results in
    # horizontal scrolling; these binds replicate that.
    "Mod+Shift+WheelScrollDown".action.focus-column-right = {};
    "Mod+Shift+WheelScrollUp".action.focus-column-left = {};
    "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = {};
    "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = {};

    # Similarly, you can bind touchpad scroll "ticks".
    # Touchpad scrolling is continuous, so for these binds it is split into
    # discrete intervals.
    # These binds are also affected by touchpad's natural-scroll, so these
    # example binds are "inverted", since we have natural-scroll enabled for
    # touchpads by default.
    # Mod+TouchpadScrollDown { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02+"; }
    # Mod+TouchpadScrollUp   { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02-"; }

    # You can refer to workspaces by index. However, keep in mind that
    # niri is a dynamic workspace system, so these commands are kind of
    # "best effort". Trying to refer to a workspace index bigger than
    # the current workspace count will instead refer to the bottommost
    # (empty) workspace.
    #
    # For example, with 2 workspaces + 1 empty, indices 3, 4, 5 and so on
    # will all refer to the 3rd workspace.
    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;
    "Mod+6".action.focus-workspace = 6;
    "Mod+7".action.focus-workspace = 7;
    "Mod+8".action.focus-workspace = 8;
    "Mod+9".action.focus-workspace = 9;
    "Mod+Ctrl+1".action.move-column-to-workspace = 1;
    "Mod+Ctrl+2".action.move-column-to-workspace = 2;
    "Mod+Ctrl+3".action.move-column-to-workspace = 3;
    "Mod+Ctrl+4".action.move-column-to-workspace = 4;
    "Mod+Ctrl+5".action.move-column-to-workspace = 5;
    "Mod+Ctrl+6".action.move-column-to-workspace = 6;
    "Mod+Ctrl+7".action.move-column-to-workspace = 7;
    "Mod+Ctrl+8".action.move-column-to-workspace = 8;
    "Mod+Ctrl+9".action.move-column-to-workspace = 9;

    # Alternatively, there are commands to move just a single window:
    # Mod+Ctrl+1 { move-window-to-workspace 1; }

    # Switches focus between the current and the previous workspace.
    # Mod+Tab { focus-workspace-previous; }

    "Mod+Comma".action.consume-window-into-column = {};
    "Mod+Period".action.expel-window-from-column = {};

    # There are also commands that consume or expel a single window to the side.
    # Mod+BracketLeft  { consume-or-expel-window-left; }
    # Mod+BracketRight { consume-or-expel-window-right; }

    "Mod+R".action.switch-preset-column-width = {};
    "Mod+Shift+R".action.reset-window-height = {};
    "Mod+F".action.maximize-column = {};
    "Mod+Shift+F".action.fullscreen-window = {};
    "Mod+C".action.center-column = {};

    # Finer width adjustments.
    # This command can also:
    # * set width in pixels: "1000"
    # * adjust width in pixels: "-5" or "+5"
    # * set width as a percentage of screen width: "25%"
    # * adjust width as a percentage of screen width: "-10%" or "+10%"
    # Pixel sizes use logical, or scaled, pixels. I.e. on an output with scale 2.0,
    # set-column-width "100" will make the column occupy 200 physical screen pixels.
    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Equal".action.set-column-width = "+10%";

    # Finer height adjustments when in column with other windows.
    "Mod+Shift+Minus".action.set-window-height = "-10%";
    "Mod+Shift+Equal".action.set-window-height = "+10%";

    #floating and no floating
    "Mod+Slash".action.toggle-window-floating = {};

    # Actions to switch layouts.
    # Note: if you uncomment these, make sure you do NOT have
    # a matching layout switch hotkey configured in xkb options above.
    # Having both at once on the same hotkey will break the switching,
    # since it will switch twice upon pressing the hotkey (once by xkb, once by niri).
    # Mod+Space       { switch-layout "next"; }
    # Mod+Shift+Space { switch-layout "prev"; }

    "Print".action.screenshot = {};
    "Ctrl+Print".action.screenshot-screen = {};
    "Alt+Print".action.screenshot-window = {};

    "Mod+Shift+s".action.screenshot = {};

    # The quit action will show a confirmation dialog to avoid accidental exits.
    "Mod+Shift+E".action.quit = {};

    # Powers off the monitors. To turn them back on, do any input like
    # moving the mouse or pressing any other key.
    "Mod+Shift+P".action.power-off-monitors = {};
  };
}
