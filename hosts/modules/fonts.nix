{
  pkgs,
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
      noto-fonts-cjk-sans
      noto-fonts-emoji
      jetbrains-mono
      nerd-fonts.inconsolata
      nerd-fonts.space-mono
      openmoji-color
      font-awesome_5
    ];

    enableDefaultPackages = false;

    fontconfig = {
      defaultFonts = {
        monospace = ["Inconsolata Nerd Font" "Noto Color Emoji"];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
