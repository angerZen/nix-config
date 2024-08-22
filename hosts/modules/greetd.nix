{ pkgs, ... }: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command =
          "Hyprland";
        user = "angerZen";
      };
    };
  };
}
