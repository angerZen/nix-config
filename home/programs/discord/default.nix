{pkgs, ...}:
 let
   xwaylandvideobridge = with pkgs;
   with libsForQt5;
     stdenv.mkDerivation {
       name = "xwaylandvideobridge";
       version = "unstable";
       patches = [
         (pkgs.fetchpatch {
           # fix on sway (and hyprland)
           url = "https://aur.archlinux.org/cgit/aur.git/plain/cursor-mode.patch?h=xwaylandvideobridge-cursor-mode-2-git";
           hash = "sha256-649kCs3Fsz8VCgGpZ952Zgl8txAcTgakLoMusaJQYa4=";
         })
       ];
       src = fetchFromGitLab {
         domain = "invent.kde.org";
         owner = "system";
         repo = "xwaylandvideobridge";
         rev = "76744c960ead31c3ef56eb20b36190aa63ecfe94";
         hash = "sha256-hu9h6FSsznfdN3s59StR39vrQFQOUg7LI4L+j23E78U=";
       };
       nativeBuildInputs = [wrapQtAppsHook pkg-config cmake extra-cmake-modules];
       buildInputs = [kpipewire qtx11extras ki18n kwidgetsaddons knotifications kcoreaddons];
     };
  in
{
     nixpkgs.overlays = [
        (self: super: {
          discord = super.discord.overrideAttrs (
            _: { src = builtins.fetchTarball https://discord.com/api/download?platform=linux&format=tar.gz; }
          );
        })
        (final: prev: {
          vivaldi =
          (prev.vivaldi.overrideAttrs (oldAttrs: {
            dontWrapQtApps = false;
            dontPatchELF = true;
            nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
            }))
            .override {
              commandLineArgs = ''
              --enable-features=UseOzonePlatform
              --ozone-platform=wayland
              --ozone-platform-hint=auto
              --enable-features=WaylandWindowDecorations
              '';
            };
          })
     ];

  home.packages = with pkgs; [
    xdg-utils
    xwaylandvideobridge
    discord
    # vesktop
  ];
}