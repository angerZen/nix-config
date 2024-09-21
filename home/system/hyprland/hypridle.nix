{
  pkgs,
  lib,
  ...
}: let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    # check if any player has status "Playing"
    ${lib.getExe pkgs.playerctl} -a status | ${lib.getExe pkgs.ripgrep} Playing -q
    # only suspend if nothing is playing
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in {
  services.hypridle = {
    enable = true;
    settings = {
      general = {ignore_dbus_inhibit = false;};
      listener = [
        {
          timeout = 300;
          on-timeout = pkgs.hyprlock + "/bin/hyprlock";
        }

        {
          timeout = 600;
          on-timeout = suspendScript.outPath;
        }
      ];
    };
  };
}
