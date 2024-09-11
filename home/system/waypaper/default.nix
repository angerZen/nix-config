{pkgs, ...}: {
  home.packages = with pkgs; [
    waypaper
    swww
  ];

  home.file.".config/waypaper/config.ini".source = ./config.ini;
}
