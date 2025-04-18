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
    XDG_DATA_HOME = "$HOME/.local/share";
    PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
    EDITOR = "vscode";
    QT_QPA_PLATFORM = "wayland;xcb";
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
  ];
}
