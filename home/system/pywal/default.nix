{config, ...}: {
  home.packages = with pkgs; [
    pywal
  ];
  xdg.configFile."wal/templates/colors-hyprland.conf".text = ''
    $color2 = rgb({color2.strip})
    $color3 = rgb({color3.strip})
    $color4 = rgb({color4.strip})
    $color5 = rgb({color5.strip})
  '';
}
