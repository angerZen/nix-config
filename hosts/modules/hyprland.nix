{
  pkgs,
  config,
  inputs,
  ...
}: {
  programs = {
    hyprland = {
      enable = true;
      # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
