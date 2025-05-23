{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/btop
    # ../../home/programs/vivaldi
    ../../home/programs/alacritty
    ../../home/programs/git
    ../../home/programs/discord
    ../../home/programs/games
    ../../home/programs/starship
    ../../home/programs/zsh

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/mako
    # ../../home/system/gtk
    ../../home/system/zathura
    # ../../home/system/hyprland
    ../../home/system/waybar
    # ../../home/system/wlogout
    ../../home/system/wofi
    ../../home/system/udiskie
    ../../home/system/pywal
    # ../../home/system/wallust
    ../../home/system/waypaper
  ];

  home = {
    inherit (config.var) username;
    inherit (config.var) homeDirectory;

    packages = with pkgs; [
      proton-pass
      protonmail-desktop
      vlc
      firefox
      vscode

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
      swappy
      imv
      dconf
      rocketchat-desktop
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
