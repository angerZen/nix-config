{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      include = "~/.cache/wal/colors-kitty.conf";
      scrollback_lines = 10000;
      initial_window_width = 1200;
      initial_window_height = 600;
      update_check_interval = 0;
      enable_audio_bell = false;
      confirm_os_window_close = "0";
      remember_window_size = "no";
      disable_ligatures = "never";
      url_style = "curly";
      cursor_shape = "Underline";
      cursor_underline_thickness = 2;
      window_padding_width = 4;

      # Font
      font_family = "Inconsolata Nerd Font";
      font_size = 14;
    };
  };
}
