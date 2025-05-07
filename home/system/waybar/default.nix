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
        spacing = 8;
        #height = 28;

        modules-left = [
          "custom/logo"
          "hyprland/workspaces"
        ];

        modules-center = [
          "hyprland/window"
        ];

        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "custom/power"
          "custom/wallpaper"
          "clock"
        ];

        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "warp-on-scroll" = false;
          "format" = "{name}";
          "format-icons" = {
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
        };

        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };

        clock = {
          "tooltip-format" = "<tt>{calendar}</tt>";
          "format-alt" = "  {:%a, %d %b %Y}";
          format = "󰥔  {:%OI:%M %p}";
        };

        cpu = {
          format = "{}%  ";
          tooltip = true;
        };

        memory = {
          format = "{}% ";
          tooltip = true;
        };

        "temperature" = {
          "interval" = 10;
          "hwmon-path" = "/sys/devices/platform/coretemp.0/hwmon/hwmon4/temp1_input";
          "critical-threshold" = 100;
          "format-critical" = " {temperatureC}";
          "format" = " {temperatureC}°C";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          "format-bluetooth" = "{icon} {volume}%  {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = " {volume}%";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
          "on-click" = "pavucontrol";
        };
        
        "network" = {
          "format-wifi" = "   {essid} ({signalStrength}%)";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "on-click" = "menu";
        };

        "custom/logo" = {
          format = " ";
          tooltip = false;
          on-click = "menu";
        };

        "custom/wallpaper" = {
          format = "  ";
          on-click = "${pkgs.waypaper}/bin/waypaper";
          tooltip = true;
          tooltip-format = "Change wallpaper";
        };

        "custom/power" = {
          format = "󰤆  ";
          tooltip = false;
          on-click = "powermenu";
        };
      };
    };
    style = ''
      @import '../../.cache/wal/colors-waybar.css';
      * {
        font-family: FontAwesome, sans-serif;
        font-size: 15px;
      }

      window#waybar {
        color: @foreground;
        font-family: SpaceMono Nerd Font, feather;
      }

      .modules-left,
      .modules-center,
      .modules-right
      {
        background: @background;
        margin: 5px 10px;
        padding: 0 5px;
        border-radius: 15px;
      }
      
      .modules-left {
        padding: 0;
      }

      .modules-center {
        padding: 0 10px;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #language,
      #mpd {
        padding: 0 10px;
        border-radius: 15px;
      }

      #clock:hover,
      #battery:hover,
      #cpu:hover,
      #memory:hover,
      #disk:hover,
      #temperature:hover,
      #backlight:hover,
      #network:hover,
      #pulseaudio:hover,
      #wireplumber:hover,
      #custom-media:hover,
      #tray:hover,
      #mode:hover,
      #idle_inhibitor:hover,
      #scratchpad:hover,
      #power-profiles-daemon:hover,
      #language:hover,
      #mpd:hover {
        background: @background;
      }
      
      #workspaces button {
        background: transparent;
        font-family: SpaceMono Nerd Font, feather;
        font-weight: 900;
        font-size: 13pt;
        color: @foreground;
        border:none;
        border-radius: 15px;
      }

      #workspaces button.active {
        background: @color3;
        color: @background;
      }

      #workspaces button:hover {
        background: @color4;
        color: @background;
        box-shadow: none;
      }

      #custom-logo {
        margin-left: 5px;
        padding: 0 10px;
        font-size: 25px;
        transition: color .5s;
        border: none;
      }

      #custom-logo:hover {
        color: #1793d1;
      }
    '';
  };
}