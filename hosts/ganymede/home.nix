{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/btop
    ../../home/programs/kitty
    ../../home/programs/neofetch
    ../../home/programs/lf
    ../../home/programs/git
    ../../home/programs/vscode
    ../../home/programs/discord
    ../../home/programs/games

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/mako
    ../../home/system/gtk
    ../../home/system/zathura
    ../../home/system/hyprland
    ../../home/system/waybar
    ../../home/system/wlogout
    ../../home/system/wofi
    ../../home/system/udiskie
    ../../home/system/pywal
  ];

  home = {
    inherit (config.var) username;
    inherit (config.var) homeDirectory;

    packages = with pkgs; [
      xfce.thunar
      proton-pass
      vlc
      brave

      # Dev
      nixd
      alejandra
      nixfmt-rfc-style

      # Utils
      zip
      unzip
      glow
      optipng
      pfetch
      pandoc
      pamixer
      pavucontrol
      swww
      waypaper

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
    ];

    # Import wallpapers into $HOME/wallpapers
    file."Pictures/wallpapers" = {
      recursive = true;
      source = ../../home/wallpapers;
    };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
