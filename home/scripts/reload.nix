{pkgs, ...}: let
  reload = pkgs.writeShellScriptBin "reload" ''
    hyprctl reload &
    pkill -SIGUSR2 waybar &
    reload-discord &
    pkill mako && setsid mako -c /home/angerzen/.cache/wal/mako.conf &
  '';
in {
  home.packages = [reload];
}
