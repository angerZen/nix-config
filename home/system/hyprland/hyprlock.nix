{config, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 5;
        no_fade_in = true;
        no_fade_out = true;
      };

      background = {
        monitor = "";
        path = "$(sed -n 4p .config/waypaper/config.ini | cut -d' ' -f 3)";
        color = "$(sed -n 1p .cache/wal/colors)";
        blur_size = 4;
        blur_passes = 3;
      };

      input-field = [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 3;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.64; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "$(sed -n 7p .cache/wal/colors)";
          inner_color = "$(sed -n 1p .cache/wal/colors)";
          font_color = "$(sed -n 8p .cache/wal/colors)";
          fade_on_empty = true;
          placeholder_text = "Password..."; # Text rendered in the input box when it's empty.
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Current time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"'';
          color = "$(sed -n 8p .cache/wal/colors)";
          font_size = 64;
          font_family = "SFProDisplay Nerd Font";
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
        # User label
        {
          monitor = "";
          text = ''
            Hey <span text_transform="capitalize" size="larger">$USER</span>'';
          color = "$(sed -n 8p .cache/wal/colors)";
          font_size = 22;
          font_family = "SFProDisplay Nerd Font";
          position = "0, 50";
          halign = "center";
          valign = "center";
        }
        # Type to unlock
        {
          monitor = "";
          text = "Type to unlock!";
          color = "$(sed -n 8p .cache/wal/colors)";
          font_size = 18;
          font_family = "SFProDisplay Nerd Font";
          position = "0, 30";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
