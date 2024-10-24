{pkgs, ... }:{
  programs.alacritty = {
    enable = true;
    settings = {
      scrolling.history = 10000;
      font = {
        size = 14;
      };
    };
  };
}