{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      clock = true;
      screenshots = true;
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 7;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      ring-color = "3b4252";
      key-hl-color = "880033";
      line-color = "00000000";
      inside-color = "00000088";
      separator-color = "00000000";
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "after-resume";
        command = "hyprctl dispatch dpms on";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock-effects}/bin/swaylock";
      }
      {
        timeout = 600;
        command = "swaymsg 'output * dpms off'";
        resumeCommand = "swaymsg 'output * dpms on'";
      }
    ];
  };

  systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];
}
