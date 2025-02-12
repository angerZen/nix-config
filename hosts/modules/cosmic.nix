{
  pkgs,
  config,
  ...
}: {
  hardware.system76.enableAll = true;

  environment.systemPackages = with pkgs; [
    cosmic-bg
    cosmic-osd
    cosmic-term
    cosmic-edit
    cosmic-comp
    cosmic-store
    cosmic-randr
    cosmic-panel
    cosmic-icons
    cosmic-files
    cosmic-session
    cosmic-greeter
    cosmic-applets
    cosmic-settings
    cosmic-launcher
    cosmic-protocols
    cosmic-screenshot
    cosmic-applibrary
    cosmic-notifications
    cosmic-settings-daemon
    cosmic-workspaces-epoch
    xdg-desktop-portal-cosmic
  ];

  security = {
    sudo.wheelNeedsPassword = false;
    # pam.services = {
    #   cosmic = {};
    # };
  };

  services.displayManager = {
    sessionPackages = [pkgs.cosmic-session];
    autoLogin.enable = true;
    autoLogin.user = "${config.var.username}";
  };
}
