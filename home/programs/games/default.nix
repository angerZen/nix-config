{pkgs, ...}: {
  home-manager.users.angerzen = {
    home.packages = with pkgs; [
      lutris
      protonup-qt
      protontricks
      wine
      obs-studio
    ];
  };
}
