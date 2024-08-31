{pkgs, ...}: let
  wallpaper-picker-dmenu = pkgs.writeShellScriptBin "wallpaper-picker-dmenu" ''
    launcher="rofi -dmenu"
    wallpaper_daemon="swww img"
    wallpaper_folder=$HOME/Pictures/wallpapers
  '';
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" ''
    waypaper
    wallpaper_daemon=$wallpaper_daemon
    wallpaper_location=$(sed -n 4p .config/waypaper/config.ini | cut -d' ' -f 3)
    $wallpaper_daemon $wallpaper_location
    wal -i $wallpaper_location && reload &
  '';
in {
  home.packages = with pkgs; [
    wallpaper-picker-dmenu
    wallpaper-picker
  ];
}
