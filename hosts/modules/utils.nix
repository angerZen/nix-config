{
  pkgs,
  config,
  ...
}: {
  networking.hostName = config.var.hostname;

  services = {
    xserver = {
      enable = true;
      xkb.layout = config.var.keyboardLayout;
      xkb.variant = "";
    };
  };
  console.keyMap = config.var.keyboardLayout;

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    MOZ_ENABLE_WAYLAND = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0.8";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };

  services.libinput.enable = true;
  programs.dconf.enable = true;
  programs.direnv.enable = true;
  services.dbus.enable = true;
  programs.appimage.binfmt = true;

  # Faster rebuilding
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
  };

  environment.systemPackages = with pkgs; [
    fd
    bc
    gcc
    git
    git-ignore
    xdg-utils
    wget
    curl
    gparted
    keymapp
    ncdu
  ];
}
