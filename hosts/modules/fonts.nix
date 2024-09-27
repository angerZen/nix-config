{
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      material-icons
      material-design-icons
      roboto
      work-sans
      comic-neue
      source-sans
      twemoji-color-font
      comfortaa
      inter
      lato
      lexend
      jost
      dejavu_fonts
      iosevka-bin
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      jetbrains-mono
      (nerdfonts.override {fonts = ["FiraCode" "Meslo"];})
      openmoji-color
    ];

    enableDefaultPackages = false;

    fontconfig = {
      defaultFonts = {
        monospace = ["Inconsolata Mono" "Noto Color Emoji"];
        sansSerif = ["Inconsolata Nerd Font" "Noto Color Emoji"];
        serif = ["Inconsolata Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
