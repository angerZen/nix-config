{
  config,
  pkgs,
  ...
}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "lock";
        action = "${pkgs.hyprlock}/bin/hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "killall -9 Hyprland sleep 2";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
    ];

    style = ''
            @import '../../.cache/wal/colors-waybar.css';
            * {
              font-family: "Noto Sans";
              background-image: none;
              transition: 20ms;
            }

          window {
            background-color: rgba(12,12,12,0.5);
          }

          button {
             color: @foreground;
             font-size:20px;

             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;

              border: 3px solid @background;
             background-color: @background;
              box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          }

      button:focus,
               button:active {
      color: @color7;
             background-color: @color2;
      border: 3px solid @color2;
               }

             /*
                -----------------------------------------------------
                Buttons
                -----------------------------------------------------
              */

      #lock,#logout,#suspend,#hibernate,#shutdown,#reboot {
        margin: 10px;
        border-radius: 10px;
      }

      #lock {
              background-image: image(url("icons/lock.png"));
      }

      #logout {
              background-image: image(url("icons/logout.png"));
      }

      #suspend {
              background-image: image(url("icons/suspend.png"));
      }

      #hibernate {
              background-image: image(url("icons/hibernate.png"));
      }

      #shutdown {
              background-image: image(url("icons/shutdown.png"));
      }

      #reboot {
              background-image: image(url("icons/reboot.png"));
      }
    '';
  };

  xdg.configFile."wlogout/icons" = {
    recursive = false;
    source = ./icons;
  };
}
