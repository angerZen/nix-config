{pkgs, ...}: {
  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        "margin-top" = 2;
        "margin-bottom" = 2;
        "margin-left" = 2;
        "margin-right" = 2;
        height = 28;
        modules-left = ["custom/logo" "hyprland/window"];
        modules-center = ["hyprland/workspaces"];
        modules-right = [
          "tray"
          "backlight"
          "pulseaudio"
          "pulseaudio#microphone"
          "custom/wallpaper"
          "clock"
          "custom/power"
        ];

        "wlr/taskbar" = {
          format = "{icon}";
          "on-click" = "activate";
          "on-click-right" = "fullscreen";

          "icon-size" = 28;
          "tooltip-format" = "{title}";
        };
        "hyprland/window" = {
          "format" = "{title:30}";
          "max-length" = 30;
          "separate-outputs" = true;
          rewrite = {
            "\\s*(.*)\\s+" = "$1"; # Remove trailing whitespace
            # "\\s*" = # TODO FIXME
            #   "\${USER}@\${HOST}"; # Replace empty string with your username
            ".* - LibreWolf" = "LibreWolf";
          };
        };

        "hyprland/workspaces" = {
          "on-click" = "activate";
          format = "{icon}";
          "format-icons" = {
            "default" = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "active" = "󱓻";
            "urgent" = "󱓻";
          };
          "persistent-workspaces" = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
        };

        tray = {spacing = 16;};

        clock = {
          "tooltip-format" = "<tt>{calendar}</tt>";
          "format-alt" = "  {:%a, %d %b %Y}";
          format = "󰥔  {:%OI:%M %p}";
        };

        pulseaudio = {
          format = "{icon}";
          "format-bluetooth" = "󰂰";
          nospacing = 1;
          "tooltip-format" = "Volume : {volume}%";
          "format-muted" = "󰝟";
          "format-icons" = {
            "headphone" = "";
            "default" = ["󰖀" "󰕾" ""];
          };
          "on-click" = "pamixer -t";
          "on-click-right" = "pavucontrol";
          "scroll-step" = 1;
        };

        "custom/logo" = {
          format = "  ";
          tooltip = false;
          on-click = "menu";
        };
        "custom/wallpaper" = {
          format = "  ";
          on-click = "${pkgs.waypaper}/bin/waypaper";
          tooltip = true;
          tooltip-format = "Change wallpaper";
        };
        battery = {
          format = "{capacity}% {icon}";
          "format-icons" = {
            "charging" = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
            "default" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          };
          "format-full" = "󰁹 ";
          interval = 10;
          states = {
            warning = 20;
            critical = 10;
          };
          tooltip = false;
        };

        "custom/power" = {
          format = "󰤆";
          tooltip = false;
          on-click = "powermenu";
        };
        "custom/caffeine" = {
          format = "{}";
          max-length = 5;
          interval = 10;
          exec = "caffeine-status-icon";
          "on-click" = "caffeine";
          # exec-if = "pgrep spotify";
          # return-type = "";
        };
        "custom/night-shift" = {
          format = "{}";
          max-length = 5;
          interval = 10;
          exec = "night-shift-status-icon";
          "on-click" = "night-shift";
        };
        backlight = {
          device = "nvidia_0";
          format = "{icon}";
          "format-icons" = [" " " " "" "" "" "" "" "" ""];
        };
      };
    };
    style = ''
      @import '../../.cache/wal/colors-waybar.css';
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: Inconsolata Nerd Font;
        color: @foreground;
        font-weight: 700;
      }

      window#waybar {
        background-color: transparent;
        transition-property: background-color;
        transition-duration: 0.5s;
        border-radius: 10px;
        font-size: 16px;
      }

      .modules-left, .modules-center, .modules-right {
        border-radius: 10px;
        background-color: @background;
        padding: 2px 6px;
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #workspaces {
        background-color: transparent;
      }

      #workspaces button {
        all: initial; /* Remove GTK theme values (waybar #1351) */
        min-width: 0; /* Fix weird spacing in materia (waybar #450) */
        box-shadow: inset 0 -3px transparent; /* Use box-shadow instead of border so the text isn't offset */
        padding: 4px 12px;
        margin: 4px 2px;
        border-radius: 4px;
        background-color: @color2;
        color: @foreground;
      }

      #workspaces button.active {
        color: @foreground;
        background-color: @color7;
      }

      #workspaces button:hover {
       box-shadow: inherit;
       text-shadow: inherit;
       opacity: 0.8;
      }

      #workspaces button.urgent {
        background-color: @background;
      }

      #window > * {
        font-family: Inconsolata Nerd Font Mono;
      }

      #memory,
      #custom-power,
      #custom-caffeine,
      #custom-night-shift,
      #battery,
      #backlight,
      #pulseaudio,
      #network,
      #clock,
      #tray,
      #backlight{
        border-radius: 9px;
        margin: 4px 2px;
        padding: 4px 12px;
        background-color: @background;
        color: @color6;
      }

      #tray menu {
        background-color: @background;
        color: @color6;
      }

      #custom-logo {
        padding-right: 8px;
        padding-left: 8px;
        color: @color7;
      }

      @keyframes blink {
        to {
          background-color: #f38ba8;
          color: #181825;
        }
      }

      #battery.warning,
      #battery.critical,
      #battery.urgent {
        background-color: #ff0048;
        color: #181825;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #battery.charging {
        background-color: @background;
        color: @color6;
        animation: none;
      }

      #custom-power {
        background-color: @background;
        color: @foreground;
      }

      tooltip {
        border-radius: 8px;
        padding: 15px;
        background-color: @background;
        color: @color6;
      }

      tooltip label {
        padding: 5px;
        background-color: @background;
        color: @color6;
      }
    '';
  };
}
