# PDF viewer
{
  programs.zathura = {
    enable = true;

    options = {
      guioptions = "v";
      adjust-open = "width";
      statusbar-basename = true;
      render-loading = false;
      scroll-step = 120;

      # highlight-color = ");
      # highlight-active-color = mkForce (rgba "base0D");
    };
  };
}
