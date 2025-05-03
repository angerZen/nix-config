{
  pkgs,
  config,
  ...
}: {
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    hyprlock.enable = true;
  };
  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = true;
  };
  security = {
    sudo.wheelNeedsPassword = false;
    pam.services = {
      hyprlock = {};
    };
  };

  services.displayManager = {
    sessionPackages = [pkgs.hyprland];
    autoLogin.enable = true;
    autoLogin.user = "${config.var.username}";
  };
}
