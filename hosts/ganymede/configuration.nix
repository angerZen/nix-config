{config, ...}: {
  imports = [
    ../modules/fonts.nix
    ../modules/nvidia.nix
    # ../modules/greetd.nix
    # ../modules/hyprland.nix
    # ../modules/cosmic.nix
    ../modules/kde.nix
    ../modules/auto-upgrade.nix
    ../modules/timezone.nix
    ../modules/usb.nix
    ../modules/systemd-boot.nix
    ../modules/users.nix
    ../modules/audio.nix
    ../modules/bluetooth.nix
    ../modules/nix.nix
    ../modules/network-manager.nix
    ../modules/home-manager.nix
    ../modules/utils.nix
    ../modules/steam.nix

    ./hardware-configuration.nix
    ./variables.nix
  ];
  
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch this
  system.stateVersion = "24.05";
}
