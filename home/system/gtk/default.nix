{pkgs, ...}: {
  imports = [./theme.nix];
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Mocha-Sapphire";
      package =
        pkgs.catppuccin-gtk.override
        {
          accents = ["sapphire"];
          variant = "mocha";
        };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "SFProDisplay Nerd Font";
      size = 12;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "Catppuccin-Mocha-Dark";
    size = 14;
  };

  home.sessionVariables = {
    GTK_USE_PORTAL = 1;
    GTK_THEME = "Catppuccin-Mocha-Sapphire";
  };
}
