{
  pkgs,
  config,
  ...
}: {
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.cursorBlinking" = "expand";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.cursorStyle" = "line";
      "editor.fontFamily" = "Fira Code";
      "editor.fontSize" = 12;
      "editor.lineHeight" = 1.3;
      "editor.minimap.enabled" = false;
      "editor.mouseWheelZoom" = false;
      "tabnine.experimentalAutoImports" = true;
      "terminal.integrated.fontFamily" = "Fira Code";
      "editor.fontLigatures" = true;
      "terminal.integrated.fontSize" = 12;
      "window.menuBarVisibility" = "hidden";
      "window.zoomLevel" = 1;
      "workbench.colorTheme" = "Wal";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.productIconTheme" = "Tabler";
      "workbench.sideBar.location" = "left";
      "workbench.startupEditor" = "none";
      "workbench.statusBar.visible" = false;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };
    keybindings = [
      {
        "key" = "ctrl+shift+s";
        "command" = "editor.action.formatDocument";
        "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
      }
      {
        "key" = "shift+ctrl+down";
        "command" = "editor.action.insertCursorBelow";
        "when" = "editorTextFocus";
      }
      {
        "key" = "shift+ctrl+up";
        "command" = "editor.action.insertCursorAbove";
        "when" = "editorTextFocus";
      }
      {
        "key" = "shift+alt+down";
        "command" = "editor.action.copyLinesDownAction";
        "when" = "editorTextFocus";
      }
      {
        "key" = "shift+alt+up";
        "command" = "editor.action.copyLinesUpAction";
        "when" = "editorTextFocus";
      }
    ];
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      jnoortheen.nix-ide
      catppuccin.catppuccin-vsc-icons
    ];
  };
}
