{pkgs, ...}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {ignore_dbus_inhibit = false;};
      listener = [
        {
          timeout = 600;
          on-timeout = pkgs.hyprlock + "/bin/hyprlock";
        }

        {
          timeout = 605;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
