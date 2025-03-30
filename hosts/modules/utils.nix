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
    (vivaldi.overrideAttrs (old: {
      buildInputs = (old.buildInputs or [ ]) ++ [
        libsForQt5.qtwayland
        libsForQt5.qtx11extras
        kdePackages.plasma-integration.qt5
        kdePackages.kio-extras-kf5
        kdePackages.breeze.qt5
      ];
    }))
  ];
}
