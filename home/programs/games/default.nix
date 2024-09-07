{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    lutris
    winetricks
    protonup-qt
    protontricks
    wine
    obs-studio
    inputs.nix-citizen.packages.${system}.star-citizen
  ];
}
