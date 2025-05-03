{pkgs, ...}: {
  home.packages = with pkgs; [
    wallust
  ];
  xdg.configFile."wallust/wallust.toml".text = ''
    # wallust configuration - for wallust version 3.0

    # How the image is parse, in order to get the colors:
    # full - resized - wal - thumb -  fastresize - kmeans
    backend = "kmeans"

    # What color space to use to produce and select the most prominent colors:
    # lab - labmixed - lch - lchmixed
    color_space = "labmixed"

    # NOTE: All filters will fill 16 colors (from color0 to color15), 16 color
    #       variations are the 'ilusion' of more colors by opaquing color1 to color5.
    # Use the most prominent colors in a way that makes sense, a scheme:
    #  * dark        - 8 dark colors, dark background and light contrast
    #  * dark16      - Same as `dark` but uses the 16 colors trick
    #  * harddark    - Same as `dark` with hard hue colors
    #  * harddark16  - Harddark with 16 color variation
    #  * light       - Light bg, dark fg
    #  * light16     - Same as `light` but uses the 16 color trick
    #  * softdark    - Variant of softlight, uses the lightest colors and a dark
    #                   background (could be interpreted as `dark` inversed)
    #  * softdark16  - softdark with 16 color variation
    #  * softlight   - Light with soft pastel colors, counterpart of `harddark`
    #  * softlight16 - softlight with 16 color variation
    palette = "dark16"

    # Difference between similar colors, used by the colorspace:
    #  1          Not perceptible by human eyes.
    #  1 - 2      Perceptible through close observation.
    #  2 - 10     Perceptible at a glance.
    #  11 - 49    Colors are more similar than opposite
    #  100        Colors are exact opposite
    threshold = 11

    [templates]
    cava.template = 'colors-cava'
    cava.target = '~/.config/cava/config'

    hypr.template = 'colors-hyprland.conf'
    hypr.target = '~/.config/wallust/wallust-hyprland.conf'

    waybar.template = 'colors-waybar.css'
    waybar.target = '~/.config/wallust/colors-waybar.css'

    #kitty.template = 'colors-kitty.conf'
    #kitty.target = '~/.config/kitty/kitty.conf'

    #swaync.template = 'colors-swaync.css'
    #swaync.target = '~/.config/swaync/wallust/colors-wallust.css'

    #macchina.template = 'colors-macchina.toml'
    #macchina.target = '~/.config/macchina/themes/wallust.toml'

    #wezterm.template = 'colors-wezterm.toml'
    #wezterm.target = '~/.config/wezterm/colors/wallust.toml'

    #zathura.template = 'colors-zathura'
    #zathura.target = '~/.config/zathura/zathurarc'
  '';
  xdg.configFile."wallust/templates/colors-hyprland.conf".text = ''
    $background = rgb({{background | strip}})
    $foreground = rgb({{foreground | strip}})
    $color0 = rgb({{color0 | strip}})
    $color1 = rgb({{color1 | strip}})
    $color2 = rgb({{color2 | strip}})
    $color3 = rgb({{color3 | strip}})
    $color4 = rgb({{color4 | strip}})
    $color5 = rgb({{color5 | strip}})
    $color6 = rgb({{color6 | strip}})
    $color7 = rgb({{color7 | strip}})
    $color8 = rgb({{color8 | strip}})
    $color9 = rgb({{color9 | strip}})
    $color10 = rgb({{color10 | strip}})
    $color11 = rgb({{color11 | strip}})
    $color12 = rgb({{color12 | strip}})
    $color13 = rgb({{color13 | strip}})
    $color14 = rgb({{color14 | strip}})
    $color15 = rgb({{color15 | strip}})
  '';
}
