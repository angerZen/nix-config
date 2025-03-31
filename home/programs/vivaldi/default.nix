{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      (vivaldi.overrideAttrs (oldAttrs: {
        dontPatchELF = true;
        dontWrapQtApps = false;
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
      }))
    ];
}