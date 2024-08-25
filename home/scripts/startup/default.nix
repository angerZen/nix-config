# File runned at startup by Hyprland
{
  pkgs,
  config,
  ...
}: let
  startup = pkgs.writeShellScriptBin "startup" ''
    # Startup is a script called by Hyprland on startup
    # Because HM enabling services suck.

    ${pkgs.waybar}/bin/waybar &
  '';
in {home.packages = [startup];}
