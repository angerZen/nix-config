{ pkgs, config, ... }: {

  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/btop
    ../../home/programs/cava
    ../../home/programs/kitty
    ../../home/programs/firefox
    ../../home/programs/fetch
    ../../home/programs/lf
    ../../home/programs/git
    ../../home/programs/vscode

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/dunst
    ../../home/system/gtk
    ../../home/system/zathura
    ../../home/system/hyprland
    ../../home/system/waybar
    ../../home/system/wlogout
    ../../home/system/wofi
    ../../home/system/udiskie
  ];

  home = {
    inherit (config.var) username;
    inherit (config.var) homeDirectory;

    packages = with pkgs; [
      discord
      xfce.thunar
      proton-pass
      vlc

      # Dev

      # Utils
      zip
      unzip
      glow
      optipng
      pfetch
      pandoc
      pamixer
      pavucontrol

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
    ];

    # Import wallpapers into $HOME/wallpapers
    file."wallpapers" = {
      recursive = true;
      source = ../../home/wallpapers;
    };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
