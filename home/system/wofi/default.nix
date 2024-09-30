{config, ...}: {
  programs.wofi = {
    enable = true;

    settings = {
      allow_markup = true;
      width = 450;
      show = "drun";
      prompt = "Apps";
      normal_window = true;
      layer = "top";
      term = "foot";
      height = "305px";
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = false;
      allow_images = true;
      image_size = 24;
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = true;
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;
      key_expand = "Tab";
      key_exit = "Escape";
    };

    style = ''
      @import '../../.cache/wal/colors-waybar.css
        /** ********** Fonts ********** **/

        * {
          font-family: "Noto Sans";
          font-weight: 500;
          font-size: 20px;
        }

        #window {
          background-color: @color9;
          color: @color2;
          border-radius: 10px;
        }

        #outer-box {
          padding: 20px;
        }

        #input {
          background-color: @background;
          border: 0px solid @color3;
          padding: 8px 12px;
        }

        #scroll {
          margin-top: 20px;
        }

        #inner-box {}

        #img {
          padding-right: 8px;
        }

        #text {
          color: @color8;
        }

        #text:selected {
          color: @background;
        }

        #entry {
          padding: 6px;
        }

        #entry:selected {
          background-color: @color9;
          color: @color2;
        }

        #unselected {}

        #selected {}

        #input,
        #entry:selected {
          border-radius: 10px;
        }
    '';
  };
}
