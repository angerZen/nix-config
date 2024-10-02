{pkgs, ...}: {
  programs.pywal.enable = true;
  xdg.configFile."wal/templates/colors-hyprland.conf".text = ''
    {background}

    $foreground = rgb({foreground.strip})
    $background = rgb({background.strip})
    $wallpaper = rgb({wallpaper.strip})

    $color0 = rgb({color0.strip})
    $color1 = rgb({color1.strip})
    $color2 = rgb({color2.strip})
    $color3 = rgb({color3.strip})
    $color4 = rgb({color4.strip})
    $color5 = rgb({color5.strip})
    $color6 = rgb({color6.strip})
    $color7 = rgb({color7.strip})
    $color8 = rgb({color8.strip})
    $color9 = rgb({color9.strip})
    $color10 = rgb({color10.strip})
    $color11 = rgb({color11.strip})
    $color12 = rgb({color12.strip})
    $color13 = rgb({color13.strip})
    $color14 = rgb({color14.strip})
    $color15 = rgb({color15.strip})
    {background}

    $foreground = rgb({foreground.strip})
    $background = rgb({background.strip})
    $wallpaper = rgb({wallpaper.strip})

    $color0 = rgb({color0.strip})
    $color1 = rgb({color1.strip})
    $color2 = rgb({color2.strip})
    $color3 = rgb({color3.strip})
    $color4 = rgb({color4.strip})
    $color5 = rgb({color5.strip})
    $color6 = rgb({color6.strip})
    $color7 = rgb({color7.strip})
    $color8 = rgb({color8.strip})
    $color9 = rgb({color9.strip})
    $color10 = rgb({color10.strip})
    $color11 = rgb({color11.strip})
    $color12 = rgb({color12.strip})
    $color13 = rgb({color13.strip})
    $color14 = rgb({color14.strip})
    $color15 = rgb({color15.strip})
  '';

  # home.packages = with pkgs; [
  #   pywal16
  # ];
}
