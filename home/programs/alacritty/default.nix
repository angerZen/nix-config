{pkgs, ... }:{
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "${pkgs.zsh}/bin/zsh";
      scrolling.history = 10000;
      font = {
        size = 14;
      };
    };
  };
}